module mod12(input clk,rst,load,mode,input [3:0]din,output reg[3:0]dout);
	always@(posedge clk)
		if(rst)
			dout <= 4'd0;
		else if(load)
			dout <= din;
		else if(mode == 0)//down
			if(dout == 0)
				dout <= 4'd11;
			else
				dout <= dout - 1'd1;
		else
			if(dout == 4'd11)
				dout <= 4'd0;
			else
				dout <= dout + 1'd1;
endmodule
//=====================IF================================//
interface IF(input bit clk);
	 bit load,mode,rst;
	 bit[3:0]din;
	logic [3:0]dout;
	
	clocking wr_drv@(posedge clk);
		default input #1 output #1;
		output load,mode,rst;
		output din;
	endclocking
	
	clocking wr_mon@(posedge clk);
		default input #1 output #1;
		input load,mode,rst;
		input din;
	endclocking

	clocking rd_mon@(posedge clk);
		default input #1 output #1;
		input dout;
	endclocking
	
	modport wr_drv_mod(clocking wr_drv);
	modport wr_mon_mod(clocking wr_mon);
	modport rd_mon_mod(clocking rd_mon);
endinterface
//=====================transaction========================//
class trans;
	rand bit load,mode,rst;
	rand bit[3:0]din;
	logic [3:0]dout;
	
	static int c_rst;
	static int c_mode0;
	static int c_mode1;
	static int c_load;
	
	function void display(input string msg);
		$display("====================");
		$display("%s",msg);
		$display("\tcount of reset= %0d",c_rst);
		$display("\tcount of down= %0d",c_mode0);
		$display("\tcount of up= %0d",c_mode1);
		$display("\tcount of load= %0d",c_load);
		$display("\tdin= %0d",din);
		$display("\tdout= %0d",dout);
		$display("====================");
	endfunction

	function void post_randomize();
		if(this.rst == 1)
			rst++;
		if(this.load == 1)
			c_load++;
		if(this.mode == 0)
			c_mode0++;
		if(this.mode == 1)
			c_mode1++;
	endfunction
endclass

//=====================generartor======================//
class generator;
	mailbox #(trans) gen2wr;
	//virtual if.wr_drv_mod wr_drv_if;
	trans gen2trans;
	trans data2send;
	
	function new(mailbox #(trans) gen2wr);
		this.gen2wr = gen2wr;
		this.gen2trans = new;
	endfunction

	task start();
		fork
			begin
				for(int i = 0;i<no_of_transactions;i++)
					begin
						assert(gen2trans.randomize());
						data2send = new gen2trans;
						gen2wr.put(data2send);
					end
			end
		join_none
	endtask
endclass

//=======================wr driver====================//
class write_driver;
	virtual IF.wr_drv_mod wr_drv_if;
	mailbox #(trans)gen2wr;
	trans data2duv;
	
	function new(mailbox #(trans)gen2wr,virtual IF.wr_drv_mod wr_drv_if);
		this.gen2wr = gen2wr;
		this.wr_drv_if = wr_drv_if;
	endfunction

	virtual task start();
		fork
			forever 	
			begin
				drive();
				gen2wr.get(data2duv);
			end
		join_none
	endtask

	virtual task driver();
		@(wr_drv_if.wr_drv);
		wr_drv_if.wr_drv.din <= data2duv.din;
		wr_drv_if.wr_drv.mode <= data2duv.mode;
		wr_drv_if.wr_drv.load <= data2duv.load;
		wr_drv_if.wr_drv.rst <= data2duv.rst;
		
		repeat(2)@(wr_drv_if.wr_drv);
	endtask
emdclass
//=======================wr monitor===================//
class write_monitor;
	mailbox #(trans) wrmon2rm;
	virtual IF.wr_mon_mod wr_mon_if;
	trans data2send;
	trans data2rm;
	
	function new(mailbox #(trans) wrmon2rm,virtual IF.wr_mon_mod wr_mon_if);
		this.wrmon2rm = wrmon2rm;
		this.wr_mon_if = wr_mon_if;
		this.data2rm = new;
	endfunction

	virtual task start();
		fork 
			forever 	
			begin
				monitor();
				data2send = new data2rm;
				wrmon2rm.put(data2send);
			end
		join_none
	endtask 
	
	virtual task monitor();
		@(wr_mon_if.wr_mon);
		@(wr_mon_if.wr_mon);
		begin
			data2rm.mode = wr_mon_if.wr_mon.mode;
			data2rm.din = wr_mon_if.wr_mon.din;
			data2rm.load = wr_mon_if.wr_mon.load;
			data2rm.rst = wr_mon_if.wr_mon.rst;
			data2rm.display("wr momitor");
		end
	endtask			
endclass
//=========================rd monitor=====================//
class read_monitor;
	mailbox #(trans) rm2sb;
	virtual IF.rd_mon_mod rd_mon_if;
	trans data2send;
	trans data2sb;
	
	function new(mailbox #(trans) rm2sb,virtual IF.rd_mon_mod rd_mon_if);
		this.rm2sb = rm2sb;
		this.rd_mon_if = rd_mon_if;
		this.data2sb = new;
	endfunction

	virtual task start();
		fork
			forever
				begin
					monitor();
					data2send = new data2sb;
					rm2sb.put(data2send);
				end
		join_none
	endtask
	
	virtual task monitor();
		@(rd_mon_if.wr_mon);
		@(rd_mon_if.wr_mon);
		begin
			data2sb.dout = rd_mon_if.rd_mon.dout;
			//data2sb.din = wr_mon_if.wr_mon.din;
			//data2rm.load = wr_mon_if.wr_mon.load;
			//data2rm.rst = wr_mon_if.wr_mon.rst;
			data2rm.display("rd monitor");
		end
	endtask			
endclass
//======================Reference model================//
class rm;
	mailbox #(trans) rm2sb;
	mailbox #(trans) wrmon2rm;
	
	trans data2send;
	trans data2rm;
	
	function new(mailbox #(trans) wrmon2rm,mailbox #(trans)rm2sb);
		this.rm2sb = rm2sb;
		this.wrmon2rm = wrmon2rm;
		//this.data2rm = new;
	endfunction

	virtual task rm_data(trans t);
		if(t.rst)
			t.dout <= 4'd0;
		else if(t.load)
			t.dout <= din;
		else if(t.mode == 0)//down
			if(t.dout == 0)
				t.dout <= 4'd11;
			else
				t.dout <= t.dout - 1'd1;
		else
			if(t.dout == 4'd11)
				t.dout <= 4'd0;
			else
				t.dout <= t.dout + 1'd1;
	endtask


	virtual task start();
		fork
			forever begin
				wrmon2rm.get(data2rm);
				data2send = new data2rm;
				rm2sb.put(data2send);
			end	
		join_none
	endtask	
endclass
//==========================ScoreBoard====================//
class sb;
	mailbox #(trans) 	

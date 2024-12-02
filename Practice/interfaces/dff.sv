//--------------------DFF interface-----------------\\
interface dff_if(input clk);
logic d0,d1,sel,rst,q;
parameter thold = 2, tsetup = 4;
//from the pov of testbench
clocking cb @(posedge clk);
	default input #(tsetup) output #(thold);
	output  d0,d1,sel,rst;
	input q;
endclocking

//modport for design
modport DUV (input d0,d1,sel,rst,clk,output q);

//tasks to generate stimulas
task syn_rst;
	cb.rst <= 1'b1;
	cb.sel <= $random;
	cb.d0  <= 1'b1;
	cb.d1  <= 1'b0;
	repeat(2)
	@(cb);
	if(cb.q !== 0)
		begin
		$display("Reset is not working");
		end
	else
		$display("Reset is perfect");
endtask

task load_d0;
input data;
	cb.rst <= 1'b0;
	cb.sel <= 1'b0;
	cb.d0 <= data;
	cb.d1 <= ~data;
	repeat(2)
	@(cb);
	if(cb.q != data)
	begin
		$display("Load d0 not working");
	end
	else
		$display("Load d0 is working");
endtask
task load_d1;
input data;
	cb.rst <= 1'b0;
	cb.sel <= 1'b1;
	cb.d0 <=~data;
	cb.d1 <= data;
	repeat(2)
	@(cb);
	if(cb.q != data)
	begin
		$display("Load d1 not working");
	end
	else
		$display("Load d1 is working");
endtask


modport test (clocking cb,import task syn_rst());//import task load_d0(),import task load_d1());

endinterface


 
//-------design------//
module dff(dff_if.DUV duv1);
logic d;
//selecting the input
always@(*)
begin
	case(duv1.sel)
	  0:d = duv1.d0;
	  1:d = duv1.d1;
	  default d = 1'bx;
	endcase
end
always@(posedge duv1.clk)
begin
	if(duv1.rst)
		duv1.q <= 1'b0;
	else
		duv1.q <= d;
end
endmodule

module tb(dff_if.test test1);
initial
begin
	@(test1.cb);
	test1.syn_rst;
	//test1.load_d0(1);
	//test1.load_d1(0);
	#10 $finish;
end
endmodule


module top();
	bit clk;
	always #10 clk = ~clk;
	dff_if if1(clk);//calling interface
	dff RTL (if1);
	tb TB(if1);
endmodule


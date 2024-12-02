module mailbox_tb;
	class packet;//transcation class

		rand bit [3:0]addr,data;

	       function void display(input string s);
			$display("Input string : %s",s);
			$display("data : %b and addr = %b",data,addr);
		endfunction

		function void post_randomize();
				display("randomized data");
		endfunction				
	endclass

	// In class generator 
	class generator;
		packet p1,p11;
  		mailbox #(packet) gm;
		function new(mailbox #(packet) mp);
			this.gm = mp;
			p1 = new();
		endfunction			
		// In task start, within fork - join_none,
		task start;
			fork
		 
			repeat(10) begin
				
				assert(p1.randomize());
				p11 = new p1;//doing shallow copy
				gm.put(p11);
			end
			join_none
		endtask
	endclass
	// In class driver
	class driver;
	
		packet p2;
		mailbox #(packet) dm;
		// In constructor
		function new(mailbox #(packet) pm);
			this.dm = pm;
		endfunction

		task start;
			fork
			repeat(10) begin
				dm.get(p2);
				p2.display("Received");
				//$display("sdnckja");
				end
			join_none
		endtask
	endclass

	// In class env
	class env;
		mailbox #(packet) em = new();	
		generator g1;
		driver d1 ;
		function void build();
			// Create instance of generator and driver by passing mailbox as an input argument
			g1 = new(em);
			d1= new(em);
		endfunction
		// In task start
		task start;
			// call start task of generator and driver
			g1.start();
			d1.start();
		endtask
	endclass : env
	// Within initial block
	initial begin
		// Create an instance of env
		env e1 = new;
		// Call build and start task of env
		e1.build();
		e1.start();
	end
endmodule 


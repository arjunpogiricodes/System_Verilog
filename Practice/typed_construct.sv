class parent;
	int a = 10;
	virtual task d();
		$display("From parent");
	endtask
endclass

class child extends parent;
	int b = 21;
	task d();
		$display("From child");
	endtask
endclass

child c1,c2;
parent p1,p2;

module top();
	initial
	begin
		c1 = new();
		p1 = c1;
		p1.d();
		p2 = child :: new();
		p2.d();
	end
endmodule

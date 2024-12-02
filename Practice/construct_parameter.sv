class parent #(type p = int);
	p a;
	function new(p a);
		this.a = a;
		$display("%d",this.a);
	endfunction
endclass

class child#(type a1 = int) extends parent#(real)(7.7);
	a1 b;
endclass

child #(real) c1 = new();

module test();
	int c11;
	real c;
	initial
	begin
		 c = 13.33;

		 c11 = int'(13.33);
		$display("c = %d, c1 = %d",c,c1);	
		c1.b = 12.2;
		$display(c1);
	end
endmodule

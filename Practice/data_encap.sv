class parent_trans;
	local logic [1:0]a;//within the class
	protected logic [1:0]b;//within the hiearchy
	
	protected function void d();
		$display("a = %0d b = %0d ",a,b);
	endfunction
	
	function void update(logic [1:0]a,b);
		this.a = a;
		this.b = b;
	endfunction
endclass

class child extends parent_trans;
	logic [1:0]c;
	function void calc();
		super.d();
		//super.a = 2;//error
		super.b = 1;
	endfunction
endclass

module top();
	initial
	begin
		parent_trans p;
		child c;
		p = new();
		c = new();
	       //	p.a = 3 ;//error
		//p.b = 2;//error
		p.update(1,2);
		//p.d();//error
		$display(p);
		c.update(3,5);
		//c.d();//error if we are calling it directly
		c.calc();
	end
endmodule

		

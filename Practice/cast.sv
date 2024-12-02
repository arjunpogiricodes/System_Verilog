class parent;
	int a;
	virtual function void d();
		$display("from partent");
	endfunction
endclass

class child1 extends parent;
	int b;
	function void d();
		$display("from child1");
	endfunction
endclass

class child2 extends parent;
	int b1;
	function void d();
		$display("from child2");
	endfunction
endclass

parent p1;
child1 c11,c12;
child2 c21;

module top();
	initial
	begin
	 	p1 = new();
		c11 = new();
		c21 = new();
		//c12 = new();
		//c11 = p1;
	//	p1 = c11;
		$cast(c11, c21);
	//	if($cast(c11,p1))
	//		$display("lll");
	end
endmodule



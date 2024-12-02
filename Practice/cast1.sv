class S;
	virtual function void disp();
		$display("This is a shape");
	endfunction
endclass

class C extends S;
	function void disp();
		$display("This is a circle");
	endfunction
endclass

class Q extends S;
	function void disp();
		$display("This is a square");
	endfunction
endclass

module test;
	S s;	
	C c,c1;
	Q q;
initial begin
		s = new();
		c = new();
        	c1=new();
		q = new();

		s = c;
		s.disp();

		s = q;
		s.disp();
			if($cast(c,s)) begin
			$display("cast done to circle");
			c.disp();
		end
		else begin
			$display("cast failed");
		end
	end
endmodule

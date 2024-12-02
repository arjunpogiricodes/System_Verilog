class parent;
	rand bit [3:0] a;
	constraint a_cons {soft  a>10;}
endclass

parent p;

module top();
	initial begin
	p = new();
	repeat(2)
		begin
			p.randomize() with {soft  a<5;};
			$display(p);
		end
	end
endmodule

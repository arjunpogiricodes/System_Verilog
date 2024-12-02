class base;
	rand bit [3:0] a;
	constraint v {a>10;}
endclass

constraint base :: v{a<10;}
//constraint base :: v1{a<2;}
module test();
	initial begin
	base b1;
	b1 = new;
	repeat(2)
	begin
		b1.randomize()with {a<3;};
		$display(b1);
	end
	end
endmodule

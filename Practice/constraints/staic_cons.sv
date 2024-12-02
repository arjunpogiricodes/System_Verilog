class base;
	rand int a;
	static constraint c {a>10;};
endclass

class child extends base;
	//rand int a;
	constraint  c {a<0;a>-10;}
endclass

child c1;
base b1;

module test();
	initial
	begin
	c1 = new;
	b1 = new;
	c1.randomize();
	$display(c1);
	b1.randomize();
	$display(b1);

	end
endmodule

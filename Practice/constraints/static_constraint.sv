class base;
	rand int a;
	static constraint valid {a>8;}
endclass

base b1;

mmodule test();
	initial
	begin
		b1.randomize();

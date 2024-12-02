/*class base;
	rand struct {rand int b;rand int c;} a;
	rand enum{k,j}e;
endclass

base b;

module test();
	initial begin
		b = new;
		b.randomize();
		$display(b);
		b.randomize();
		$display(b);

	end
endmodule*/
class base;
	rand int unsigned a;
	//nd int b;
	constraint c {a <10;}

endclass

base b1;

module teset();
	initial
	begin
	b1 = new();
	b1.a.rand_mode(0);
	if(b1.a.rand_mode())
		b1.a = 12;
		//$display("tt");
	else
		$display("randomization : nope");

	b1.randomize();
	$display(b1.a);	
	end
endmodule

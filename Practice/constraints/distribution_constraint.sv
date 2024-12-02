class base;
	rand int a;
	constraint c {a dist {7:=1,[11:20]:=1,[26:30]:/1};}
endclass
base b1;

module test();
	initial
	begin
		b1 = new;
		repeat(18)
		begin
		b1.randomize();
		$display(b1.a);
		end
	end
endmodule

class base;
	rand bit a;
	rand bit[2:0]b;
	constraint valid{(a==0)->(b==0);solve a before b;}
endclass

base b1;

module test();
	initial
	begin
		b1 = new;
		repeat(3)
		begin
		b1.randomize();
		$display(b1);
		end
	end
endmodule

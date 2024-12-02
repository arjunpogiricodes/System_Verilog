class parent;
	randc int a,b,c;
	constraint random_9to99 {1<=a;a<=10;b == a-1;c == 9*a+b;}
	constraint random_9to999 {1<=a;a<=100;b == a-1;c == 9*a+b;}

endclass

parent p;

module top();
	int result [int];

	initial begin
		p = new();
		repeat(12)
		begin
			p.randomize();
			$display("value : %0d",p.c);
			//$display(p);
		end
		$display("9 to 999");
		p.random_9to99.constraint_mode(0);
		repeat(120)
		begin
			p.randomize();
			$display("value : %0d",p.c);
			//$display(p);
			result[p.c] = 1;
		end
		$display("size of result  %0d",result.size());

	end
endmodule

class base;
	rand bit a;
	rand bit b;
	constraint valid{(a==0) -> (b==0);solve b before a;}
endclass

base b1;

module test();
	initial begin
		repeat(10) begin
		b1 = new();
		b1.randomize();
		$display(b1);
		end
	end
endmodule

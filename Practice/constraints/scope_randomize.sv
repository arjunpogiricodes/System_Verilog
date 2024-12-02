module test();
	int a,b;
	bit c;
	initial begin
		std::randomize(a,b) with{a==0;b==1;};
	$display(a,b);
	end
endmodule

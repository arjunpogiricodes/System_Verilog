module test;
	function automatic int  fun(ref int a);
		fun = a*2;
	endfunction	
	int a= 3;
	int s[] = {1,2,3,9};
	initial
		begin
			//a= 3;
			$display(fun(a));
			$display("%d %g",a,a);
			$display("%p",s);
		end

endmodule

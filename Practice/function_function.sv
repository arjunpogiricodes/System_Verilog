
function automatic int f(ref int a);
		a = a +1;
		return (a);
endfunction

module top();
int c = 11;
	initial
	begin
		//c =f();
		$display("Before calling function %d",c);
		$display("%d",f(c));
		$display("After function calling %d",c);
	end
endmodule

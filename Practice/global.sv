class trans;
	const int a;
	function new(int a);
		this.a = a;
	endfunction
endclass

trans t1,t2;
module top();
initial
begin

	t1 = new(12);
	$display(t1.a);
	//t2 = new();
	//$display(t2.a);
end
endmodule

class trans;
	static int c = 0;
	int id;
		
	function new();
	//	c++;
		id = c++;
	endfunction
endclass

trans t1,t2;

module teset();
	initial begin
		t1 = new;
		t2 = new;
		$display(t1);
		$display(t2);
	end
endmodule

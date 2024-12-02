/*module test;
	int a[];
	int b[];
	int mem[int];
	int idx;
	initial begin
		a = new[10];
		foreach(a[i]) begin
			a[i] = i+1;
			mem[i] = a[i];
		end
		$display("%p",a);
		//b = new[15](a);
		$display("%p",mem);
		
		mem.first(idx);	
		$display("mem[idx] :%0d,idx :%0d",mem[idx],idx);
		mem.prev(idx);
		$display("mem[idx] :%0d,idx :%0d",mem[idx],idx);

	end
endmodule*/
module teset;
	function automatic int fun(ref int x);
			x = x+1;
			$display(x);
			return x;
	endfunction
	
	int a;
	initial begin
		a = 2;
		fun(a);
		$display(a);
	end
endmodule

module tb();
	typedef struct{int q[$];} s;
	
	function automatic int factor(input int x);
		if(x != 0) begin
			//$display("From ",x);
			return x * factor(x-1);
			end
		else
			return 1;
	endfunction

	/*
	function s out();
		for(int i = 0;i<10;i++)
			if(i%2 == 0)
				out.q.push_back(factor(i));
		//$display(out.q);
	endfunction
	*/
// static  function  in vcs o/p is 1 and questa is fact
	function  int rf( int x);
		if(x <=1) begin
			return 1;
			end
		else begin
			return x * rf(x-1);
			end
	endfunction


/*	longint c = 1;
	function int rf1(input int a);
		if (a >0)
		begin
			c = c *a;
			a =a-1;
			rf1(a);	
		end
		else
			return c;
	endfunction */
	
	initial
	begin 
		s sol;
		$display("Static function output : %d",rf(5));
		//c =1;
		//$display("Static function output : %d",rf1(4));
		//$display("Automatic function output : %d",factor(5));
		//sol = out();
		//$display(sol.q);
	end 
	
endmodule

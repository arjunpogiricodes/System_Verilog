module test;
	class packet;
		rand int s;
		rand int e;
		constraint v{e == add(e);}
		function int add(int s);
			if(s%2 == 0)
				add = s;
			else
				add = 0;
		endfunction

		
	endclass
	initial begin
		packet p;
		repeat(10) begin
		p  = new();
		p.randomize();
		$display(p);
		end
	end
endmodule

class base;
	rand int a;
	/*
	function int ones(int a);
		int c;
		for(int i =0;i<32;i++)
			begin
			if(a%2 != 0)
				begin
				c++;
				//a>>1;
				end
			else
				a>>1;
			end
		if(c==9)
			ones =a;
		else 
			ones =0;
	endfunction*/
	//constraint a_c1{a == ones(a);}
	constraint a_c {$countones(a) == 9;}
endclass

base b1;

module test();
	
	initial
	begin
		repeat(4) begin
		b1 = new;
		b1.randomize();
		$display("%b",b1.a); 
		end
		foreach(b1.a[i])
			$write("%0b \t",b1.a[i]);
		
				
	end
endmodule
			

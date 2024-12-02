class base;
	rand int unsigned a;
	rand int c;

  	function automatic int even (int x);
		return x ;
	endfunction

       constraint even_c {even(a)==0;}
endclass

base b1;

module test();
	
	initial
	begin
		
		b1 =new;
		if (b1.randomize()) 
		begin 
            		$display("Value of a: %d", b1.a); 
            		//$display("Binary representation of a: %b", b1.c); 
        	end 
		else 
            		$display("Randomization failed!"); 				
	end
endmodule
			

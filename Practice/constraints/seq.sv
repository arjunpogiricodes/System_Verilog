//101101110
class base;
	rand bit a;
	int b;
	int c = -1;
	int ci;	
	function void pre_randomization();
		if (b==0)
			a = 1;
	endfunction

	constraint p{if( b == ci + (3+c) || b == 1) a== 0;else a==1;}
	
	function void post_randomize();
			b++;
			if(a==0)
				begin
				c++;
				ci = b-1;
				end
			
			
	endfunction
endclass

base b1;
	
module test;
	initial begin
		b1 = new;
		repeat(20)begin
			b1.randomize;
			$display(b1.a);
		end
	end
endmodule

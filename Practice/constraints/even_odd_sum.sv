
class base;
       //	rand bit[3:0] d1[],d2[];
	rand int d1[],d2[];
rand int even;
rand int odd;
	
	constraint size_c {d1.size == d2.size;d1.size  == 3;}//inside {[5:10]};}
	constraint even_c {even == (d1.sum with ((item%2 == 0)*item)) +( d2.sum with ((item%2 == 0)*item));}
	constraint odd_c {odd ==(d1.sum with ((item%2 != 0)?item:0)) +( d2.sum with ((item%2 != 0)?item:0));}

	function void post_randomize();
		//even = d1.sum with ((item%2 == 0)*item) + d2.sum with ((item%2 == 0)*item);

		//odd = d1.sum with ((item%2 != 0)*item) + d2.sum with ((item%2 != 0)*item);
		//$display(d1.sum,d2.sum);

	endfunction

endclass

base b1;

module test();
	initial begin
		b1 = new;
		b1.randomize();
		$display(b1);
		b1=new;
		b1.randomize();
		$display(b1);

	end
endmodule 

//prime number 
class base1;
	rand int a[];
	
	constraint size_c {a.size() == 100;}
	constraint prime_c{foreach(a[i]) if(prime(i+1))a[i] == i+1;else a[i]==0;}
	
	function  bit prime(int  x);
		int c;
		for(int i=1;i<x;i++)
			if(x%i == 0)
				c++;
		if(c==1)
			prime = 1;
		else
			prime=0;
	endfunction

	function void post_randomize();	
		int o[$];
		foreach(a[i])
		begin
			if(a[i]!=0)
				o.push_back(a[i]);
		end
		a = o;			
	endfunction
endclass

class base;
	//base1 p_h = new();
	rand int c[20];
	constraint power_2{foreach(c[i]) c[i] == 2**i;}	
	randc byte unsigned a[3][3];
	//constraint f_c {f inside {[1:100]};}
	constraint row1{foreach(a[i,j]) if(i==2) a[i][j]%5==0;else if(i==0) a[i][j] inside{c};}
		
	
endclass

base b1;
base1 p_h;
module test();
	initial
	begin
		b1 = new;
		p_h =new;
		p_h .randomize();
		b1.randomize() with {foreach(a[i,j]) if (i==1) a[i][j] inside{p_h.a} ;};
		//$display(b1.c);
		foreach(b1.a[i,j])begin
			$write("%0d \t",b1.a[i][j]);
			if(j==2)
				$display("");
		end
	end
endmodule

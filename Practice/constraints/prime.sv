class base;
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

base b1;

module test();
	initial  begin
		b1 = new;
		b1.randomize();
		$display(b1.a);
	end
endmodule

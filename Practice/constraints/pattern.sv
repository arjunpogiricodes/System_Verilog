//pattern 0 1 0 2 0 3 0 4 ...
/*//using pre and post randomize
class base;
	randc int  unsigned a;
	int unsigned b;
	constraint pattern{if(b%2!=0) a == 0;if(b%2 == 0) a==b/2;}
	
	function void pre_randomize();
			b++;
	endfunction

endclass

base bh;

module test();
	initial
	begin
		bh = new;
		repeat(15)
		begin
			bh.randomize();
			$display(bh.a);
		end
	end
endmodule
*/
//pattern 0 1 0 2 0 3 0 4 ...
/*
class base;
	randc int unsigned a[];
	constraint pattern {a.size == 10;foreach(a[i]) if(i%2 == 0) a[i] ==0; else a[i] ==(i+1)/2;}
endclass
base b1;
module test();
	initial
	begin
		b1 = new;
		b1.randomize;
		$display("%p",b1.a);
	end
endmodule
*/
/*
//=====================================================
//pattern  1 2 4 3 5 6 8 7 ...
//with pre and post randomization functions
class base;
	randc int unsigned a;
	int unsigned b;
	constraint pattern{if (b%4 == 0) a == b-1;if(b%4 == 3) a == b+1;if(b%4 == 1 || b%4 == 2) a ==b;}
	
	function void pre_randomize();
			b ++;
	endfunction
endclass

base bh;

module test();
	initial
	begin
		bh = new;
		repeat(15)
		begin
			bh.randomize();
			$display(bh.a);
		end
	end
endmodule
*/
/*
//pattern  1 2 4 3 5 6 8 7 ...
class base;
	randc int unsigned a[];
	constraint pattern{a.size == 10;foreach(a[i]) if(i%4 == 0 || i%4 == 1) a[i] == i+1;else if(i%4 == 2) a[i] == i+2;else a[i] == i; }
	
endclass

base bh;

module test();
	initial
	begin
		bh = new;
		
		bh.randomize();
		$display(bh.a);
		
	end
endmodule
*/
/*
//======================================//
//pattern even,odd,even,odd....
class base;
	randc bit[2:0] a[];
	constraint pattern{a.size == 10;foreach(a[i]) if(i%2 == 0) a[i]%2==0;else a[i]%2 != 0;}
endclass

base b1;

module test();
	initial begin
	b1 = new;
	b1.randomize();
	$display(b1.a);
	end
endmodule
*/


//pattern 25,27,30,36,40,45
class base;
	rand int a[];
	int temp;
//	constraint unique_c {foreach(a[i])foreach(a[j]) if(i!=j)a[i]!=a[j];}
	//constraint pattern {a.size() == 6; foreach(a[i]) a[i] inside {[25:45]};foreach(a[i]) a[i]%5==0 && a[i]!=35 || a[i] == 27 || a[i] == 36;}
	constraint pattern {a.size() == 6; foreach(a[i]) a[i] inside {[25:45]};foreach(a[i]) a[i]%5==0 && a[i]!=35 || a[i] % 9 == 0;}
endclass

base b1;

module test();
	initial begin
		b1 = new;
		b1.randomize() with {unique{b1.a};foreach(a[i])a[i]<a[i+1];};
		$display(b1.a);
	end
endmodule	

//=============================================================================================
/*
//Pattern 123321456654
class base;
	rand int a[];
	rand int b;
	constraint size_c {a.size() == 18;}
	constraint pattern {foreach(a[i])if(i%6<3) a[i] == (i/6)*3 +i%3+1;else a[i] == a[i-2*(i%3)-1];}

endclass
base b1;
module test();
        initial begin
                b1 = new;
                b1.randomize();
                $display(b1.a);
        end
endmodule  
*/
















///rand using 0,1,x,z
/*
class base;
	randc reg a;
	reg q[$];
	
	constraint c {a inside {1,0};}
	
	function void post_randomize();
		if(q.size == 0)
			q.push_back(a);
		else if(q.size == 1) 
			//foreach(q[i])
			begin
				if(a!=q[0])
					q.push_back(a);
			end
		else if(q.size == 2) 
			begin
			q.push_back(1'bz);
			a = 1'bz;
			end
		else 	
			begin
			q.delete();
			a = 1'bx;
			end
	endfunction
endclass

base b1;

module test;
	initial 
	begin
		b1 = new();
		repeat(5) begin
		//b1  = new;
		b1.randomize();
		$display(b1);
		end
	end
endmodule */
/*
class base;
	randc int  n;
	reg a;
	constraint c {n inside {0,1,2,3};}
	function post_randomization();
		case(n)
			0 : a = 1'b0;
			1 : a = 1'b1;
			2: a = 1'bz;
			3: a = 1'bx;
		endcase
	endfunction
endclass

base b1;

module test();
	initial
	begin
		b1 = new();
		repeat(5)
		begin
			b1.randomize();
			$display(b1);
		end
	end
endmodule*/
class base;
	rand integer v;
	constraint r{v<100;v>0;}
endclass

class ex extends base;
	constraint r{v==1;}
endclass

module top;
	ex ex1;
	base b;
	initial begin
		ex1 = new();
	//	b = ex1;
		b = new();
		b.randomize();
		$display(b);
		ex1.randomize();
		$display(ex1);
	end
endmodule

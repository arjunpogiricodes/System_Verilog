class vector#(int s = 8,type T = int);
	bit [s-1 : 0] a;
	T b;
endclass

/*
vector #(9,real) r;
vector #(2,int) i;
vector #(.T(real),.s(12)) n;

module top();
	initial begin
		r = new();
		i = new();
		n = new();
		r.a = 9'b111111111;
		r.b = 12.1;
		$display(r);
		i.a = 9'b111111111;
		i.b = 12.1;
		$display(i);

	end
endmodule*/


//class that is passing in as type
class c11;
	int c;
endclass
//extending class
class c1 #(type p = bit) extends vector;
	p e;
endclass
//extended class where parent has a type class
class c2 #(type p = real) extends vector#(16,c11);
	p v;
endclass

class c3 #(type p = vector#(,real)) extends vector;
	p t;
endclass

c3 ch3;
c1 ch1;
c2 ch2;
module top();
	initial
	begin
		/*ch2 = new();
		ch2.b = new();
		ch2.b.c = 32;
		$display(ch2);
		$display(ch2.b);*/
		ch3  = new();
		ch3.t = new();
		ch3.t.a = 55;
		$display(ch3);
		$display(ch3.t);
	end
endmodule
*/		

class a;
	int b= 10;
//	function new();
//		b  =20;
//	endfunction
	function new(int c );
		b = c;
	endfunction
endclass

class b extends a(21);
	int b;
	function new();
		b =11;
	endfunction
endclass

b  b1;
module tb();
reg c;
initial
begin	
	b1 = new();
	$display(b1);
end

endmodule
/*
class p;
	int a = 0;
	int b = 1;
endclass

class c extends p;
	int a =11;
	int c = 19;
endclass
c c1;
module top();
	initial
		begin
				c1 = new();

			$display(c1.a);
		end
endmodule*/
/*
class sub;
	int obj;
	function sub copy();
		copy = new();
		copy.obj = this.obj;
	endfunction
endclass

class t;
	int d;
	sub s = new();
	function t copy();
		copy = new();
		copy.d = this.d;
		//copy.s = this.s.copy;
	endfunction
endclass			
module topy();
	t t1,t2;
	initial
	begin
		t1 = new();
		t1.d = 4;
		t1.s.obj = 10;
		$display(t1.s.obj);

		t2 = t1.copy();
		$display(t2.s.obj);

		t2.s.obj = 12;
		$display(t1.s.obj);
		$display(t2.s.obj);
	end
endmodule*/
/*

class c1;
	int a = 10;
endclass

class c2 extends c1;
	 int b ;
endclass
//c1 c;
c2 cc;
module test();
	initial begin
		cc = new();
		//cc.a = 11;
		$display("%p",cc);
			end
endmodule
		
*/


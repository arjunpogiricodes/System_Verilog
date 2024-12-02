class c #(type T=bit);
T a;
function new(T a);
	this.a=a;
	$display("value of a=%0d",a);
endfunction
endclass

class D1 #(type p=real) extends c #(real)(4.8) ;
	p b;
endclass
D1 t;
module test();
initial
begin
	t=new;
end
endmodule
	

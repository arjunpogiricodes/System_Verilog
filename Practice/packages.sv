package pk1;
	int n;
	function void d(string s);
		$display("Value of n called from %s : %0d",s,n);
	endfunction
endpackage


module tb_a();
import pk1 ::*;
int n = 1000;
initial
begin
	#1;
	n = 100;
	#2;
	d("A");
end
endmodule

module tb_b();
import pk1 ::*;
initial
begin
	#4;
	n = 10;
	#3;
	d("B");
end
endmodule

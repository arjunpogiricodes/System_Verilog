interface fa_if();
	logic a,b,c_in,s,c_out;
	modport tb(input s,c_out,output a,b,c_in);
	modport rtl(input a,b,c_in,output s,c_out);
endinterface

module fa(fa_if.rtl duv);
	assign duv.s = duv.a ^ duv.b ^ duv.c_in;
	assign duv.c_out = duv.a&duv.b | duv.b&duv.c_in |duv.c_out&duv.a;
endmodule

module tb_fa(fa_if.tb tb1);
	initial begin
	$monitor("At time = %0t, a = %b, b = %b, c_in = %b, s = %b , c_out = %b",$time,tb1.a,tb1.b,tb1.c_in,tb1.s,tb1.c_out);
	{tb1.a,tb1.b,tb1.c_in} = 3'b000;
	#10;
	{tb1.a,tb1.b,tb1.c_in} = 3'b001;
	#10;
	{tb1.a,tb1.b,tb1.c_in} = 3'b010;
	#10;
	{tb1.a,tb1.b,tb1.c_in} = 3'b011;
	#10;
	{tb1.a,tb1.b,tb1.c_in} = 3'b100;
	#10;
	{tb1.a,tb1.b,tb1.c_in} = 3'b101;
	#10;
	{tb1.a,tb1.b,tb1.c_in} = 3'b111;
	#10;
	{tb1.a,tb1.b,tb1.c_in} = 3'b110;
	#10 $finish;
	end			 
endmodule

module top();
	fa_if IF();
	fa RTL(IF);
	tb_fa TB(IF);
endmodule

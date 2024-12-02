module tb_2states();
bit b;
byte by;
byte s1;
byte unsigned s2;


initial
begin
	by = 'd128;
	s1 = -12;
	s2 = 128;
	$display("value of b :%b\n",b);
	#2 $display("value of by: %b ===== %d\n",s1,s1);
	#2 $display("value of by: %b\n",s2);
	//#2 $display("value of by: %b\n",by);

		
end
endmodule

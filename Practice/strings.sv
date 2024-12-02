module tb_strings();
string s,s2;
initial
begin
disp(s);
s = " Vamsi_Pvm_2003+######";
disp(s);
#10;
s = s.tolower();
disp(s);
$display("Size of string : %d ",s.len);
#10;
s.getc(10);//this will return the character but wont 
disp(s);
$display("Size of string : %d ",s.len);
#10;
s.putc(0,"O");
disp(s);
//$display("Size of string : %d ",s.len);
#10;
s.substr(2,5);
disp(s.substr(2,5));
#10;
s2 = {{3{"l"}},s};
disp(s2);
#10;
s2 = $sformatf("uuu%s",s);
disp(s2);
end




task disp(string s1);
$display("At time = %t, string == %s",$time,s1);
endtask

endmodule

class account_c;
endclass
account_c acnt_h;
task automatic account_status(ref account_c acnt_h);
	if(acnt_h==null)
begin
		acnt_h=new;
		$display("%d",acnt_h);
end
else
		$display("already created");
		
endtask:account_status
module test();
initial
begin
	acnt_h=new();
	account_status(acnt_h);

	#10;
	//acnt_h=new();
	account_status(acnt_h);

end
endmodule


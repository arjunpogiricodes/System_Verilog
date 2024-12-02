module test();
class account_c;
	int balance=10;
	
	function new(input int balance=5);
	this.balance=balance;
	endfunction
	
	function int new1(input int balance=6);
	balance=balance;
	return balance;
	endfunction

endclass
account_c acnt_h;

initial 
begin
	acnt_h=new();
	$display("balance=%d",acnt_h.balance);
	$display("balance=%d",acnt_h.new1());
	$display("balance=%d",acnt_h.balance);


end

endmodule

module tb_associate();
int mem[int];
string mem1[string];
string mem2[int];
int idx;
initial
begin
	//idx = 99999999999999999999999;
       //$display(idx);
	mem1["lkj"] = "45";
	$display(mem2);
	mem[20] = 1;
	mem[2] = 1;
	mem[2] = 123;
	mem[2] = 1;
	mem[4] = 100;
	mem[100] = 99;
	mem[80] = 125;
	//$display("Accessing non exist element : %f ",mem["ban"]);
	//if(mem["7777"])
	//	$display("can be used as a if condition");
	$display(mem.size());
	$display(mem1);
	$display("Size of mem : %0d",mem.num);
	if(mem.first(idx))
		$display(mem[idx],"%d",idx);
	$display("next memory index %d",mem.next(idx));
	$display(mem.exists(123));
end
endmodule

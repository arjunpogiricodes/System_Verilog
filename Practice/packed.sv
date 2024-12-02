module tb_packed();
int da [] = {2,10,10,8};
//multidimensional
/*int m[2][3];
bit [3:0][7:0] mem[10];//10 elements with 4*8 cells for each element
initial
begin
	$display(da.sum with(item == 10));
	m = '{'{1,2,3},'{10,20,30}};
	$display(m);
	mem[0] = 0;
	mem[1][2] = 8'b1111_1111;
	mem[2][3][7] = 'b1;
	foreach(mem[i])
		$display("%b_%b_%b_%b",mem[i][3],mem[i][2],mem[i][1],mem[i][0]);
	//$display("%b",mem[1]);
end*/
int m [5] ={1,2,3,4,5},m1[5] ={ 3,2,4,5,1};
initial begin
	if(m == m1)
		$display("equal");
	else
		$display("nope"); 

	m1 = m;
	$display(m);
end
endmodule

/*module top();
int da[];
initial
begin
	da=new[10];
	//da={1,2,3,4,7,9,5,10,6,8};
	foreach(da[i])
		da[i]={$random}%10;
	$display("before sort=%p",da);
	da.sort;
	$display("after sort %p",da);
end
endmodule  */





module queues();
int q1[$]={1,2,3};
int q2[$]={4,5,6};
initial 
begin
	foreach(q1[i])
		q1[i+3]=q2[i];
	$display("%p",q1);
end
endmodule

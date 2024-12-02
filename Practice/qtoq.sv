module top();
int q1[$]={1,2,3};
int q2[$]={4,5,6};
initial
begin
	foreach(q1[i])
		q1.push_back(q2[i]);
	$display("after insert=%p",q1);
end
endmodule

module tb_dynamic();
int d[];
int q[$];
int q2[1];
int q1;
initial
begin
	d = new[5];
	foreach(d[i])
	begin
		d[i] = i;
		end
	$display(d);
	q1 = d.sum with(item*(int'(item >= 2)));
	$display(q1);
	q1 = d.product with(int'(item >= 2) ? item:1);
	$display(q1);
	q = d.find_first with (item >0);
	$display(q);


end
endmodule 

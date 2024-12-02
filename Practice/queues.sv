module tb_queues();
/*
bit[7:0] q1[$];
initial
begin
	q1.push_back('h55);
	d(q1);
	q1.push_front(0);
	d(q1);
	q1.insert(1,1);
	d(q1);
	q1.pop_front();
	d(q1);
	$display("The size of queue: %d",q1.size);
	$display(q1[1]);
end
task d(bit[7:0] q[$]);
	$display("The queue is %p",q);
endtask


int k,q[$] = '{1,2,3,4,5,6};
initial
begin
	//foreach(q[i])
	$display(q);
	for(int i =q.size;i>0;i--)
		begin
			//$display(i, "   " ,q.size);
			k = q.pop_back();
			$display(k);
		//	$display(i, "   " ,q.size);

		end
	$display(q);
end*/
int q[] = {1,2,3,4};
int o[$];
initial
begin
	o = q.min();
	$display(o);
end
endmodule

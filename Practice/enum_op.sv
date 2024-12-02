module test();
	const int a = 5;
	int d1[],d2[];
	int result[$];
	int result1[$];
	int s;
	enum {add,sub,mul} op;
	initial
	begin
		d1 = new[a];
		d2 = new[a];
		foreach(d1[i])
			d1[i] = {$random}%10;
		foreach(d2[i])
			d2[i] = {$random}%10;
		s = op.last();	
		for(int i = op.first();i<=s;i++)
			begin
			case(op)
			   0 : for(int j = 0;j<a;j++)
					result.push_back(d1[j] + d2[j]);
			   1 : for(int j = 0;j<a;j++)
					result.push_back(d1[j] - d2[j]);
			   2 : for(int j = 0;j<a;j++)
					result.push_back(d1[j] * d2[j]);
			endcase
			op = op.next();
			end
		for(int i = op.first();i<=s;i++)
			begin
			case(op.name)
			   "add" : for(int j = 0;j<a;j++)
					result1.push_back(d1[j] + d2[j]);
			   "sub" : for(int j = 0;j<a;j++)
					result1.push_back(d1[j] - d2[j]);
			   "mul" : for(int j = 0;j<a;j++)
					result1.push_back(d1[j] * d2[j]);
			endcase
			op = op.next();
			end

		$display("Array 1 = %p , Array 2 = %p ",d1,d2);
		$display("ADD = %p, SUB = %p , mul = %p",result[0:4],result[5:9],result[10:15]);
	    $display("ADD = %p, SUB = %p , mul = %p",result1[0:4],result1[5:9],result1[10:15]);

	end
endmodule



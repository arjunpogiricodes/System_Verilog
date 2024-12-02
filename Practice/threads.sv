module tb();
initial begin
	#10;
	fork : f1
	begin
		#10;
		$display("From T1 %t",$time);
		//disable fork;
		#10;
		$display("From T11 %t",$time);

	end
	begin
		#20;
		$display("From T2 %t",$time);

	end
	begin
		#30;
		$display("From T3 %t",$time);
	end
	//join
	join_any
	//wait fork;
	disable f1;
	$display("%t",$time);
	end
endmodule

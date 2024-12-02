module test;
	int a,b;
	covergroup cg;
		coverpoint a;
	endgroup
	
	cg c1;
	initial
		begin
		cg = new;
		a = 1;
		cg.sample();
		$display(cg.get_instance_coverage());
	end
endmodule

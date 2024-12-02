//32 bit variable only 12th shouls be randomized


class base;
	rand bit[31:0] a;
	bit[31:0] pre_a;
	//constraint c 
	function void pre_randomize();
			pre_a = a;
	endfunction
	function void post_randomize();
		foreach(a[i])
			if(i!=11)
				a[i] = pre_a[i];
	endfunction
endclass
base b1;
module test();
	//bit [31:0]a;
	
	initial begin
		b1 = new;
		repeat(10) begin
		b1.a = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
		//std::randomize(a[11]);
		//b1.a[12].rand_mode(0);
		b1.randomize();
		$display("%b",b1.a);
		end
	end
endmodule
		

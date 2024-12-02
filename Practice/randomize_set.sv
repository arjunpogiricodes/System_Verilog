const int q[] = '{3,6,11,13,14,15};
class parent;
	randc bit[3:0] addr;
	int c;
	//constraint adc{addr inside {3,6,11,[13:15]};}
	constraint adc{addr inside {q};}//this can be done but be careful with the [13:15] int the array

endclass

parent p1;

module test();
	int i;
	bit[2:0] v;
	initial
	begin
		p1 = new();
		repeat(7)
		begin
			i++;
			p1.randomize();
			$display(p1);
			//	$display("%0d) %0d",i,p1.addr);
		end
		p1.randomize(c);
		$display(p1);
		std::randomize(v);
		$display(v);
	end
endmodule	

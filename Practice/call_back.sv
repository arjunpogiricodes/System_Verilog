class callback_base;
	virtual task send;
	endtask
endclass

class child extends callback_base;
	task send;
		$display("%0t Adding delay",$time);
		#20;
		$display("%0t delay added",$time);
	endtask
endclass

class driver;
	callback_base cb_h = new();
	task send;
		cb_h.send();
		#30;
		$display("%0t Driving completed",$time);
	endtask
endclass

module test;
	driver drv;
	child c1;
	initial begin
		drv = new();
		drv.send();
		c1 = new ();
		drv.cb_h = c1;//polymorphism 
		drv.send();

	end
endmodule



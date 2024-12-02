class trans;
	rand byte a;
	randc bit[2:0] b;
	constraint forb {b >4;a>=110;}
/*	
	function void pre_randomize();
		$display("Pre a = %0d and b = %0d",a,b);
	endfunction
	
	function void post_randomize();
		$display("Post a = %0d and b = %0d",a,b);
	endfunction
*/	
endclass//pre_randomize and post_randomize are created automatically

class inline;
	rand bit [7:0]x,y,z;
	constraint c{z == x+y;}
endclass : inline

trans t1;
inline in_h;

module test();
	initial
	begin
		int success;
		t1 = new();

		//we can't make rand_mode as 0 before making constriant_mode as 0.
		t1.a.rand_mode(0);
		//t1.b.rand_mode(0);
		//t1.randomize();
		//t1.a.rand_mode(1);
	//	if(t1.rand_mode())
		//t1.rand_mode(0);
	//	t1.forb.constraint_mode(0);
		if(t1.a.rand_mode())
		repeat(1)
		begin
		success = t1.randomize();// with {a<10;};
		//assert(t1.randomize());
		$display("success = %0d",success);
		$display("%p",t1);
		end
		else begin
			t1.randomize();
			$display("sfjoianvkanoiv");
		end
/*
		t1.rand_mode(0);
		t1.forb.constraint_mode(0);
		repeat(1)
		begin
		success = t1.randomize();
		//assert(t1.randomize());
		$display("success = %0d",success);
		$display("%p",t1);
		end
		
		success = t1.randomize();
		//assert(t1.randomize());
		$display("success = %0d",success);
		$display("%p",t1);
				*/
	/*	in_h = new();
		repeat(10)
		begin
		if(!in_h.randomize() with {x<y;y>100;})
			$display("Failed");
		else
			$display("x = %0d  y = %0d  z = %0d",in_h.x,in_h.y,in_h.z);	
		end
	*/		
	end
endmodule

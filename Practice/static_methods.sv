class trans;
	static int i;
	int j;
	
	//static function
	static function void static_fun();//can access only static global variables,Local variables act as same , obj is not needed to access.
		static int c;
		int b;
		//j++;//error
		i++;
		c++;
		b++;
		$display("stat_fun, static GV i =%0d , dynamic LV b = %0d, static LV c = %0d",i,b,c);	
	endfunction : static_fun
	
	//function static
	function static void fun_static();// can access all type of global variables,LV acts as static,obj is needed to access.
		int a;
		static int c;
		i++;
	        j++;
		c++;
		a++;
		$display("fun_stat, static GV  i  = %0d,Dynamic GV j =%0d ,dynamic LV a = %0d, static LV c = %0d",i,j,a,c);
	
	endfunction : fun_static
	
endclass : trans

trans t[];

module top();
	initial
	begin
		t = new[5];
		foreach(t[i])
			begin
				//t[i] = new();
				t[i].static_fun();
			end
		foreach(t[i])
			begin
				t[i] = new();
				t[i].fun_static();
			end

	end
endmodule

/*

module test();
	
class driver;
	task send();
		//#10;	
		sem.try_get(1);
		#10;
		$display("from the driver %0t",$time);
		sem.put(5);
	endtask
endclass	
	driver dr[5];
	semaphore sem;
	initial begin
			//$display("Sem class : %p",sem);

		foreach(dr[i])
			dr[i] = new;
		sem = new(0);
		fork
			dr[0].send();
			
	join
		
	//$display("Sem class : %p",sem);
	end
endmodule*/

module ex();
	semaphore sem;
	task wr();
                $display("Started writing %0t",$time);
                #5;
                $display("wr completed %0t",$time);
        endtask

        task read();
                $display("Started re %0t",$time);
                #4;
                $display("re ended %0t",$time);
        endtask
	//after using semaphore
	task wr1();
		sem.get();
		$display("Started writing %0t",$time);
		#5;
		$display("wr completed %0t",$time);
		sem.put();
	endtask
	
	task read1();
		sem.get();
		$display("Started re %0t",$time);
		#4;
		$display("re ended %0t",$time);
		sem.put();
	endtask
	
	initial begin
		sem = new(1);
	fork
		wr();
		read();
	join
	end
endmodule

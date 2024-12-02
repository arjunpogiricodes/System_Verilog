module test;
        event e1,e2;

        initial begin
                $display("Before triggering event1 %0t",$time);
                ->e1;
                //wait(e2.triggered);
                @(e2);
                $display("After triggering event1 %0t",$time);
        end

        initial begin
                $display("Before triggering event2 %0t",$time);
                 ->e2;
               // wait(e1.triggered);
                @(e1);
                $display("After triggering event2 %0t",$time);
        end
endmodule
/*module test;
	event e1,e2;
	
	initial	begin
		$display("Before triggering event1 %0t",$time);
         	->e1;
		//wait(e2.triggered);
		//@(e2);
		$display("After triggering event1 %0t",$time);
		#10 ->e1;
	end
	
	initial begin
                $display("Before triggering event2 %0t",$time);
		// ->e2;
               // wait(e1.triggered);
		@(e1);
                $display("After triggering event2 %0t",$time);
        end
endmodule
*/

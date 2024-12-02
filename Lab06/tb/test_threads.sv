

module test_threads;

	//Execute code using fork join and observe the output
	//Execute code using fork join_any and observe the output
	//Execute code using fork join_none and observe the output
	
	//Observe the difference in output by commenting and uncommenting "disable thread" 
	
	initial
		begin   
                        $display("\n******************************************************************************\n");
	  		$display("Thread_1 with delay : @%0t ", $time);
                        $display("\n******************************************************************************\n");

			#20 $display("Thread_2 with delay : @%0t", $time);
                        $display("\n******************************************************************************\n");

			fork: A // Thread A will be started at time t = 20


                                 #40 $display("Thread A1 with delay : @%0t ", $time); //longest Thread


                                
				#10 $display("Thread A2 with delay : @%0t", $time);


                              
				begin : B //Thread B with a delay of 15

                                       	#5 $display("Thread B1 with delay : @%0t", $time);
                                       
					#10 $display("Thread B2 with delay : @%0t", $time);
                                    
				end : B
                                 
				#5 $display("Thread_3 with delay : @%0t ", $time); //shortest Thread



                                
			join 
			 //join_any
			//join_none
                        //wait fork;
			disable fork;
                        wait fork;


                         $display("\n******************************************************************************\n");
		         $display("Completed fork thread A : @%0t", $time);
                         $display("\n******************************************************************************\n");

		         #30 $display("Thread_4 with delay : @%0t ", $time);
                         $display("\n******************************************************************************\n");

		end

endmodule


/*

//fork join
 
******************************************************************************

Thread_1 with delay : @0 

******************************************************************************

Thread_2 with delay : @20

******************************************************************************

Thread B1 with delay : @25
Thread_3 with delay : @25 
Thread A2 with delay : @30
Thread B2 with delay : @35
Thread A1 with delay : @60 

******************************************************************************

Completed fork thread A : @60

******************************************************************************

Thread_4 with delay : @90 

******************************************************************************

           V C S   S i m u l a t i o n   R e p o r t 

*/

/*
//join join_any


******************************************************************************

Thread_1 with delay : @0 

******************************************************************************

Thread_2 with delay : @20

******************************************************************************

Thread B1 with delay : @25
Thread_3 with delay : @25 

******************************************************************************

Completed fork thread A : @25

******************************************************************************

Thread A2 with delay : @30
Thread B2 with delay : @35
Thread_4 with delay : @55 

******************************************************************************

Thread A1 with delay : @60 
           V C S   S i m u l a t i o n   R e p o r t 
*/

/*
//fork join_none
******************************************************************************

Thread_1 with delay : @0 

******************************************************************************

Thread_2 with delay : @20

******************************************************************************


******************************************************************************

Completed fork thread A : @20

******************************************************************************

Thread B1 with delay : @25
Thread_3 with delay : @25 
Thread A2 with delay : @30
Thread B2 with delay : @35
Thread_4 with delay : @50 

******************************************************************************

Thread A1 with delay : @60 
           V C S   S i m u l a t i o n   R e p o r t 

*/

/*
// fork join_none ; disable A;
******************************************************************************

Thread_1 with delay : @0 

******************************************************************************

Thread_2 with delay : @20

******************************************************************************


******************************************************************************

Completed fork thread A : @20

******************************************************************************

Thread_4 with delay : @50 

******************************************************************************

           V C S   S i m u l a t i o n   R e p o r t 

*/

/*

//fork join_none
// wait fork ;
// this is acting as a fork join 
//if your giving disable A; after this wait there is no use  output getting like fork join 

******************************************************************************

Thread_1 with delay : @0 

******************************************************************************

Thread_2 with delay : @20

******************************************************************************

Thread B1 with delay : @25
Thread_3 with delay : @25 
Thread A2 with delay : @30
Thread B2 with delay : @35
Thread A1 with delay : @60 

******************************************************************************

Completed fork thread A : @60

******************************************************************************

Thread_4 with delay : @90 

******************************************************************************

           V C S   S i m u l a t i o n   R e p o r t 

*/

/*
// fork join_any
// disable fork;
// here after completion of first thread at time fork will be disabled


******************************************************************************

Thread_1 with delay : @0 

******************************************************************************

Thread_2 with delay : @20

******************************************************************************

Thread B1 with delay : @25
Thread_3 with delay : @25 

******************************************************************************

Completed fork thread A : @25

******************************************************************************

Thread_4 with delay : @55 

******************************************************************************

           V C S   S i m u l a t i o n   R e p o r t 

*/


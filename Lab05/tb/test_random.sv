/********************************************************************************************

Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
www.maven-silicon.com

All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.


Filename		:	test_random.sv   

Description		:	Example for Constraints

Author Name		:	Putta Satish

Support e-mail  : 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

*********************************************************************************************/


module test_random;


	// In class alu_trans_c

class alu_trans_c;
               
		// Declare a typedef variable OPERATION of type enum with LOGIC, ARITH and SHIFT as the values
                   typedef enum{LOGIC,ARITH,SHIFT}OPEARATION;

                
		// Add the following rand fields 
		// alu_sel_in ( logic type, size 4)
		// rand_oper ( OPERATION type)
                  rand logic[4] alu_sel_in;
                  rand OPEARATION rand_oper;

                  real a,b,c,sum1;
		// Apply following constraints 
		// If rand_oper = LOGIC then alu_sel_in should be inside [0:5] 
		// If rand_oper = ARITH, then alu_sel_in should be inside [6:9]
		// If rand_oper = SHIFT, then alu_sel_in should be inside [10:15]
		// Give weightage of 2 to ARITH operation
                 constraint con {
                                rand_oper == LOGIC  -> alu_sel_in  inside{[0:5]};
                                rand_oper == ARITH  -> alu_sel_in  inside{[6:9]};
                                rand_oper == SHIFT  -> alu_sel_in  inside{[10:15]};
                                }
                 constraint tag {
                                 rand_oper dist{LOGIC:=1,ARITH:=2,SHIFT:=1};
                                }            



		// In post_randomize method ,display all the randomized values
              function void post_randomize();
                   if( rand_oper == 0)
                         a++;
                   if(  rand_oper == 1)
                        b++;
                   if(  rand_oper == 2)
                         c++;

             
                   $display(" alu_sel_in = %0d opearation = %s a = %0d b = %0d c = %0d" , alu_sel_in,rand_oper,a,b,c);
              endfunction:post_randomize
   
endclass:alu_trans_c
            real a1,b1,c1;
            alu_trans_c ca;            
            initial begin

	// Within initial
		// Create an instance of alu_trans_c
		// Generate 10 set of random values for the instance alu_trans_c
		// Randomize using 'assert' or 'if' construct
                 ca = new;
                //repeat(10)
                 for (int i=0;i<10;i++) 
                 begin
                 assert(ca.randomize()) else $fatal(" constrain viloated " );
            
                 end 
                 ca.sum1 = ca.a+ca.b+ca.c;

                 //a1 = real'(ca.a/ca.sum1);
                // b1 = real'(ca.b/ca.sum1);
                 //c1 = real'(ca.c/ca.sum1);

                 $display("LOGIC = %.04F  ARITH = %.04f  SHIFT = %.04f ca.sum1 = %.0f ",ca.a/ca.sum1,ca.b/ca.sum1,ca.c/ca.sum1,ca.sum1);   
            end
	          
	
endmodule:test_random 

/*

for loop
 alu_sel_in = 1 opearation = LOGIC a = 1 b = 0 c = 0
 alu_sel_in = 6 opearation = ARITH a = 1 b = 1 c = 0
 alu_sel_in = 8 opearation = ARITH a = 1 b = 2 c = 0
 alu_sel_in = 8 opearation = ARITH a = 1 b = 3 c = 0
 alu_sel_in = 2 opearation = LOGIC a = 2 b = 3 c = 0
 alu_sel_in = 8 opearation = ARITH a = 2 b = 4 c = 0
 alu_sel_in = 0 opearation = LOGIC a = 3 b = 4 c = 0
 alu_sel_in = 8 opearation = ARITH a = 3 b = 5 c = 0
 alu_sel_in = 9 opearation = ARITH a = 3 b = 6 c = 0
 alu_sel_in = 12 opearation = SHIFT a = 3 b = 6 c = 1
LOGIC = 0.3000  ARITH = 0.6000  SHIFT = 0.1000 ca.sum1 = 10 
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0
*/
/*
repeat
 alu_sel_in = 6 opearation = ARITH a = 0 b = 1 c = 0
 alu_sel_in = 7 opearation = ARITH a = 0 b = 2 c = 0
 alu_sel_in = 7 opearation = ARITH a = 0 b = 3 c = 0
 alu_sel_in = 10 opearation = SHIFT a = 0 b = 3 c = 1
 alu_sel_in = 6 opearation = ARITH a = 0 b = 4 c = 1
 alu_sel_in = 9 opearation = ARITH a = 0 b = 5 c = 1
 alu_sel_in = 10 opearation = SHIFT a = 0 b = 5 c = 2
 alu_sel_in = 9 opearation = ARITH a = 0 b = 6 c = 2
 alu_sel_in = 6 opearation = ARITH a = 0 b = 7 c = 2
 alu_sel_in = 1 opearation = LOGIC a = 1 b = 7 c = 2
LOGIC = 0.1000  ARITH = 0.7000  SHIFT = 0.2000 ca.sum1 = 10 
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0
*/
/*
 alu_sel_in = 3 opearation = LOGIC
 alu_sel_in = 2 opearation = LOGIC
 alu_sel_in = 8 opearation = ARITH
 alu_sel_in = 8 opearation = ARITH
           V C S   S i m u l a t i o n   R e p o r t 
*/ 

/*
 alu_sel_in = 11 opearation = SHIFT
 alu_sel_in = 6 opearation = ARITH
 alu_sel_in = 2 opearation = LOGIC
 alu_sel_in = 4 opearation = LOGIC
 alu_sel_in = 0 opearation = LOGIC
 alu_sel_in = 8 opearation = ARITH
 alu_sel_in = 14 opearation = SHIFT
 alu_sel_in = 10 opearation = SHIFT
 alu_sel_in = 1 opearation = LOGIC
 alu_sel_in = 1 opearation = LOGIC
           V C S   S i m u l a t i o n   R e p o r t 
*/

/*
 alu_sel_in = 7 opearation = ARITH
 alu_sel_in = 6 opearation = ARITH
 alu_sel_in = 3 opearation = LOGIC
 alu_sel_in = 6 opearation = ARITH
 alu_sel_in = 10 opearation = SHIFT
 alu_sel_in = 4 opearation = LOGIC
 alu_sel_in = 8 opearation = ARITH
 alu_sel_in = 8 opearation = ARITH
 alu_sel_in = 6 opearation = ARITH
 alu_sel_in = 13 opearation = SHIFT
           V C S   S i m u l a t i o n   R e p o r t 
*/


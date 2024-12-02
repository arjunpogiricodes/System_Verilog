/********************************************************************************************

Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
www.maven-silicon.com

All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.


Filename		:	test_mailbox.sv   

Description		:	Example for mailbox

Author Name		:	Putta Satish

Support e-mail  : 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

*********************************************************************************************/

module test_mailbox;

	// In class packet

class packet;       

		// Add the following rand fields 
		
      		// addr (bit type , size 4)
                 rand bit[4] addr;
   
                // data (bit type , size 4)
                 rand bit[4] data;

		// In display function pass a string as an input argument
			// Display the input string message
			// Display the data and address
               function void display(input string a);
                  $display("\n#########################################################################################\n");
                  $display(" string  = %s \ttime = %t",a,$time);
                  $display(" addr = %0d  data = %0d", addr,data);
                  $display("\n#########################################################################################\n");


                endfunction:display

		// In post_randomize method call display method 
	       	function void post_randomize;

                    display("randomize data");
                endfunction:post_randomize
                // and pass the string argument as "randomized data"
endclass:packet


	// In class generator 
class generator;

		// Declare a handle of packet class
         packet handle1,handle2;
			// Declare the mailbox parameterized by type class packet 
         mailbox #(packet) gendrv;
			// In constructor
				// Pass the mailbox parameterized by packet as an argument of the constructor
				// Assign the mailbox handle argument to the local mailbox handle of generator
         function new(mailbox #(packet) gendrv);
                this.gendrv = gendrv;
         endfunction:new
			
		// In task start, within fork - join_none,
         task start;		
		// create 10 random packets 
	     fork
                   repeat(10) begin		
		// Randomize each packet using assert & randomize method
	              handle1 = new;
                      assert(handle1.randomize())
                      else $display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!! violation in generator randomize classs !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");			
		// Put the generated random packets into the mailbox 
                         handle2 = new handle1;
                         gendrv.put(handle2);
                   end
              join_none
          endtask:start
endclass:generator

	// In class driver
class driver;
		// Declare a handle of packet class
          packet handle;

		// Declare a mailbox parameterized by type class packet
          mailbox #(packet) gendrv;
		// In constructor
          function new(mailbox #(packet) gendrv);
			// Pass the mailbox parameterized by packet as an argument
             this.gendrv = gendrv;
			// Assign the mailbox handle argument to local mailbox handle of driver
          endfunction:new

	// In task start, within fork - join_none,
          task start;
		// Get the 10 generated random packets from the mailbox 
                 fork
                     repeat(10) begin
                          #10;
                        gendrv.get(handle);
                        handle.display(" driver class ");
                     end
                  join_none 
                         
		// Use display method in the packet class to display the received data
           endtask:start
endclass:driver

	// In class env

class env;

		// Create the mailbox instance parameterized by packet
               mailbox #(packet) gendrv = new();
		// Declare handles of generator and driver 
                generator  gen;
                driver  dr;
		// In build function
                 function void build;

                      gen = new(gendrv);
                      dr  = new(gendrv); 
		  endfunction:build	
                // Create instance of generator and driver by passing mailbox as an input argument

		// In task start
               task start;
	          // call start task of generator and driver
                   gen.start;
                   dr.start;
               endtask:start

endclass:env

  env ea;
	// Within initial block
                 initial begin
              
                 // Create an instance of env
                  ea = new;
                  
		// Call build and start task of env
                    
                  ea.build;
                  ea.start;  
                 end                



endmodule:test_mailbox

/*
#########################################################################################

 string  = randomize data 	time =                    0
 addr = 8  data = 9

#########################################################################################


#########################################################################################

 string  = randomize data 	time =                    0
 addr = 8  data = 14

#########################################################################################


#########################################################################################

 string  = randomize data 	time =                    0
 addr = 12  data = 11

#########################################################################################


#########################################################################################

 string  = randomize data 	time =                    0
 addr = 7  data = 9

#########################################################################################


#########################################################################################

 string  = randomize data 	time =                    0
 addr = 2  data = 6

#########################################################################################


#########################################################################################

 string  = randomize data 	time =                    0
 addr = 2  data = 5

#########################################################################################


#########################################################################################

 string  = randomize data 	time =                    0
 addr = 5  data = 11

#########################################################################################


#########################################################################################

 string  = randomize data 	time =                    0
 addr = 9  data = 13

#########################################################################################


#########################################################################################

 string  = randomize data 	time =                    0
 addr = 2  data = 6

#########################################################################################


#########################################################################################

 string  = randomize data 	time =                    0
 addr = 0  data = 9

#########################################################################################


#########################################################################################

 string  =  driver class  	time =                   10
 addr = 8  data = 9

#########################################################################################


#########################################################################################

 string  =  driver class  	time =                   20
 addr = 8  data = 14

#########################################################################################


#########################################################################################

 string  =  driver class  	time =                   30
 addr = 12  data = 11

#########################################################################################


#########################################################################################

 string  =  driver class  	time =                   40
 addr = 7  data = 9

#########################################################################################


#########################################################################################

 string  =  driver class  	time =                   50
 addr = 2  data = 6

#########################################################################################


#########################################################################################

 string  =  driver class  	time =                   60
 addr = 2  data = 5

#########################################################################################


#########################################################################################

 string  =  driver class  	time =                   70
 addr = 5  data = 11

#########################################################################################


#########################################################################################

 string  =  driver class  	time =                   80
 addr = 9  data = 13

#########################################################################################


#########################################################################################

 string  =  driver class  	time =                   90
 addr = 2  data = 6

#########################################################################################


#########################################################################################

 string  =  driver class  	time =                  100
 addr = 0  data = 9

#########################################################################################

           V C S   S i m u l a t i o n   R e p o r t 
*/

/*
#########################################################################################

 string  = randomize data 
 addr = 8  data = 9

#########################################################################################


#########################################################################################

 string  = randomize data 
 addr = 15  data = 8

#########################################################################################


#########################################################################################

 string  = randomize data 
 addr = 8  data = 14

#########################################################################################


#########################################################################################

 string  = randomize data 
 addr = 1  data = 10

#########################################################################################


#########################################################################################

 string  = randomize data 
 addr = 12  data = 11

#########################################################################################


#########################################################################################

 string  = randomize data 
 addr = 2  data = 4

#########################################################################################


#########################################################################################

 string  = randomize data 
 addr = 7  data = 9

#########################################################################################


#########################################################################################

 string  = randomize data 
 addr = 9  data = 15

#########################################################################################


#########################################################################################

 string  = randomize data 
 addr = 2  data = 6

#########################################################################################


#########################################################################################

 string  = randomize data 
 addr = 1  data = 15

#########################################################################################


#########################################################################################

 string  =  driver class  
 addr = 8  data = 9

#########################################################################################


#########################################################################################

 string  =  driver class  
 addr = 15  data = 8

#########################################################################################


#########################################################################################

 string  =  driver class  
 addr = 8  data = 14

#########################################################################################


#########################################################################################

 string  =  driver class  
 addr = 1  data = 10

#########################################################################################


#########################################################################################

 string  =  driver class  
 addr = 12  data = 11

#########################################################################################


#########################################################################################

 string  =  driver class  
 addr = 2  data = 4

#########################################################################################


#########################################################################################

 string  =  driver class  
 addr = 7  data = 9

#########################################################################################


#########################################################################################

 string  =  driver class  
 addr = 9  data = 15

#########################################################################################


#########################################################################################

 string  =  driver class  
 addr = 2  data = 6

#########################################################################################


#########################################################################################

 string  =  driver class  
 addr = 1  data = 15

#########################################################################################

           V C S   S i m u l a t i o n   R e p o r t 

*/

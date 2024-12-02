

module test_polymorphism;

           class packet_c;   
	// In class packet_c
	           
		// In task send
			// Display message "Sending base class packet"
               virtual task send;
                    $display("\n***************************************************************************\n");
                     $display(" sending base class packet");  
                   $display("\n***************************************************************************\n");

                endtask:send
 
           endclass:packet_c 


           class badpacket_c extends packet_c;  
	// Extend badpacket_c from packet_c
	          
		// Override task send
			// Display message "Sending derived class packet"
                   task send;
                        $display("\n***************************************************************************\n");
                        $display(" sending derived class packet"); 
                        $display("\n***************************************************************************\n");

                   endtask:send 
           endclass:badpacket_c

               badpacket_c child;
               packet_c  parent;

	// Within initial

                   initial begin
		// Create instances for badpacket_c and packet_c 
                      child = new;	
                      parent = new;	
 		// Call send tasks using base and extended class handles
                     child.send; 
                     parent.send;
		// Assign extended class handle to base class handle
		      parent = child;
		// Call send task using base class object
		      parent.send;

                   end



endmodule


/*
output:
***************************************************************************

 sending derived class packet

***************************************************************************


***************************************************************************

 sending base class packet

***************************************************************************


***************************************************************************

 sending derived class packet

***************************************************************************

           V C S   S i m u l a t i o n   R e p o r t 
*/

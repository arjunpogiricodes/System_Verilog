

module test_obj_assignment;


	// Declare class packet
               class packet;
		// Within the class packet
		// Declare the below class properties
		// data (bit type, size 4)
		// addr (bit type, size 16) 
		// mem  (bit type, size 16)
	    bit [3:0] data;
            bit [15:0] addr;
            bit [15:0] mem;


	endclass: packet
	
	// Declare two handles for the packet class "pkt_h1" and "pkt_h2"
	
         packet pkt_h1,pkt_h2;
	// Within initial block
	initial begin
		// Construct pkt_h1 object
              pkt_h1 =new;		
		// Assign random values to the addr, data and mem of pkt_h1 object
	      pkt_h1.data = 4'd7;
              pkt_h1.addr = 16'd120;
              pkt_h1.mem  = 16'd30;
	
		// Display the object pkt_h1
              $display("******************************************************************************************");
              $display("the object pkt_h1 = %p ",pkt_h1);
              $display("******************************************************************************************");
 
  
		// Assign pkt_h1 to pkt_h2
              pkt_h2 = pkt_h1;
              $display("******************************************************************************************");
		
		$display("\nAfter assigning one object to the other,");
		// Display the objects pkt_h1 & pkt_h2

              $display("the object pkt_h1 = %p ",pkt_h1);
              $display("the object pkt_h2 = %p ",pkt_h2);
              $display("******************************************************************************************");

 
		// Make changes to address and data using handle pkt_h2

                 $display("******************************************************************************************");

		$display("After changing the values of properties with one handle,");
		
               pkt_h2.addr = 16'd10;
               pkt_h2.data = 4'd1; 
		// Display the object pkt_h1 & pkt_h2
              $display("the object pkt_h1 = %p ",pkt_h1);
              $display("the object pkt_h2 = %p ",pkt_h2);
               $display("******************************************************************************************");

		// observe that pkth1 and pkth2 will display the same contents because,
		// both the handles point to the same object
             end
	
endmodule

/*
******************************************************************************************
the object pkt_h1 = '{data:'h7, addr:'h78, mem:'h1e} 
******************************************************************************************
******************************************************************************************

After assigning one object to the other,
the object pkt_h1 = '{data:'h7, addr:'h78, mem:'h1e} 
the object pkt_h2 = '{data:'h7, addr:'h78, mem:'h1e} 
******************************************************************************************
******************************************************************************************
After changing the values of properties with one handle,
the object pkt_h1 = '{data:'h1, addr:'ha, mem:'h1e} 
the object pkt_h2 = '{data:'h1, addr:'ha, mem:'h1e} 
******************************************************************************************
           V C S   S i m u l a t i o n   R e p o r t 
*/

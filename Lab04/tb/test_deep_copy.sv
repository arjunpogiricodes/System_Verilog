
module test_deep_copy;


	// In class parity_calc_c
	
	class parity_calc_c;

		// Declare parity (bit type, size 8), initialize it with some random value
                  bit [7:0]parity = 8'd10;

		// Write copy method that returns parity_calc_c class type
                  function parity_calc_c copy();
                          
			// Create copy instance
                          copy = new();

			// Copy all the current properties into copy object
                          copy.parity=this.parity;  
                   endfunction	

	endclass: parity_calc_c

	// In class packet_c

	class packet_c;
		
		// Declare header (bit type , size 8), initialize it with some random value
		   bit [7:0]header = 8'd15;
                                 
		// Declare data (bit type , size 8), initialize it with some random value
		   bit [7:0]data = 8'd20;
		// Declare and create an instance of parity_calc_c
                   parity_calc_c subs=new();
		// Define copy method that returns packet_c class type
                   function packet_c copy();
                        
			// Create copy instance
                           copy = new();
			// Copy all the current class properties into copy object
                          copy.header = this.header;
                          copy.data = this.data;
                          copy.subs = this.subs.copy;  
                    endfunction 
	endclass: packet_c

	// Declare 2 handles pkt_h1 & pkt_h2 for packet_c class 
	
          packet_c pkt_h1,pkt_h2;

	// Within initial
		// Create pkt_h1 object
                 initial begin
                  
		   pkt_h1 = new;
		// Use shallow copy method to copy pkt_h1 to pkt_h2 
		   pkt_h2 = new pkt_h1; 
		// Display the properties of parent class and sub class properties of pkt_h1 and pkt_h2
                    $display("\n***********************************************************************\n");
		   $display(" properties of parent class pkt_h1     =  %0p \n \t\t\t\tpkt_h2 = %0p ",pkt_h1,pkt_h2);
                     $display("\n***********************************************************************\n");

		// Assign random value to the header of pkt_h2
                   pkt_h2.header = 8'd1;
		// Display the properties of parent class and sub-class properties of pkt_h1 and pkt_h2
		// observe pkt_h1.header does not change
                    $display("\n***********************************************************************\n");

                   $display(" pkt_h1 = %0p  \n\n  pkt_h1.subs = %0p " , pkt_h1,pkt_h1.subs);
                     $display("\n***********************************************************************\n");

                   $display(" pkt_h2 = %0p  \n\n  pkt_h2.subs = %0p " , pkt_h2,pkt_h2.subs);
                    $display("\n***********************************************************************\n");


		// Change parity of pkt_h2 using subclass handle from the parent class packet_c
		// Ex: pkt_h2.par.parity=19;
                    pkt_h2.subs.parity=5;

              
		// Display the properties of parent class and sub-class properties of pkt_h1 and pkt_h2
		// observe that change reflected in pkt_h1 as the subclass handle in pkt_h1 and pkt_h2 are pointing to same subclass object
                  $display("\n***********************************************************************\n");

                   $display(" pkt_h1 = %0p  \n\n  pkt_h1.subs = %0p " , pkt_h1,pkt_h1.subs);
                     $display("\n***********************************************************************\n");

                   $display(" pkt_h2 = %0p  \n\n  pkt_h2.subs = %0p " , pkt_h2,pkt_h2.subs);
                    $display("\n***********************************************************************\n");

		// Perform deep copy by calling parent class copy method
		// Ex: pkt_h2=pkt_h1.copy;
                        pkt_h2 = pkt_h1.copy;

		// Display the properties of parent class and sub-class properties of pkt_h1 and pkt_h2
		// observe the parent and subclass properties
                  $display("\n***********************************************************************\n");

                   $display(" pkt_h1 = %0p  \n\n  pkt_h1.subs = %0p " , pkt_h1,pkt_h1.subs);
                     $display("\n***********************************************************************\n");

                   $display(" pkt_h2 = %0p  \n\n  pkt_h2.subs = %0p " , pkt_h2,pkt_h2.subs);
                    $display("\n***********************************************************************\n");



		// Change parity of pkt_h2
		// Ex: pkt_h2.par.parity=210;
                   pkt_h2.subs.parity = 8;
		
		// Display the properties of parent class and sub-class properties of pkt_h1 and pkt_h2
		// observe that parity doesnot change for pkt_h1 as they are two different subclass objects
                               $display("\n***********************************************************************\n");

                   $display(" pkt_h1 = %0p  \n\n  pkt_h1.subs = %0p " , pkt_h1,pkt_h1.subs);
                     $display("\n***********************************************************************\n");

                   $display(" pkt_h2 = %0p  \n\n  pkt_h2.subs = %0p " , pkt_h2,pkt_h2.subs);
                    $display("\n***********************************************************************\n");



               end
	
	
endmodule

/*

***********************************************************************

 properties of parent class pkt_h1     =  '{header:'hf, data:'h14, subs:{ ref to class parity_calc_c}} 
 				pkt_h2 = '{header:'hf, data:'h14, subs:{ ref to class parity_calc_c}} 

***********************************************************************


***********************************************************************

 pkt_h1 = '{header:'hf, data:'h14, subs:{ ref to class parity_calc_c}}  

  pkt_h1.subs = '{parity:'ha} 

***********************************************************************

 pkt_h2 = '{header:'h1, data:'h14, subs:{ ref to class parity_calc_c}}  

  pkt_h2.subs = '{parity:'ha} 

***********************************************************************


***********************************************************************

 pkt_h1 = '{header:'hf, data:'h14, subs:{ ref to class parity_calc_c}}  

  pkt_h1.subs = '{parity:'h5} 

***********************************************************************

 pkt_h2 = '{header:'h1, data:'h14, subs:{ ref to class parity_calc_c}}  

  pkt_h2.subs = '{parity:'h5} 

***********************************************************************


***********************************************************************

 pkt_h1 = '{header:'hf, data:'h14, subs:{ ref to class parity_calc_c}}  

  pkt_h1.subs = '{parity:'h5} 

***********************************************************************

 pkt_h2 = '{header:'hf, data:'h14, subs:{ ref to class parity_calc_c}}  

  pkt_h2.subs = '{parity:'h5} 

***********************************************************************


***********************************************************************

 pkt_h1 = '{header:'hf, data:'h14, subs:{ ref to class parity_calc_c}}  

  pkt_h1.subs = '{parity:'h5} 

***********************************************************************

 pkt_h2 = '{header:'hf, data:'h14, subs:{ ref to class parity_calc_c}}  

  pkt_h2.subs = '{parity:'h8} 

***********************************************************************

           V C S   S i m u l a t i o n   R e p o r t 
*/

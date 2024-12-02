
module test_inheritance;

	// In class account_base;
	class account_base;
		// Declare property balance int type and initialize with value 2000
            int balance = 2000;
	// In the function summary_base ,return balance
	       function int summary_base;
                       return balance;
                endfunction:summary_base  
	
	
	
		// In the task deposit, 
		// Pass an input argument 'pay' of int type 
		// Add pay with previous balance
             task deposit(int pay);
                balance = balance + pay;
             endtask:deposit 

	endclass: account_base

// Extend class account_extd from account_base;


	class account_extd extends account_base;
		// Declare property balance of int type and initialize with value 3000

                 int balance = 3000; 

		// In function summary_extd, return balance from extended class
		// the new value returned should be summation of base class balance and extended class balance 
		// Hint: use super to access the base class balance
                 function int  summary_extd;
                     return balance+super.balance;
                 endfunction:summary_extd

	endclass:account_extd
	
	// Declare a handle for account_extd class as acc_h
	            account_extd acc_h;
	// Within initial block,
                     initial begin
			// Create an object for acc_h
	                      acc_h = new;
			// Pass the amount for the method deposit and 
                               acc_h.deposit(500);
			// Call the method summary_base to display the base class balance
                              $display("\n*******************************************************************************\n"); 
	                      $display(" summary method from base balance = %0d ",acc_h.summary_base);
	                       $display("\n*******************************************************************************\n"); 

	
	
			// Call method summary_extd to display balance
			// Observe that the super.balance returns the base class balance
                               $display("\n*******************************************************************************\n"); 
                              $display(" summary method from extend  balance = %0d " ,acc_h.summary_extd);
                              $display("\n*******************************************************************************\n"); 

                        end
		
		
		
endmodule : test_inheritance

/*
output :

*******************************************************************************

 summary method from base balance = 2500 

*******************************************************************************


*******************************************************************************

 summary method from extend  balance = 5500 

*******************************************************************************

*/

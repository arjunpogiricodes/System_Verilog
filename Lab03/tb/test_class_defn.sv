/********************************************************************************************




module test_class_defn;


	// Declare class account_c
           class account_c;

		// Within class account_c
	     	
		// Declare variable balance as int type
                int balance;

		// Write a f\unction summary that returns balance from it
             function int summary;
                 
                  return balance;
             endfunction:summary

		// Write a task deposit with pay (type int) as the input argument and add pay with the balance
            task deposite(int pay);
            balance = balance+pay;
            endtask:deposite 
          endclass:account_c
	
	// Declare a handle for class account_c
	
          account_c acnt;
          int amount;
        
	// Within initial block

		// Create an instance of the class account_c
	initial begin
              acnt = new;
              acnt.deposite(10000);
              amount = acnt.summary;
              $display("************************************************************************************************");
              $display(" the amount in the account is  = %d ",amount);
              $display(" balance in the the account is = %d ",acnt.summary); 
              $display("************************************************************************************************");

             
              
	
	
	
		// Call method deposit and pass pay value as the input argument and call method summary to display balance
            end
	
endmodule


/*
************************************************************************************************
 the amount in the account is  =       10000 
 balance in the the account is =       10000 
************************************************************************************************
           V C S   S i m u l a t i o n   R e p o r t 
*/

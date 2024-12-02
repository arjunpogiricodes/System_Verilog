


// cheking the inheritance and polimorphisam

class grand_parent;
     
         int balance;
         function new(int amount);
             balance = balance+amount;
              $display("\n***********************************************************************\n");
              $display(" grand parent balance = %0d ",balance);
              $display("\n***********************************************************************\n");

         endfunction:new

         task grand_parent_amount(int p);
              balance = balance + p;
              $display("\n***********************************************************************\n");
              $display(" grand parent balance = %0d ",balance);
              $display("\n***********************************************************************\n");

         endtask:grand_parent_amount
endclass:grand_parent

class parent extends grand_parent;

         int balance;

         function  new(int amount);
             super.new(amount);
             balance = amount+10;
              $display("\n***********************************************************************\n");
              $display(" parent balance       = %0d ",balance);
              $display("\n***********************************************************************\n");
             //super.new(amount);


         endfunction:new

         function void parent_deposit_gp(int amount);
            // super.new(amount);
             super.grand_parent_amount(amount);
         endfunction:parent_deposit_gp 
         
         task parent_deposit(int pay);
              balance = balance + pay;
              $display("\n***********************************************************************\n");
              $display(" parent balance       = %0d ",balance);
              $display("\n***********************************************************************\n");
         endtask:parent_deposit

        
                 

         task parent_gp_amount;

              $display("\n***********************************************************************\n");
              $display(" inside parent class grand parent balance = %0d ",super.balance);
              $display("\n***********************************************************************\n");

         endtask:parent_gp_amount

         task parent_amount;

              $display("\n***********************************************************************\n");
              $display(" parent balance       = %0d ",balance);
              $display("\n***********************************************************************\n");

         endtask:parent_amount
endclass:parent



class child extends parent;

          int balance;
          task child_gp_amount;
              $display("\n***********************************************************************\n");
              $display(" inside class class grand parent balance = %0d ",super.balance);
              $display("\n***********************************************************************\n");
           endtask:child_gp_amount

         function new(int amount);
             super.new(amount);
            // super.grand_parent_amount;
             balance = amount+20;
         endfunction:new 
         
         task child_p_deposit(int pay);
              super.balance = super.balance + pay;
              $display("\n***********************************************************************\n");
              $display(" parent balance       = %0d ",super.balance);
              $display("\n***********************************************************************\n");
         endtask:child_p_deposit

endclass:child 

module test;

           child ch;
           initial begin
                  ch = new(200);
                  //ch.child_deposit_p(7000);
                  $display("\n***********************************************************************\n");
                  $display("\nch = %0p ",ch); 
                  $display("\n****************************** ch.parent_deposit_gp *********************\n");
                  ch.parent_deposit_gp(1000);
                  $display("\n***********************************************************************\n");
                  $display("\nch = %0p ",ch); 

                  $display("\n********************************* ch.parent_deposit************************\n");
                  ch.parent_deposit(900); 
                  $display("\n***********************************************************************\n");
                  $display("\nch = %0p ",ch); 
                  $display("\n***********************************************************************\n");

                  $display("\n********************************* ch.child_p_deposit************************\n");
                  ch.child_p_deposit(900); 
                  $display("\n***********************************************************************\n");
                  $display("\nch = %0p ",ch); 
                  $display("\n***********************************************************************\n");


                  end
endmodule:test
  
    
/*
output:
***********************************************************************

 grand parent balance = 200 

***********************************************************************


***********************************************************************

 parent balance       = 210 

***********************************************************************


***********************************************************************


ch = '{balance:200, balance:210, balance:220} 

****************************** ch.parent_deposit_gp *********************


***********************************************************************

 grand parent balance = 1200 

***********************************************************************


***********************************************************************


ch = '{balance:1200, balance:210, balance:220} 

********************************* ch.parent_deposit************************


***********************************************************************

 parent balance       = 1110 

***********************************************************************


***********************************************************************


ch = '{balance:1200, balance:1110, balance:220} 

***********************************************************************


********************************* ch.child_p_deposit************************


***********************************************************************

 parent balance       = 2010 

***********************************************************************


***********************************************************************


ch = '{balance:1200, balance:2010, balance:220} 

***********************************************************************

*/



            
          
           
           


       


          

   
     



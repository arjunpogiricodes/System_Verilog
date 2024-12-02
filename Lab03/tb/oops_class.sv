

// creating class for the banking system

 class bank; 
       struct {string user1,user2,user2,user3,user4;
               real balance1,balance2,balance3,balance4;
               byte trans1,trans2,trans3,trans4;
               int acno1,acno2,acno3,acno4;}det;
      
     function void opening1(string name,real amount=0.0);
               det.user1 = name;
               det.balance1 = amount;
               det.trans1++;
               det.acno1 = 100;
             $display("************************************************************************************************************");
             $display("user name \t\t= %s \naccount number keepsafe = %0d\nbalance \t\t= %0.3f\ntransactions \t\t= %0d ",det.user1,det.acno1,det.balance1,det.trans1);
             $display("************************************************************************************************************");

      endfunction:opening1


      function void opening2(string name,real amount=0.0);
               det.user2 = name;
               det.balance2 = amount;
               det.trans2++;
               det.acno2 = 200;
             $display("************************************************************************************************************");
             $display("user name \t\t= %s \naccount number keepsafe = %0d\nbalance \t\t= %0.3f\ntransactions \t\t= %0d ",det.user2,det.acno2,det.balance2,det.trans2);
             $display("************************************************************************************************************");

      endfunction:opening2

     function  real deposite(int account_number,real amount=0.0);
           if(account_number == det.acno1)
              begin
                  det.balance1=amount+det.balance1;
                  det.trans1=det.trans1+1;
                   $display("************************************************************************************************************");
                    $display("user name \t\t= %s \nbalance \t\t= %0.3f\ntransactions \t\t= %0d ",det.user1,det.balance1,det.trans1);
                   $display("************************************************************************************************************");
                  return det.balance1;
               end
           else
               begin
                  $display("************************************************************************************************************");
                  $display(" wrong number wrong account enterd");
                  $display("************************************************************************************************************");

               end
              return 0;
      endfunction:deposite 

      task  check_balance(int acct_number);
            if(acct_number == det.acno1)
              begin
                  $display("************************************************************************************************************");
                  $display("user name \t\t= %s \nbalance \t\t= %0.3f  \ntransactions \t\t= %0d ",det.user1,det.balance1,det.trans1);
                  $display("************************************************************************************************************");
                  //return det.balance1;
               end
           else
               begin
                  $display("************************************************************************************************************");
                  $display(" wrong account  number enterd");
                  $display("************************************************************************************************************");
               end
      endtask:check_balance     


endclass:bank
           
//  create  module to create object and access the bank class

module top;

//  creating the instnce  handle name for class bank

    bank hdfc,canera,andra,icci;
    real amount1;

     initial
            begin
                 $display("\n************************************ address of the  hdfc ******************************************************\n");
                  $display("hdfc   = %d",hdfc);

                 hdfc = new();
                 //void opening1(string name,real amount);
                 //task check_balance(int acct_number);
                 //real deposite(int account_number,real amount);
                 
                  hdfc.opening1("jana",1000.1);
                  hdfc.check_balance(200);
                  amount1=hdfc.deposite(hdfc.det.acno1,2000);
                  hdfc.check_balance(hdfc.det.acno1);
                  $display("\n************************************ address of the  hdfc ******************************************************\n");

                  $display("hdfc   = %d",hdfc);
                  canera = hdfc;
                 $display("\n******************************* after assign canera = hdfc ******************************************************\n");

                  $display("hdfc   = %d",hdfc);
                  $display("canera = %d ",canera);
                  hdfc = null;
                 $display("\n**********************************  after assign hdfc = null  ***********************************************\n");

                  $display("hdfc   = %d",hdfc);
                  $display("canera = %d ",canera);
                  amount1=canera.deposite(canera.det.acno1,4000);

                  andra = canera;
                 $display("\n************************ after assign andra = canera  *******************************************************\n");

                  $display("andra   = %d",andra);
                  $display("canera  = %d ",canera);

                  canera = icci;
                  $display("\n*********************after assign canera = icci all banks hanles **********************************************\n");

                  $display("icci    = %d ",icci);
                  $display("canera  = %d ",canera);
                  $display("andra   = %d ",andra);
                  $display("hdfc    = %d ",hdfc);
                  
                  icci = andra;
                 $display("\n********************* after assign icci = andra print insdie components ****************************************\n");

                  $display("icci    = \n%p",icci);
                  $display("andra   = \n%p",andra);

                $display("\n********************* after creating new user for  andra print insdie components ****************************************\n");

                  andra.opening2("srinu",300.1);
                 // andra.check_balance(200);
                 // amount1=andra.deposite(andra.det.acno2,2000);

                  

                 
             
                    



             end
endmodule  

                 

           
     

/*
************************************ address of the  hdfc ******************************************************

hdfc   =                    0
************************************************************************************************************
user name 		= jana 
account number keepsafe = 100
balance 		= 1000.100
transactions 		= 1 
************************************************************************************************************
************************************************************************************************************
 wrong account  number enterd
************************************************************************************************************
************************************************************************************************************
user name 		= jana 
balance 		= 3000.100
transactions 		= 2 
************************************************************************************************************
************************************************************************************************************
user name 		= jana 
balance 		= 3000.100  
transactions 		= 2 
************************************************************************************************************

************************************ address of the  hdfc ******************************************************

hdfc   =       23456079609984

******************************* after assign canera = hdfc ******************************************************

hdfc   =       23456079609984
canera =       23456079609984 

**********************************  after assign hdfc = null  ***********************************************

hdfc   =                    0
canera =       23456079609984 
************************************************************************************************************
user name 		= jana 
balance 		= 7000.100
transactions 		= 3 
************************************************************************************************************

************************ after assign andra = canera  *******************************************************

andra   =       23456079609984
canera  =       23456079609984 

*********************after assign canera = icci all banks hanles **********************************************

icci    =                    0 
canera  =                    0 
andra   =       23456079609984 
hdfc    =                    0 

********************* after assign icci = andra print insdie components ****************************************

icci    = 
'{det:'{user1:"jana", user2:"", user3:"", user4:"", balance1:7000.1, balance2:0, balance3:0, balance4:0, trans1:3, trans2:0, trans3:0, trans4:0, acno1:100, acno2:0, acno3:0, acno4:0}}
andra   = 
'{det:'{user1:"jana", user2:"", user3:"", user4:"", balance1:7000.1, balance2:0, balance3:0, balance4:0, trans1:3, trans2:0, trans3:0, trans4:0, acno1:100, acno2:0, acno3:0, acno4:0}}

********************* after creating new user for  andra print insdie components ****************************************

************************************************************************************************************
user name 		= srinu 
account number keepsafe = 200
balance 		= 300.100
transactions 		= 1 
************************************************************************************************************
*/    

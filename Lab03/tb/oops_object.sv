

// creating  sub classs
class sub_class;
            int sub;
endclass:sub_class

// creating main classs 

class main_class;
      int main;
      int balance;
// creating constructor

      function new(int balance);
            $display("\n************************************************************************************************");
            balance = balance + balance;
            $display(" balance without using this keyword  = %d " ,balance);
            this.balance = this.balance+balance;
            $display(" balance using  this keyword         = %d " ,balance);
            $display("\n*************************************************************************************************");
      endfunction:new
// creating task method 
      task check_balance;

           $display("\n***********************************************************************************");
           $display("balalnce = %d ",balance);
           $display("\n***********************************************************************************");

      endtask:check_balance  
// task for deposite money

      task deposit(int balance);
            $display("\n************************************************************************************************");
            balance = balance ;
            $display(" balance without using this keyword  = %d " ,balance);
            this.balance =this.balance+balance;
            $display(" balance using  this keyword         = %d " ,this.balance);
            $display("\n*************************************************************************************************");
      endtask:deposit

/*
      task deposit(2000);
            $display("\n************************************************************************************************");
            balance = balance ;
            $display(" balance without using this keyword  = %d " ,balance);
            this.balance =this.balance+balance;
            $display(" balance using  this keyword         = %d " ,this.balance);
            $display("\n*************************************************************************************************");
      endtask:deposit


************************************************************************************************
 balance without using this keyword  =        2000 
 balance using  this keyword         =        3000 

*************************************************************************************************


*/


/*
      task deposit(2000);
            $display("\n************************************************************************************************");
            balance = balance + balance;
            $display(" balance without using this keyword  = %d " ,balance);
            balance =balance;
            $display(" balance using  this keyword         = %d " ,balance);
            $display("\n*************************************************************************************************");
      endtask:deposit

output :
************************************************************************************************
 balance without using this keyword  =        4000 
 balance using  this keyword         =        4000 

*************************************************************************************************

*/

/*

      task deposit(2000);
            $display("\n************************************************************************************************");
            this.balance = balance + balance;
            $display(" balance without using this keyword  = %d " ,balance);
            balance =balance;
            $display(" balance using  this keyword         = %d " ,balance);
            $display("\n*************************************************************************************************");
      endtask:deposit

************************************************************************************************
 balance without using this keyword  =        2000 
 balance using  this keyword         =        2000 

*************************************************************************************************
*/

             
// creating instance  handle for sub class
      sub_class sb = new;
endclass:main_class

                    
// creating the module for objext creation

module arjun;
       
// creating handle for main class
     main_class mc,ams,bms;

// creating the object 

     initial begin

             $display("\n********************** before  object creating ************************************\n"); 
             $display(" object mc  =%p ",mc);
             $display(" object ams =%p ",ams);
             $display("\n***********************************************************************************\n");


             mc = new(500);// creating instance object for constructor

// null object handle  checking wheather the handle has object or not using null if it is null assigning mc to ams
 
             if(ams == null)
                begin
                     ams = mc;
                end              
// printing both objects 
             $display("\n********************** afte object assigning ams = mc ************************************\n"); 
             $display(" object mc               = %0p ",mc);
             $display(" object sb object of mc  = %0p",mc.sb); 
             $display(" object ams              = %0p ",ams);
             $display(" obejct sb object of ams = %0p ",ams.sb);
             $display("\n***********************************************************************************\n");

//call task method      
            mc.check_balance;

// assign some values  to sub and main using main class
            
             mc.main = 9;
             mc.sb.sub = 4;     
             $display("\n***********************************************************************************\n");
             $display(" main class object mc       = %0p  " ,mc);
             $display(" sub object sb object of mc = %0p",mc.sb); 
             $display("\n***********************************************************************************\n");

// copying the shallow copy

             bms = new mc;
             $display("\n********************** afte shallow copy bms = new mc  ************************************\n"); 
             $display(" object ams                 = %0p ",ams);
             $display(" sub object sb object of ams = %0p",ams.sb); 
             $display(" object mc                  = %0p ",mc);
             $display(" sub object sb object of mc = %0p",mc.sb); 
             $display(" object bms                 = %0p ",bms);
             $display(" sub object sb object of bms = %0p",bms.sb); 
             $display("\n*******************************************************************************************\n");

// after edting the main and sub using bms handle

            bms.main = 2;
            bms.sb.sub = 7;
             $display("\n********************** afte editing bms three objects any changes  ************************************\n"); 
             $display(" object ams                 = %0p ",ams);
             $display(" sub object sb object of ams = %0p",ams.sb); 
             $display(" object mc                  = %0p ",mc);
             $display(" sub object sb object of mc = %0p",mc.sb); 
             $display(" object bms                 = %0p ",bms);
             $display(" sub object sb object of bms = %0p",bms.sb); 
             $display("\n*********************************************************************************************************\n");

// after editing the main and sub of ams handle

            ams.main = 300;
            ams.sb.sub = 100;   

             $display("\n********************** afte editing ams three objects any changes  ************************************\n"); 
             $display(" object ams                 = %0p ",ams);
             $display(" sub object sb object of ams = %0p",ams.sb); 
             $display(" object mc                  = %0p ",mc);
             $display(" sub object sb object of mc = %0p",mc.sb); 
             $display(" object bms                 = %0p ",bms);
             $display(" sub object sb object of bms = %0p",bms.sb); 
             $display("\n*********************************************************************************************************\n");

// using task deposite for mc
           
             mc.deposit(2000); 
$display("\n********************** after usung task deposite argumant as 2000  here ams = mc  and mc = new bms **************\n"); 
             $display(" object ams                  = %0p ",ams);
             $display(" sub object sb object of ams = %0p",ams.sb); 
             $display(" object mc                   = %0p ",mc);
             $display(" sub object sb object of mc  = %0p",mc.sb); 
             $display(" object bms                  = %0p ",bms);
             $display(" sub object sb object of bms = %0p",bms.sb); 
             $display("\n*********************************************************************************************************\n");




            end

endmodule


/*

********************** before  object creating ************************************

 object mc  =null 
 object ams =null 

***********************************************************************************


************************************************************************************************
 balance without using this keyword  =        1000 
 balance using  this keyword         =        1000 

*************************************************************************************************

********************** afte object assigning ams = mc ************************************

 object mc               = '{main:0, balance:1000, sb:{ ref to class sub_class}} 
 object sb object of mc  = '{sub:0}
 object ams              = '{main:0, balance:1000, sb:{ ref to class sub_class}} 
 obejct sb object of ams = '{sub:0} 

***********************************************************************************


***********************************************************************************
balalnce =        1000 

***********************************************************************************

***********************************************************************************

 main class object mc       = '{main:9, balance:1000, sb:{ ref to class sub_class}}  
 sub object sb object of mc = '{sub:4}

***********************************************************************************


********************** afte shallow copy bms = new mc  ************************************

 object ams                 = '{main:9, balance:1000, sb:{ ref to class sub_class}} 
 sub object sb object of ams = '{sub:4}
 object mc                  = '{main:9, balance:1000, sb:{ ref to class sub_class}} 
 sub object sb object of mc = '{sub:4}
 object bms                 = '{main:9, balance:1000, sb:{ ref to class sub_class}} 
 sub object sb object of bms = '{sub:4}

*******************************************************************************************


********************** afte editing bms three objects any changes  ************************************

 object ams                 = '{main:9, balance:1000, sb:{ ref to class sub_class}} 
 sub object sb object of ams = '{sub:7}
 object mc                  = '{main:9, balance:1000, sb:{ ref to class sub_class}} 
 sub object sb object of mc = '{sub:7}
 object bms                 = '{main:2, balance:1000, sb:{ ref to class sub_class}} 
 sub object sb object of bms = '{sub:7}

*********************************************************************************************************


********************** afte editing ams three objects any changes  ************************************

 object ams                 = '{main:300, balance:1000, sb:{ ref to class sub_class}} 
 sub object sb object of ams = '{sub:100}
 object mc                  = '{main:300, balance:1000, sb:{ ref to class sub_class}} 
 sub object sb object of mc = '{sub:100}
 object bms                 = '{main:2, balance:1000, sb:{ ref to class sub_class}} 
 sub object sb object of bms = '{sub:100}

*********************************************************************************************************


************************************************************************************************
 balance without using this keyword  =        2000 
 balance using  this keyword         =        3000 

*************************************************************************************************

********************** after usung task deposite argumant as 2000  here ams = mc  and mc = new bms **************

 object ams                  = '{main:300, balance:3000, sb:{ ref to class sub_class}} 
 sub object sb object of ams = '{sub:100}
 object mc                   = '{main:300, balance:3000, sb:{ ref to class sub_class}} 
 sub object sb object of mc  = '{sub:100}
 object bms                  = '{main:2, balance:1000, sb:{ ref to class sub_class}} 
 sub object sb object of bms = '{sub:100}

*********************************************************************************************************

*/

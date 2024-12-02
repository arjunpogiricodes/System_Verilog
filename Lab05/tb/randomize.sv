


// create the class 
class parent;

     rand bit[7:0] pkt;
     randc int lenth;
     constraint under_pkt{pkt < 1000;}
     constraint under_lenth{(lenth < 1000&&lenth >= 0);}
    function void pre_randomize();

           //pkt   = 20;
           //lenth = 5;
           $display("\n************************************* pre_randomize *********************\n"); 
           $display("vlaue of pkt = %0d lenth = %0d ",pkt,lenth);
           $display("\n**************************************************************************\n");

     endfunction:pre_randomize

    function void post_randomize;
           
           $display("\n************************************* post_randomize *********************\n"); 
           $display("vlaue of pkt = %0d lenth = %0d ",pkt,lenth);
           $display("\n************************************************************************\n");

    endfunction:post_randomize
          
    
    
endclass:parent

// creating the class constraint inheritance 


class child extends parent;
//
endclass:child

// declaring the handles 
   
    parent pa,pb;
   
// creating  module

module test;

        int result;

        initial begin
        pa = new;
        for(int i = 0;i <= 3;i++)
        begin
            if((pa.randomize())) 
             $display(" assretion result  ");
             else
             $display(" failed    ");       
        end

      /* 
        if(assert(pa.randomize())) 
             $display(" assretion result  ");
          else
            $display(" failed    ");
  
         we are not giving like this
       */
       
      pa.pkt.rand_mode(0); 

        $display(" lenth.rand_mode(0)");
 
        for(int i = 0;i <= 3 ;i++)
        begin
             result=pa.randomize();
             $display(" result = %0d ",result); 
        end
        pa.under_lenth.constraint_mode(0);

       $display(" under_pkt.constrint_mode(0)");

        for(int i = 0;i <= 3;i++)
        begin
             result=pa.randomize();
             $display(" result = %0d ",result); 
        end
       
         pa.pkt.rand_mode(1); 

        $display(" lenth.rand_mode(0)");
 
        for(int i = 0;i <= 3 ;i++)
        begin
             result=pa.randomize();
             $display(" result = %0d ",result); 
        end
        pa.under_lenth.constraint_mode(1);

       $display(" under_pkt.constrint_mode(0)");

        for(int i = 0;i <= 3;i++)
        begin
             result=pa.randomize();
             $display(" result = %0d ",result); 
        end



      

        end

endmodule:test

/*
 output:

************************************* pre_randomize *********************

vlaue of pkt = 0 lenth = 0 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 86 lenth = 965 

************************************************************************

 assretion result  

************************************* pre_randomize *********************

vlaue of pkt = 86 lenth = 965 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 225 lenth = 817 

************************************************************************

 assretion result  

************************************* pre_randomize *********************

vlaue of pkt = 225 lenth = 817 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 96 lenth = 800 

************************************************************************

 assretion result  

************************************* pre_randomize *********************

vlaue of pkt = 96 lenth = 800 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 204 lenth = 78 

************************************************************************

 assretion result  
 lenth.rand_mode(0)

************************************* pre_randomize *********************

vlaue of pkt = 204 lenth = 78 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 204 lenth = 188 

************************************************************************

 result = 1 

************************************* pre_randomize *********************

vlaue of pkt = 204 lenth = 188 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 204 lenth = 401 

************************************************************************

 result = 1 

************************************* pre_randomize *********************

vlaue of pkt = 204 lenth = 401 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 204 lenth = 727 

************************************************************************

 result = 1 

************************************* pre_randomize *********************

vlaue of pkt = 204 lenth = 727 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 204 lenth = 28 

************************************************************************

 result = 1 
 under_pkt.constrint_mode(0)

************************************* pre_randomize *********************

vlaue of pkt = 204 lenth = 28 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 204 lenth = 572216096 

************************************************************************

 result = 1 

************************************* pre_randomize *********************

vlaue of pkt = 204 lenth = 572216096 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 204 lenth = 1778795964 

************************************************************************

 result = 1 

************************************* pre_randomize *********************

vlaue of pkt = 204 lenth = 1778795964 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 204 lenth = 1758236384 

************************************************************************

 result = 1 

************************************* pre_randomize *********************

vlaue of pkt = 204 lenth = 1758236384 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 204 lenth = 172283681 

************************************************************************

 result = 1 
 lenth.rand_mode(0)

************************************* pre_randomize *********************

vlaue of pkt = 204 lenth = 172283681 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 145 lenth = -1355395355 

************************************************************************

 result = 1 

************************************* pre_randomize *********************

vlaue of pkt = 145 lenth = -1355395355 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 46 lenth = 1779082214 

************************************************************************

 result = 1 

************************************* pre_randomize *********************

vlaue of pkt = 46 lenth = 1779082214 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 248 lenth = -1145399798 

************************************************************************

 result = 1 

************************************* pre_randomize *********************

vlaue of pkt = 248 lenth = -1145399798 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 174 lenth = -1951381600 

************************************************************************

 result = 1 
 under_pkt.constrint_mode(0)

************************************* pre_randomize *********************

vlaue of pkt = 174 lenth = -1951381600 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 155 lenth = 804 

************************************************************************

 result = 1 

************************************* pre_randomize *********************

vlaue of pkt = 155 lenth = 804 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 173 lenth = 891 

************************************************************************

 result = 1 

************************************* pre_randomize *********************

vlaue of pkt = 173 lenth = 891 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 33 lenth = 173 

************************************************************************

 result = 1 

************************************* pre_randomize *********************

vlaue of pkt = 33 lenth = 173 

**************************************************************************


************************************* post_randomize *********************

vlaue of pkt = 188 lenth = 843 

************************************************************************

 result = 1 
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0

      

/*

     rand bit[7:0] pkt;
     randc int lenth;
     constraint under_pk{pkt > 1000;}


Error-[CNST-CIF] Constraints inconsistency failure
../tb/randomize.sv, 54
  Constraints are inconsistent and cannot be solved.
  Please check the inconsistent constraints being printed above and rewrite 
  them.

*/            




// creating the interface 

interface ports();
    
      int addr;
      logic [7:0]number1,number2;
      int result1,result2;
   modport FUNC(input number1,number2,output result1);
   modport TASC(input number1,number2,output result2);
     
endinterface:ports

// including the top store the data in  in q and memory

module top();
     
    int mem[bit [7:0]];
    
    ports dev();
 // including the instantiating
 
   functions dut1(dev);
   tasks dut2(dev);

   initial begin
    dev.number1 =10;
    dev.number2 =10;
     dut1.summation(dev.number1,dev.number2,dev.result1);
     dut2.prod(dev.number1,dev.number2,dev.result2);

     

   end

endmodule
    

// module for function creations function 
 
module functions( ports.FUNC dev);
 
// declaring the functions for adding the to numbers assign result

   function automatic int summation(ref logic[7:0] a ,  logic[7:0] b,int z);
         z = a+b;
         a=a+b;

          $display(" ***********************************************************************************");
          $display("\nthe sum of number  %d and %d are = %d \n",a,b,z);
          $display(" ***********************************************************************************");
    
        return z;
        endfunction:summation
endmodule:functions

// module for task creating the task 

module tasks(ports.TASC dev);

// declaring the task for multipliing the to number assign result 
    task automatic prod(ref logic[7:0] a,ref logic[7:0] b,int z);
         
         z =a*b;
         b=a+b;
                   $display(" ***********************************************************************************");
         $display("\nthe product of the number %d and %d are =%d \n ",a,b,z);
        $display(" ***********************************************************************************");
 
       endtask:prod
endmodule:tasks  

/*
 ***********************************************************************************

the sum of number   20 and  10 are =          20 

 ***********************************************************************************
 ***********************************************************************************

the product of the number  20 and  30 are =        200 
 
 ***********************************************************************************
*/ 

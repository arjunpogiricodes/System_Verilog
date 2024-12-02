
// delcaring the time sclae here

`timescale  10ns/1ns


// creating the interface for dff  with input as mux of 2 inputs d0 d1
interface dff_interface(input clk);

    logic d0,d1,sel,rst,q;
    parameter TH=2,TSTU=4;

// creating the clocking block to for rectifying overiddin and other cases getting output at exact time delay
// giving direction of ports tb to dut 
   clocking dff_cb @(posedge clk);
    default input #(TSTU) output #(TH);
      output d0,d1,sel,rst;
      input q;
   endclocking:dff_cb

   modport DUV(input d0,d1,sel,rst,clk,output q);


// creating task for sync reset
   
     task sync_reset;
     dff_cb.rst <= 1;
     dff_cb.d0 <= 1;
     dff_cb.d1 <= 1;
     dff_cb.sel <= 0;
     repeat(2)
     @(dff_cb);
     if(q == 0)
     $display(" rst is perfect ");

      
     endtask:sync_reset

// creating the task for d0 input

   task input_d0(input data);
   dff_cb.rst <= 0;
   dff_cb.d0 <= data;
   dff_cb.d1 <= ~data;
   dff_cb.sel <= 0;
   repeat(2)
    @(dff_cb);
   if(q == data)
   $display(" d0 is perfect ");
   else
   $display(" d0 is not working ");
 
   endtask:input_d0

   task input_d1(input data);
   
   dff_cb.rst <= 0;
   dff_cb.d0 <= ~data;
   dff_cb.d1 <= data;
   dff_cb.sel <= 1;
   repeat(2)
    @(dff_cb);
   if(q == data)
   $display(" d1 is perfect ");
   else
   $display(" d1 is not working");

   endtask:input_d1

   // test bech we are giving clocking blocking and function we used in the interace by using import task or function keyward 

   modport TEST(clocking dff_cb,import sync_reset,import input_d0,import  input_d1);
       
endinterface: dff_interface

// rtl of the dff (DUT)

module dff(dff_interface.DUV inter);
      logic d;

//selection of input either d0 ir d1 from inerface using selection line
 
     always@(*)
         begin
            case(inter.sel)
                   0:d=inter.d0;
                   1:d=inter.d1;
                   default:d=inter.d0;
             endcase
          end
// dff flip flop logic using posedege clk
     
      always@(posedge  inter.clk)
// here we using clock from interface for clock edge 
          begin
               if(inter.rst)
                  inter.q<=0;
               else
                  inter.q <=d;
            end     
endmodule
// declaring thr test cases here for driving diffrent input 

module testcase(dff_interface.TEST inter);
              initial
                     begin
                          @(inter.dff_cb);
                          inter.sync_reset;
                          inter.input_d0(1);
                          inter.input_d1(0);
                          inter.input_d0(0);
                          inter.input_d1(0);
                          #10 $finish;
                    end
endmodule  



 
module top();


// genrating the clk for interface
    bit clk;
    always #10 clk = ~clk;   

// driving the clk as argument to interface 
// declaring the instance of the interface

    dff_interface inter(clk);
    dff RTL(inter);
    testcase TB(inter);

endmodule


/*
 rst is perfect 
 d0 is perfect 
 d1 is perfect 
 d0 is perfect 
 d1 is perfect 
$finish called from file "../arjun/dff.sv", line 113.

*/



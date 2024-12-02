/********************************************************************************************

Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
www.maven-silicon.com

All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.

Filename       :  top.sv   

Description    :  Top for dual port ram_testbench

Author Name    :  Putta Satish

Support e-mail :  techsupport_vm@maven-silicon.com 

Version        :  1.0

Date           :  02/06/20200

*********************************************************************************************/
 module top();

   //Import ram_pkg
   import ram_pkg::*;  
  
   parameter cycle = 10;
 
   reg clock;

   //Instantiate the interface
   ram_if DUV_IF(clock);

   //Declare an handle for the test as test_h
   test test_h;
  
   //Instantiate the DUV

   ram_4096 RAM ( .clk        (clock),
                  .data_in    (DUV_IF.data_in),
                  .data_out   (DUV_IF.data_out),
                  .wr_address (DUV_IF.wr_address),
                  .rd_address (DUV_IF.rd_address),
                  .read       (DUV_IF.read),
                  .write      (DUV_IF.write)
                ); 
   
   //Generate the clock
   initial
      begin
         clock = 1'b0;
         forever #(cycle/2) clock=~clock;
      end

   initial
      begin
        
	`ifdef VCS
         $fsdbDumpvars(0, top);
        `endif 
	 //Create the object for test and pass the interface instances as arguments
         test_h = new(DUV_IF,DUV_IF, DUV_IF, DUV_IF);
         number_of_transactions = 10;
         //Call the virtual task build and virtual task run
         test_h.build();
         test_h.run();
         $finish;
      end
   
endmodule

/*

####################################################################################################################################

post_randomize 
write = 0	wr_address = 1527	data = 2079
read = 1	rd_address = 3026	data_out = x

####################################################################################################################################

read trans = 1 , write trans = 0 , write and read = 0 

####################################################################################################################################

post_randomize 
write = 1	wr_address = 2197	data = 3030
read = 0	rd_address = 28	data_out = x

####################################################################################################################################

read trans = 1 , write trans = 1 , write and read = 0 

####################################################################################################################################

post_randomize 
write = 1	wr_address = 3650	data = 3843
read = 1	rd_address = 1017	data_out = x

####################################################################################################################################

read trans = 1 , write trans = 1 , write and read = 1 

####################################################################################################################################

post_randomize 
write = 0	wr_address = 3088	data = 2801
read = 1	rd_address = 1901	data_out = x

####################################################################################################################################

read trans = 2 , write trans = 1 , write and read = 1 

####################################################################################################################################

post_randomize 
write = 1	wr_address = 2926	data = 1841
read = 1	rd_address = 2038	data_out = x

####################################################################################################################################

read trans = 2 , write trans = 1 , write and read = 2 

####################################################################################################################################

post_randomize 
write = 0	wr_address = 1366	data = 317
read = 1	rd_address = 1464	data_out = x

####################################################################################################################################

read trans = 3 , write trans = 1 , write and read = 2 

####################################################################################################################################

post_randomize 
write = 1	wr_address = 3716	data = 1637
read = 1	rd_address = 1432	data_out = x

####################################################################################################################################

read trans = 3 , write trans = 1 , write and read = 3 

####################################################################################################################################

post_randomize 
write = 0	wr_address = 2699	data = 3436
read = 1	rd_address = 2218	data_out = x

####################################################################################################################################

read trans = 4 , write trans = 1 , write and read = 3 

####################################################################################################################################

post_randomize 
write = 0	wr_address = 554	data = 315
read = 1	rd_address = 1330	data_out = x

####################################################################################################################################

read trans = 5 , write trans = 1 , write and read = 3 

####################################################################################################################################

post_randomize 
write = 0	wr_address = 1097	data = 1893
read = 1	rd_address = 2339	data_out = x

####################################################################################################################################

read trans = 6 , write trans = 1 , write and read = 3 

####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 3026	data_out = z

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 0	rd_address = 3026	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR
write = 1	wr_address = 2197	data = 3030
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR
write = 0	wr_address = 2197	data = 3030
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 1017	data_out = z

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR
write = 1	wr_address = 3650	data = 3843
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 0	rd_address = 1017	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 1901	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR
write = 1	wr_address = 2926	data = 1841
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 2038	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR
write = 0	wr_address = 2926	data = 1841
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 0	rd_address = 2038	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 1464	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR
write = 1	wr_address = 3716	data = 1637
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 1432	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR
write = 0	wr_address = 3716	data = 1637
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 0	rd_address = 1432	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 2218	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 1330	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 0	rd_address = 1330	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 2339	data_out = 0

####################################################################################################################################

$finish called from file "../test/top.sv", line 70.
$finish at simulation time                42055
           V C S   S i m u l a t i o n   R e p o r t 

*/

/*

####################################################################################################################################

post_randomize 
write = 0	wr_address = 1527	data = 2079
read = 1	rd_address = 3026	data_out = x

####################################################################################################################################

read trans = 1 , write trans = 0 , write and read = 0 

####################################################################################################################################

post_randomize 
write = 1	wr_address = 2197	data = 3030
read = 0	rd_address = 28	data_out = x

####################################################################################################################################

read trans = 1 , write trans = 1 , write and read = 0 

####################################################################################################################################

post_randomize 
write = 1	wr_address = 3650	data = 3843
read = 1	rd_address = 1017	data_out = x

####################################################################################################################################

read trans = 1 , write trans = 1 , write and read = 1 

####################################################################################################################################

post_randomize 
write = 0	wr_address = 3088	data = 2801
read = 1	rd_address = 1901	data_out = x

####################################################################################################################################

read trans = 2 , write trans = 1 , write and read = 1 

####################################################################################################################################

post_randomize 
write = 1	wr_address = 2926	data = 1841
read = 1	rd_address = 2038	data_out = x

####################################################################################################################################

read trans = 2 , write trans = 1 , write and read = 2 

####################################################################################################################################

post_randomize 
write = 0	wr_address = 1366	data = 317
read = 1	rd_address = 1464	data_out = x

####################################################################################################################################

read trans = 3 , write trans = 1 , write and read = 2 

####################################################################################################################################

post_randomize 
write = 1	wr_address = 3716	data = 1637
read = 1	rd_address = 1432	data_out = x

####################################################################################################################################

read trans = 3 , write trans = 1 , write and read = 3 

####################################################################################################################################

post_randomize 
write = 0	wr_address = 2699	data = 3436
read = 1	rd_address = 2218	data_out = x

####################################################################################################################################

read trans = 4 , write trans = 1 , write and read = 3 

####################################################################################################################################

post_randomize 
write = 0	wr_address = 554	data = 315
read = 1	rd_address = 1330	data_out = x

####################################################################################################################################

read trans = 5 , write trans = 1 , write and read = 3 

####################################################################################################################################

post_randomize 
write = 0	wr_address = 1097	data = 1893
read = 1	rd_address = 2339	data_out = x

####################################################################################################################################

read trans = 6 , write trans = 1 , write and read = 3 

####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 3026	data_out = z

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 0	rd_address = 3026	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR
write = 1	wr_address = 2197	data = 3030
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR
write = 0	wr_address = 2197	data = 3030
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 1017	data_out = z

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR
write = 1	wr_address = 3650	data = 3843
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 0	rd_address = 1017	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 1901	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR
write = 1	wr_address = 2926	data = 1841
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 2038	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR
write = 0	wr_address = 2926	data = 1841
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 0	rd_address = 2038	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 1464	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR
write = 1	wr_address = 3716	data = 1637
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 1432	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR
write = 0	wr_address = 3716	data = 1637
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 0	rd_address = 1432	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 2218	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 1330	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 0	rd_address = 1330	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 2339	data_out = 0

####################################################################################################################################

$finish called from file "../test/top.sv", line 70.
$finish at simulation time                42055
           V C S   S i m u l a t i o n   R e p o r t 

*/

/*
####################################################################################################################################

post_randomize                41055
write = 0	wr_address = 1527	data = 2079
read = 1	rd_address = 3026	data_out = x

####################################################################################################################################

read trans = 1 , write trans = 0 , write and read = 0 

####################################################################################################################################

post_randomize                41055
write = 1	wr_address = 2197	data = 3030
read = 0	rd_address = 28	data_out = x

####################################################################################################################################

read trans = 1 , write trans = 1 , write and read = 0 

####################################################################################################################################

post_randomize                41055
write = 1	wr_address = 3650	data = 3843
read = 1	rd_address = 1017	data_out = x

####################################################################################################################################

read trans = 1 , write trans = 1 , write and read = 1 

####################################################################################################################################

post_randomize                41055
write = 0	wr_address = 3088	data = 2801
read = 1	rd_address = 1901	data_out = x

####################################################################################################################################

read trans = 2 , write trans = 1 , write and read = 1 

####################################################################################################################################

post_randomize                41055
write = 1	wr_address = 2926	data = 1841
read = 1	rd_address = 2038	data_out = x

####################################################################################################################################

read trans = 2 , write trans = 1 , write and read = 2 

####################################################################################################################################

post_randomize                41055
write = 0	wr_address = 1366	data = 317
read = 1	rd_address = 1464	data_out = x

####################################################################################################################################

read trans = 3 , write trans = 1 , write and read = 2 

####################################################################################################################################

post_randomize                41055
write = 1	wr_address = 3716	data = 1637
read = 1	rd_address = 1432	data_out = x

####################################################################################################################################

read trans = 3 , write trans = 1 , write and read = 3 

####################################################################################################################################

post_randomize                41055
write = 0	wr_address = 2699	data = 3436
read = 1	rd_address = 2218	data_out = x

####################################################################################################################################

read trans = 4 , write trans = 1 , write and read = 3 

####################################################################################################################################

post_randomize                41055
write = 0	wr_address = 554	data = 315
read = 1	rd_address = 1330	data_out = x

####################################################################################################################################

read trans = 5 , write trans = 1 , write and read = 3 

####################################################################################################################################

post_randomize                41055
write = 0	wr_address = 1097	data = 1893
read = 1	rd_address = 2339	data_out = x

####################################################################################################################################

read trans = 6 , write trans = 1 , write and read = 3 

####################################################################################################################################

DATA FROM READ MONITOR               41075
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 3026	data_out = z

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR               41095
write = 0	wr_address = 0	data = 0
read = 0	rd_address = 3026	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR               41105
write = 1	wr_address = 2197	data = 3030
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR               41125
write = 0	wr_address = 2197	data = 3030
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR               41135
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 1017	data_out = z

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR               41145
write = 1	wr_address = 3650	data = 3843
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR               41155
write = 0	wr_address = 0	data = 0
read = 0	rd_address = 1017	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR               41175
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 1901	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR               41195
write = 1	wr_address = 2926	data = 1841
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR               41195
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 2038	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR               41215
write = 0	wr_address = 2926	data = 1841
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR               41215
write = 0	wr_address = 0	data = 0
read = 0	rd_address = 2038	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR               41235
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 1464	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR               41255
write = 1	wr_address = 3716	data = 1637
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR               41255
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 1432	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM WRITE MONITOR               41275
write = 0	wr_address = 3716	data = 1637
read = 0	rd_address = 0	data_out = x

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR               41275
write = 0	wr_address = 0	data = 0
read = 0	rd_address = 1432	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR               41295
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 2218	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR               41315
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 1330	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR               41335
write = 0	wr_address = 0	data = 0
read = 0	rd_address = 1330	data_out = 0

####################################################################################################################################


####################################################################################################################################

DATA FROM READ MONITOR               41355
write = 0	wr_address = 0	data = 0
read = 1	rd_address = 2339	data_out = 0

####################################################################################################################################

$finish called from file "../test/top.sv", line 70.
$finish at simulation time                42055
           V C S   S i m u l a t i o n   R e p o r t 

*/
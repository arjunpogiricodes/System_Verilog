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
=============================================================
        RANDOMIZED DATA
        _______________________________
        Transaction No.           1
        Read Transaction No.           1
        Write Transaction No.           0
        Read-Write Transaction No.           0
        _______________________________
        Read=1, write=0
        Read_Address=3026, Write_Address=1527
        Data=                2079
        Data_out=                    x
=============================================================
=============================================================
        RANDOMIZED DATA
        _______________________________
        Transaction No.           2
        Read Transaction No.           1
        Write Transaction No.           1
        Read-Write Transaction No.           0
        _______________________________
        Read=0, write=1
        Read_Address=  28, Write_Address=2197
        Data=                3030
        Data_out=                    x
=============================================================
=============================================================
        RANDOMIZED DATA
        _______________________________
        Transaction No.           3
        Read Transaction No.           1
        Write Transaction No.           1
        Read-Write Transaction No.           1
        _______________________________
        Read=1, write=1
        Read_Address=1017, Write_Address=3650
        Data=                3843
        Data_out=                    x
=============================================================
=============================================================
        RANDOMIZED DATA
        _______________________________
        Transaction No.           4
        Read Transaction No.           2
        Write Transaction No.           1
        Read-Write Transaction No.           1
        _______________________________
        Read=1, write=0
        Read_Address=1901, Write_Address=3088
        Data=                2801
        Data_out=                    x
=============================================================
=============================================================
        RANDOMIZED DATA
        _______________________________
        Transaction No.           5
        Read Transaction No.           2
        Write Transaction No.           1
        Read-Write Transaction No.           2
        _______________________________
        Read=1, write=1
        Read_Address=2038, Write_Address=2926
        Data=                1841
        Data_out=                    x
=============================================================
=============================================================
        RANDOMIZED DATA
        _______________________________
        Transaction No.           6
        Read Transaction No.           3
        Write Transaction No.           1
        Read-Write Transaction No.           2
        _______________________________
        Read=1, write=0
        Read_Address=1464, Write_Address=1366
        Data=                 317
        Data_out=                    x
=============================================================
=============================================================
        RANDOMIZED DATA
        _______________________________
        Transaction No.           7
        Read Transaction No.           3
        Write Transaction No.           1
        Read-Write Transaction No.           3
        _______________________________
        Read=1, write=1
        Read_Address=1432, Write_Address=3716
        Data=                1637
        Data_out=                    x
=============================================================
=============================================================
        RANDOMIZED DATA
        _______________________________
        Transaction No.           8
        Read Transaction No.           4
        Write Transaction No.           1
        Read-Write Transaction No.           3
        _______________________________
        Read=1, write=0
        Read_Address=2218, Write_Address=2699
        Data=                3436
        Data_out=                    x
=============================================================
=============================================================
        RANDOMIZED DATA
        _______________________________
        Transaction No.           9
        Read Transaction No.           5
        Write Transaction No.           1
        Read-Write Transaction No.           3
        _______________________________
        Read=1, write=0
        Read_Address=1330, Write_Address= 554
        Data=                 315
        Data_out=                    x
=============================================================
=============================================================
        RANDOMIZED DATA
        _______________________________
        Transaction No.          10
        Read Transaction No.           6
        Write Transaction No.           1
        Read-Write Transaction No.           3
        _______________________________
        Read=1, write=0
        Read_Address=2339, Write_Address=1097
        Data=                1893
        Data_out=                    x
=============================================================
=============================================================
DATA FROM READ MONITOR
        Read=1, write=0
        Read_Address=3026, Write_Address=   0
        Data=                   0
        Data_out=                    z
=============================================================
=============================================================
DATA FROM READ MONITOR
        Read=0, write=0
        Read_Address=3026, Write_Address=   0
        Data=                   0
        Data_out=                    0
=============================================================
=============================================================
DATA FROM WRITE MONITOR
        Read=0, write=1
        Read_Address=   0, Write_Address=2197
        Data=                3030
        Data_out=                    x
=============================================================
=============================================================
DATA FROM WRITE MONITOR
        Read=0, write=0
        Read_Address=   0, Write_Address=2197
        Data=                3030
        Data_out=                    x
=============================================================
=============================================================
DATA FROM READ MONITOR
        Read=1, write=0
        Read_Address=1017, Write_Address=   0
        Data=                   0
        Data_out=                    z
=============================================================
=============================================================
DATA FROM WRITE MONITOR
        Read=0, write=1
        Read_Address=   0, Write_Address=3650
        Data=                3843
        Data_out=                    x
=============================================================
=============================================================
DATA FROM READ MONITOR
        Read=0, write=0
        Read_Address=1017, Write_Address=   0
        Data=                   0
        Data_out=                    0
=============================================================
=============================================================
DATA FROM READ MONITOR
        Read=1, write=0
        Read_Address=1901, Write_Address=   0
        Data=                   0
        Data_out=                    0
=============================================================
=============================================================
DATA FROM WRITE MONITOR
        Read=0, write=1
        Read_Address=   0, Write_Address=2926
        Data=                1841
        Data_out=                    x
=============================================================
=============================================================
DATA FROM READ MONITOR
        Read=1, write=0
        Read_Address=2038, Write_Address=   0
        Data=                   0
        Data_out=                    0
=============================================================
=============================================================
DATA FROM WRITE MONITOR
        Read=0, write=0
        Read_Address=   0, Write_Address=2926
        Data=                1841
        Data_out=                    x
=============================================================
=============================================================
DATA FROM READ MONITOR
        Read=0, write=0
        Read_Address=2038, Write_Address=   0
        Data=                   0
        Data_out=                    0
=============================================================
=============================================================
DATA FROM READ MONITOR
        Read=1, write=0
        Read_Address=1464, Write_Address=   0
        Data=                   0
        Data_out=                    0
=============================================================
=============================================================
DATA FROM WRITE MONITOR
        Read=0, write=1
        Read_Address=   0, Write_Address=3716
        Data=                1637
        Data_out=                    x
=============================================================
=============================================================
DATA FROM READ MONITOR
        Read=1, write=0
        Read_Address=1432, Write_Address=   0
        Data=                   0
        Data_out=                    0
=============================================================
=============================================================
DATA FROM WRITE MONITOR
        Read=0, write=0
        Read_Address=   0, Write_Address=3716
        Data=                1637
        Data_out=                    x
=============================================================
=============================================================
DATA FROM READ MONITOR
        Read=0, write=0
        Read_Address=1432, Write_Address=   0
        Data=                   0
        Data_out=                    0
=============================================================
=============================================================
DATA FROM READ MONITOR
        Read=1, write=0
        Read_Address=2218, Write_Address=   0
        Data=                   0
        Data_out=                    0
=============================================================
=============================================================
DATA FROM READ MONITOR
        Read=1, write=0
        Read_Address=1330, Write_Address=   0
        Data=                   0
        Data_out=                    0
=============================================================
=============================================================
DATA FROM READ MONITOR
        Read=0, write=0
        Read_Address=1330, Write_Address=   0
        Data=                   0
        Data_out=                    0
=============================================================
=============================================================
DATA FROM READ MONITOR
        Read=1, write=0
        Read_Address=2339, Write_Address=   0
        Data=                   0
        Data_out=                    0
=============================================================

*/

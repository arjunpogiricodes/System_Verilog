// interface 

`include "../rtl/dual_mem.v"
`include "../rtl/mem_dec.v"
`include "../rtl/ram_4096.v"

interface ram_if(input bit clk);

       logic [64] data_in;
       logic [12] rd_addr,wr_addr;
       logic read,write;
       logic [64] data_out;

 // write drive clocking block for   

    clocking wr_drv @(posedge clk);
        default input#1 output #1; 
            output data_in;
            output wr_addr;
            output write;
    endclocking:wr_drv

// write monitor clocking block for

    clocking wr_mon @(posedge clk);
          default input#1 output #1;
              input data_in;
              input wr_addr;
              input write;
    endclocking:wr_mon

// read driver clocking block 

     clocking rd_drv @(posedge clk);
         default input #1 output #1;
             output rd_addr;
             output read;
     endclocking:rd_drv

// read monitor clocking block

     clocking rd_mon @(posedge clk);
        default input #1 output #1;
             input data_out;
             input read;
             input rd_addr;
     endclocking:rd_mon

// declaring the modports for each interface component

    modport WD(clocking wr_drv);
    modport WM(clocking wr_mon);
    modport RD(clocking rd_drv);
    modport RM(clocking rd_mon);

endinterface:ram_if
               
 
// test  bench architecuter for dual port ram 

// class transaction 

class trans;

     rand bit[64] data_in;
     rand bit[12] rd_addr,wr_addr;
     rand bit write,read;
     logic [64] data_out;
 
     constraint  valid_addr {rd_addr  != wr_addr;}
     constraint  valid_ctrl {{read,write} != 2'b00;}
     constraint  valid_data {data_in inside{[1:4294]};} 
   
     function bit compare(input trans ta,output string message);
           compare = '0;
              begin
                  if(this.rd_addr != ta.rd_addr)
                     begin
                         $display("\n----------------------Address Mismatched--------------------%0t\n",$time);
                         return(0); 
                     end
                  
                  else if(this.data_out != data_out)
                     begin
                         $display("\n----------------------Data_out Mismatched-------------------%0t\n",$time);
                         return(0);
                    end
                  else
                     begin
                         $display("\n----------------------Successfully Completed-------------------%0t\n",$time);
                         return(0);
                    end
               end
      endfunction:compare 
endclass:trans
 
// class   generator 

class generator; 
     
      trans ta,tb;
      mailbox #(trans) wd_mail;
      mailbox #(trans) rd_mail;
      int number_of_transaction = 10;
   

       function new(mailbox #(trans) wd_mail,mailbox #(trans) rd_mail);
           this.wd_mail = wd_mail;
           this.rd_mail = rd_mail; 
           this.ta = new;
       endfunction:new

// why virtual means here this used in env so env connectde interface if any thing connected directly or indireclty 

     virtual task start; 
          fork  begin
                 for(int i = 0; i< number_of_transaction; i++)
                     begin  
                        assert(ta.randomize())
                        else $display("!!!!!!!!!!!!!!!!!!!!!!! Classs Random Failed !!!!!!!!!!!!!!!!!!!!!!!!!!!! %0t",$time);
                        tb = new ta;
                        wd_mail.put(tb);
                        rd_mail.put(tb);
                        $display("\n########################### Generator ######################################## %0t\n",$time);

                      end
                  end
           join_none
      endtask:start 

endclass:generator


// class write driver

class write_drive;

         trans ta;
         virtual ram_if.WD wd_if;
         mailbox #(trans) wd_mail;
         
         function new(virtual ram_if.WD wd_if,mailbox #(trans) wd_mail);
            this.wd_mail = wd_mail;
            this.wd_if   = wd_if;
         endfunction:new

// wd_if modport instatantiation wr_drv clocking block name 
         virtual task drive();
                     @(wd_if.wr_drv);
                      wd_if.wr_drv.write <= ta.write;
                      wd_if.wr_drv.wr_addr <= ta.wr_addr;
                      wd_if.wr_drv.data_in <= ta.data_in;
//  wait for 1 clock cycle apllying all the input 
//  write is high wait clock cycle to write the data driving the data

                    repeat(2)
                    @(wd_if.wr_drv);
                     wd_if.wr_drv.write <= 0;
         endtask:drive  
                         
            
// start function getting data from generator and drive to dut
         virtual task start();
            fork forever
                     begin
                          wd_mail.get(ta);
                          drive();
                          $display("\n########################### write driver ########################################%0t\n",$time);

                     end
             join_none
        endtask:start  

endclass:write_drive


// read driver class

class read_drive;

// ram_if.RD IS the RD modport name for read drive 

         trans ta;
         virtual ram_if.RD rd_if;
         mailbox #(trans) rd_mail;
         
         function new(virtual ram_if.RD rd_if,mailbox #(trans) rd_mail);
            this.rd_mail = rd_mail;
            this.rd_if   = rd_if;
         endfunction:new

// rd_if modport instatantiation rd_drv clocking block name 
         virtual task drive();
                     @(rd_if.rd_drv);
                      rd_if.rd_drv.read <= ta.read;
                      rd_if.rd_drv.rd_addr <= ta.rd_addr;
                     
//  wait for 1 clock cycle apllying all the input 
//  read is high wait clock cycle to read the data driving the data

                    repeat(2)
                    @(rd_if.rd_drv);
                    rd_if.rd_drv.read <= 0;
         endtask:drive  
                         
            
// start function getting data from generator and drive to dut
         virtual task start();
            fork forever
                     begin
                          rd_mail.get(ta);
                          drive();
                          $display("\n########################### Read driver ########################################%0t\n",$time);
                     end
             join_none
        endtask:start  

endclass:read_drive

// write monitor

class write_monitor;

// two class handle for shallow copy

         trans ta,tb;
         virtual ram_if.WM wm_if;
         mailbox #(trans) rf_mail;
         
         function new(virtual ram_if.WM wm_if,mailbox #(trans) rf_mail);
            this.rf_mail = rf_mail;
            this.wm_if   = wm_if;
            this.ta      = new;  
         endfunction:new

         virtual task monitor();
                     @(wm_if.wr_mon);
                     wait(wm_if.wr_mon.write == 1'b1)
                     @(wm_if.wr_mon);
                     begin
                      ta.write = wm_if.wr_mon.write;
                      ta.wr_addr = wm_if.wr_mon.wr_addr;
                      ta.data_in = wm_if.wr_mon.data_in;
                      end 
// wait write signal hig then at posege clk we copy the data of interface to write_monitor ta handle
                  
         endtask:monitor  
                         
            
// start function getting data from interface and put  to referance model
         virtual task start();
            fork forever
                     begin
                          monitor();
                          tb = new ta;
                          rf_mail.put(tb);
                          $display("\n########################### Write Monitor ########################################%0t\n",$time);
                     end
             join_none
        endtask:start  

endclass:write_monitor

class read_monitor;

// two class handle for shallow copy

         trans ta,tb;
         virtual ram_if.RM rm_if;
         mailbox #(trans) rf_mail,sb_mail;
         
         function new(virtual ram_if.RM rm_if,mailbox #(trans) rf_mail,mailbox #(trans) sb_mail);
            this.rf_mail = rf_mail;
            this.rm_if   = rm_if;
            this.sb_mail = sb_mail;
            this.ta      = new;  
         endfunction:new

         virtual task monitor();
                     @(rm_if.rd_mon);
                     wait(rm_if.rd_mon.read == 1'b1)
                     @(rm_if.rd_mon);
                     begin
                      ta.read = rm_if.rd_mon.read;
                      ta.rd_addr = rm_if.rd_mon.rd_addr;
                      ta.data_out = rm_if.rd_mon.data_out;
                      end 
// wait read signal high then at posege clk we copy the data of interface to read_monitor ta handle
                  
         endtask:monitor  
                         
            
// start function getting data from interface and put the data to monitor to mailbox referance model and score board
         virtual task start();
            fork forever
                     begin
                          monitor();
                          tb = new ta;
                          rf_mail.put(tb);
                          sb_mail.put(tb);
                          $display("\n########################### Read Monitor ########################################%0t\n",$time);
                     end
             join_none
        endtask:start  

endclass:read_monitor

// referance classs

class referance_model;

      trans ta,tb;
// associative array for ref 
      logic [64] ref_data[int];

      mailbox #(trans) rm_mail;  
      mailbox #(trans) wm_mail;
      mailbox #(trans) sb_mail;
      
      function  new(mailbox #(trans) rm_mail,mailbox #(trans) wm_mail,mailbox #(trans) sb_mail);
            this.rm_mail = rm_mail;
            this.wm_mail = wm_mail;
            this.sb_mail = sb_mail;
      endfunction:new

// data writing task to array
     
      task dual_mem_write(trans ta);
               if(ta.write == 1'b1)
                 ref_data[ta.wr_addr]  = ta.data_in; 
      endtask:dual_mem_write

// data reading from array
      
      task dual_mem_read(trans tb);
              if(tb.read == 1'b1)
                 tb.data_out = ref_data[tb.rd_addr];
      endtask:dual_mem_read

      virtual task start();
          fork begin
               fork begin
                       forever begin
                           wm_mail.get(ta);    
                           dual_mem_write(ta);
                           end
                       forever begin
                           rm_mail.get(tb);
                           dual_mem_read(tb);
                           sb_mail.put(tb);
                           end
                     end
                join
             end  
         join_none
      endtask:start

endclass:referance_model


// score board class

class score_board;

        event done;
            
        trans ta,tb;

         mailbox #(trans) rf_mail;
         mailbox #(trans) rm_mail;

        function new( mailbox #(trans) rf_mail,mailbox #(trans) rm_mail);
           this.rf_mail = rf_mail;
           this.rm_mail = rm_mail;
        endfunction:new

        task start();
             fork
                 while(1)
                        begin
                             rm_mail.get(ta);
                             rf_mail.get(tb);
                             check(tb);
                         end
              join_none
        endtask:start

        task check(trans tb);
            string diff;
              if(tb.read == 1'b1);
              begin
                   if(!ta.compare(tb,diff))
                      begin
                          
                          $display(" %s " ,diff);
                          $finish;

                      end
                   else
                        $display(" %s " ,diff);
               end  
         endtask:check

endclass:score_board

// class environment

class env;

      virtual ram_if.WD wr_if;
      virtual ram_if.RD rd_if;
      virtual ram_if.WM wm_if;
      virtual ram_if.RM rm_if;
                                       
       mailbox #(trans) wd_mail = new();
       mailbox #(trans) wm_mail = new();
       mailbox #(trans) rd_mail = new();
       mailbox #(trans) rm_mail = new();
       mailbox #(trans) rf_mail = new();
       mailbox #(trans) sb_mail = new();


      function new(virtual ram_if.WD wr_if,virtual ram_if.RD rd_if,virtual ram_if.WM wm_if,virtual ram_if.RM rm_if);
          this.wr_if = wr_if;
          this.wm_if = wm_if;
          this.rd_if = rd_if;
          this.rm_if = rm_if;
      endfunction:new

       score_board     sb ;
       referance_model rf ;
       read_monitor    rm ;
       write_monitor   wm ;
       read_drive      rd ; 
       write_drive     wd ;
       generator       gen ;


      task build;
                 gen= new(wd_mail,rd_mail);
                 wd = new(wr_if,wd_mail);
	        rd = new(rd_if,rd_mail); 
	     wm = new(wm_if,rf_mail);
	      rm = new(rm_if,rf_mail,sb_mail);
	      rf = new(rm_mail,wm_mail,sb_mail);
	         sb = new(rf_mail,rm_mail);

      endtask:build

      task start;
          gen.start();
          wd.start();
          rd.start();
          wm.start();
          rm.start();
          sb.start();
          rf.start();
     endtask:start

    task reset_dut;
// wr_if interface modport for write driver wr_drv clocking bock name         
             wr_if.wr_drv.wr_addr  <= 0;
             wr_if.wr_drv.write    <= 1'b0;
             rd_if.rd_drv.read     <= 1'b0;
             rd_if.rd_drv.rd_addr  <= 0;
          repeat(5)
           @(wr_if.wr_drv);
          for (int i=0; i< 4096; i++)
                begin
                     wr_if.wr_drv.wr_addr  <= i;
                     wr_if.wr_drv.write    <= 1'b1;
                     wr_if.wr_drv.data_in  <= 0;
                    @(wr_if.wr_drv); 
                end
             wr_if.wr_drv.write    <= 1'b0;                
             repeat(5)
             @(wr_if.wr_drv);
      endtask:reset_dut  
                
     task stop;
         wait(sb.done.triggered);
    endtask:stop

     task run;
           //build;
           reset_dut;
           start;
           stop;
     endtask:run                
                       

// continue


endclass:env



// class test cases

class test;

      virtual ram_if.WD wr_if;
      virtual ram_if.RD rd_if;
      virtual ram_if.WM wm_if;
      virtual ram_if.RM rm_if;
      
// declaring handle for environment class

    env ea;

     function new(virtual ram_if.WD wr_if , virtual ram_if.RD rd_if , virtual ram_if.WM wm_if , virtual ram_if.RM rm_if);
          this.wr_if = wr_if;
          this.wm_if = wm_if;
          this.rd_if = rd_if;
          this.rm_if = rm_if;
          ea = new(wr_if,rd_if,wm_if,rm_if);
      endfunction:new

     task build_and_run();
        begin
         ea.build;
         #5;
         ea.run;
         $finish;
        end
     endtask:build_and_run

endclass:test




// module top

module top;
       
        parameter cycle = 10;
        bit clk;

// crweating interface instance 
        ram_if  id(clk);

// creating handle form test class

       test ta;

// instantiating dut of ram

       ram_4096 DUT(.clk(clk),
                    .data_in(id.data_in),
                    .data_out(id.data_out),
                    .wr_address(id.wr_addr),
                    .rd_address(id.rd_addr),
                    .read(id.read),
                    .write(id.write));

        initial begin

             ta = new(id,id,id,id);
             ta.build_and_run;
             $finish;
       end
// colck generating

      initial begin
            clk = 1'b0;
            forever #(cycle/2) clk = ~ clk;
      end

endmodule:top              
 



          
     






                          


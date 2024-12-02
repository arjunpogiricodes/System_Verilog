


interface inter;

     logic a,b,cin;
	 logic sum,carry;
	 
	 modport FA(input a,input b,input cin,output sum,output carry);
	 
	 modport WD(output a,output b,output cin,input sum,input carry);
	 modport WM(input a,input b,input cin,output sum,output carry);
     modport RM(input a,input b,input cin, output sum,output carry);
      	 
endinterface:inter

module full_adder(inter.FA DUT_IF);

      assign DUT_IF.sum = DUT_IF.a ^ DUT_IF.b ^ DUT_IF.cin;
      assign DUT_IF.carry = (DUT_IF.a&DUT_IF.b) | (DUT_IF.b&DUT_IF.cin) | (DUT_IF.a&DUT_IF.cin);

endmodule:full_adder	  


class packet;
       static int number;
      rand logic a,b;
	  randc logic cin;
	  logic sum,carry;
	  
	  event drv;
	  
      //constraint ctrl{{a,b} != 3'b00;}
      function void post_randomize;
        number++;
        $display("\n######################## Post_Randomize =%0d ##############################\n",number);	
        $display(" a = %b  b = %b cin = %b ",a,b,cin);		
		$display("\n######################################################################\n");
	  endfunction:post_randomize
	  
       //Understand and include the virtual function compare
   virtual function bit compare (input packet pb,output string message);
      compare='0;
      begin
         if(this.sum != pb.sum)
            begin
               $display($time);
               message ="---------  SUM NOT MATCHED ---------";
               return(0);
            end
		 else if(this.carry != pb.carry)
            begin
               $display($time);
               message ="---------  CARRY NOT MAtched ---------";
               return(0);
            end	
		else	
            begin
               message=" SUCCESSFULLY COMPARED";
               return(1);
            end
      end
   endfunction: compare

endclass:packet

class que #(type T);

    
	  T Q[$];
     // juse protected key for using only through methods only 
	  virtual function void push(T tr); 
          Q.push_back(tr);
      endfunction

   
     virtual task pop_drv(ref T tr);
         wait(Q.size()>0)
         tr = Q.pop_front();
     endtask
	 
endclass:que


class generator;

       packet pa;
	   
	   que #(packet) qa;
	   
	   
	    function new(que #(packet) qa);
            this.qa = qa;
       endfunction
	   
	   
	   task start();
	     fork begin
	        repeat(5)  
			   begin
			       #1;
			       pa = new;
			       assert(pa.randomize())
			       else $display("\n!!!!!!!!!!!!!!!!!!! violation at generator class !!!!!!!!!!!!!!!!!!!!!!!!!\n"); 
			       qa.push(pa);
				   $display("\n--------------------------- generator class --------------------------------\n"); 
				   
               end
			  end
         join_none			  
 			   
	   endtask:start
endclass:generator


   
class write_driver;

       
        packet pa;
		que #(packet) qa;
		virtual inter.WD wr_if;
		
        function new(virtual inter.WD wr_if,que #(packet) qa);
             this.wr_if = wr_if;
			 this.qa = qa;
        endfunction:new
		
		
		task drive();
		
		         #5;
           		 wr_if.a <= pa.a;
				 wr_if.b <= pa.b;
				 wr_if.cin <= pa.cin;
				  -> pa.drv; 
				 
				
		
		endtask:drive		 
				 
		
		task start();
		    fork begin
		        forever 
				begin
				qa.pop_drv(pa);
				drive();
                                 end
				end
		    join_none
		endtask:start	

endclass:write_driver			
              				
		
		
class write_monitor;

         packet pa;
		 
		 virtual inter.WM wm_if;
		 que #(packet) qa;
		 
		 function new(virtual inter.WM wm_if,que #(packet) qa);
		 
		          this.wm_if = wm_if;
				  this.qa = qa;
			      pa = new;	  
		 endfunction:new		  
		 
		 task monitor();
		                #5.2;
				 pa.a   = wm_if.a;
				 pa.b   = wm_if.b;
				 pa.cin = wm_if.cin;
				 
		 endtask:monitor

        task start();
              fork begin
			       forever begin
				              
                              monitor();
							//  #5;
                              qa.push(pa);
							  $display("\n ################### write_monitor #####################\n");
							  $display($time," a = %b  b = %b cin = %b ",pa.a,pa.b,pa.cin);
							  $display("\n ########################################################\n");
							  
                           end						   
              		end
			  join_none
        endtask:start
endclass:write_monitor


class read_monitor;

        packet pa;
        virtual inter.RM rm_if;
        que #(packet) qa;
        function new(virtual inter.RM rm_if,que #(packet) qa); 		
		          this.rm_if = rm_if;
				  this.qa = qa;
			      pa = new;   
		 endfunction:new
		 
		 task monitor();
						#5.2;
		      pa.sum = rm_if.sum;
              pa.carry = rm_if.carry;
         endtask:monitor			  
		 
		 
		 task start();
		        fork begin
                    forever begin
					    monitor();
						qa.push(pa);
						$display("\n ################### read_monitor ###############################\n");
						$display($time," a = %b  b = %b cin = %b carry = %b sum = %b",pa.a,pa.b,pa.cin,pa.carry,pa.sum);
						$display("\n ################################################################\n");
						
                    end
                    end
                join_none
         endtask:start

endclass:read_monitor

class ref_model;

      packet pa;
	  
	  que #(packet) qa,qb;
	  
	  function new( que #(packet) qa,que #(packet) qb);
	          this.qa = qa;
			  this.qb = qb;
	  endfunction:new
	  
	  task adder(packet pa); 
	       pa.sum = pa.a ^ pa.b ^ pa.cin;
		   pa.carry = (pa.a&pa.b) | (pa.b&pa.cin) | (pa.a & pa.cin);
		
	  endtask:adder	

	  virtual task start();
	       fork begin
		            forever begin
					  #5.6;
	                  qa.pop_drv(pa);
		              adder(pa);
					  qb.push(pa);
					  
					end  
			    end
            join_none				
	  endtask:start
	  
endclass:ref_model

class score_board;

      packet pa,pb;
	  
	  que #(packet) qa,qb;
	  
	  function new(que #(packet) qa,que #(packet) qb);
	         this.qa = qa;
			 this.qb = qb;
      endfunction:new
        
	 task check(packet pb);
	              string diff;
          
                  if(!pa.compare(pb,diff))
                     begin:failed_compare
                        $display("SB: Received Data");
                        $display("SB: Data sent to DUV");
                        $display($time,"%s\n%m\n\n", diff);
                        $finish;
                     end:failed_compare
                  else
                     $display("SB:  %s\n%m\n\n", diff);
       endtask:check 
	   

      task start();
          fork begin
                   forever begin
                          #5.8;
						  qa.pop_drv(pa);
                          qb.pop_drv(pb);
						  check(pb);
                          
                         end
               end
           join_none
       endtask:start
endclass:score_board	   
	  

class environment;

        virtual inter.WD wr_if;
        virtual inter.WM wm_if;
        virtual inter.RM rm_if;

        que #(packet) qa,qb,qc,qd;
         
        packet pa;

        generator gen;
        write_driver wd;
        write_monitor wm;
        read_monitor rm;
		ref_model rf;
		score_board sb;
        
        function new(virtual inter.WD wr_if,virtual inter.WM wm_if,virtual inter.RM rm_if);
		
		          this.wr_if = wr_if;
				  this.wm_if = wm_if;
				  this.rm_if = rm_if;
				  qa = new;
				  qb = new;
				  qc = new;
				  qd = new;
				  
				  
        endfunction:new

        task build();

           	gen = new(qa);
            wd  = new(wr_if,qa);
            wm  = new(wm_if,qb);			
		    rm  = new(rm_if,qc);
			rf  = new(qb,qd);
            sb  = new(qd,qc);			
	    endtask:build

        task start ();
	fork
           gen.start();
           wd.start;
           wm.start;
           rm.start;
		   rf.start;
		   sb.start;
	join
        endtask:start 
		
endclass:environment

class test;

        
        virtual inter.WD wr_if;
        virtual inter.WM wm_if;
        virtual inter.RM rm_if;	
		environment env;
		
        function new(virtual inter.WD wr_if,virtual inter.WM wm_if,virtual inter.RM rm_if);
		          this.wr_if = wr_if;
				  this.wm_if = wm_if;
				  this.rm_if = rm_if;
				  env = new(wr_if,wm_if,rm_if); 
        endfunction:new		
      		   
        task build_and_run;
		      env.build;
			  env.start;
	    endtask:build_and_run

endclass:test

module top;

      inter DUT_IF();
	  full_adder DUT(DUT_IF.FA);
	  test ta;
	  
	  initial begin
	   
	      ta = new(DUT_IF,DUT_IF,DUT_IF);
		  ta.build_and_run;
		  #40 $finish;
		  
	end

endmodule:top
	
/*

######################## Post_Randomize ##############################

 a = 1  b = 0 cin = 1

######################################################################


--------------------------- generator class --------------------------------


 ################### write_monitor #####################

 a = x  b = x cin = x

 ########################################################


 ################### read_monitor ###############################

 a = x  b = x cin = x carry = x sum = x

 ################################################################

SB:   SUCCESSFULLY COMPARED
$unit::\score_board::check



######################## Post_Randomize ##############################

 a = 0  b = 0 cin = 0

######################################################################


--------------------------- generator class --------------------------------


 ################### write_monitor #####################

 a = x  b = x cin = x

 ########################################################


 ################### read_monitor ###############################

 a = x  b = x cin = x carry = x sum = x

 ################################################################

SB:   SUCCESSFULLY COMPARED
$unit::\score_board::check



######################## Post_Randomize ##############################

 a = 0  b = 1 cin = 0

######################################################################


--------------------------- generator class --------------------------------


 ################### write_monitor #####################

 a = x  b = x cin = x

 ########################################################


 ################### read_monitor ###############################

 a = x  b = x cin = x carry = x sum = x

 ################################################################

SB:   SUCCESSFULLY COMPARED
$unit::\score_board::check



######################## Post_Randomize ##############################

 a = 0  b = 0 cin = 0

######################################################################


--------------------------- generator class --------------------------------


 ################### write_monitor #####################

 a = 1  b = 0 cin = 1

 ########################################################


 ################### read_monitor ###############################

 a = x  b = x cin = x carry = 1 sum = 0

 ################################################################

                  20
SB: Received Data
SB: Data sent to DUV
---------  CARRY NOT MAtched ---------
$unit::\score_board::check .failed_compare


$finish called from file "../ar/full_adder.sv", line 283.
$finish at simulation time                   20
           V C S   S i m u l a t i o n   R e p o r t

*/	  
/*

######################## Post_Randomize ##############################

 a = 1  b = 1 cin = 0

######################################################################


--------------------------- generator class --------------------------------


 ################### write_monitor #####################

 a = x  b = x cin = x

 ########################################################


 ################### read_monitor ###############################

 a = x  b = x cin = x carry = x sum = x

 ################################################################


######################## Post_Randomize ##############################

 a = 0  b = 1 cin = 1

######################################################################


--------------------------- generator class --------------------------------


 ################### write_monitor #####################

 a = x  b = x cin = x

 ########################################################


 ################### read_monitor ###############################

 a = x  b = x cin = x carry = 1 sum = 0

 ################################################################


######################## Post_Randomize ##############################

 a = 0  b = 1 cin = 1

######################################################################


--------------------------- generator class --------------------------------


 ################### write_monitor #####################

 a = 1  b = 1 cin = 0

 ########################################################


 ################### read_monitor ###############################

 a = x  b = x cin = x carry = 1 sum = 0

 ################################################################


######################## Post_Randomize ##############################

 a = 1  b = 1 cin = 0

######################################################################


--------------------------- generator class --------------------------------


 ################### write_monitor #####################

 a = 0  b = 1 cin = 1

 ########################################################


 ################### read_monitor ###############################

 a = x  b = x cin = x carry = 1 sum = 0

 ################################################################


######################## Post_Randomize ##############################

 a = 1  b = 1 cin = 0

######################################################################


--------------------------- generator class --------------------------------


 ################### write_monitor #####################

 a = 0  b = 1 cin = 1

 ########################################################


 ################### read_monitor ###############################

 a = x  b = x cin = x carry = 1 sum = 0

 ################################################################


######################## Post_Randomize ##############################

 a = 0  b = 1 cin = 0

######################################################################


--------------------------- generator class --------------------------------


 ################### write_monitor #####################

 a = 1  b = 1 cin = 0

 ########################################################


 ################### read_monitor ###############################

 a = x  b = x cin = x carry = 1 sum = 0

 ################################################################


######################## Post_Randomize ##############################

 a = 0  b = 1 cin = 1

######################################################################


--------------------------- generator class --------------------------------


 ################### write_monitor #####################

 a = 1  b = 1 cin = 0

 ########################################################


 ################### read_monitor ###############################

 a = x  b = x cin = x carry = 0 sum = 1

 ################################################################


######################## Post_Randomize ##############################

 a = 0  b = 1 cin = 1

######################################################################


--------------------------- generator class --------------------------------


 ################### write_monitor #####################

 a = 0  b = 1 cin = 0

 ########################################################


 ################### read_monitor ###############################

 a = x  b = x cin = x carry = 1 sum = 0

 ################################################################

$finish called from file "../ar/full_adder.sv", line 281.
$finish at simulation time                   40
           V C S   S i m u l a t i o n   R e p o r t
*/		
              		
		 
		
/*

   virtual task drive();
	   @(wr_drv_if.wr_drv_cb);
	   wr_drv_if.wr_drv_cb.data_in    <= data2duv.data;
	   wr_drv_if.wr_drv_cb.wr_address <= data2duv.wr_address;
	   wr_drv_if.wr_drv_cb.write      <= data2duv.write;
		        
	   // Wait for two clock cycles after applying all the inputs
	   // if write is high, atleast one clock cycle will be required to write the data
		repeat(2)
		   @(wr_drv_if.wr_drv_cb);

	   // Disable the write signal
	   wr_drv_if.wr_drv_cb.write <= '0;
			
   endtask: drive
   
*/		
		
 /*        		
    class mymailbox #(type T);
 
   protected T Q[$]; //must use a method to access Q
 
   function void push(T tr); 
      Q.push_back(tr);
   endfunction
   
   task get(ref T tr);
      wait(Q.size()>0)
 tr = gen2driv.pop_front();
   endtask
endclass // mymailbox

class environment;
 
   mymailbox#(transaction)  gen2driv;
   transaction_driver driver;
   transaction_generator generator;
...
...
    
     gen2driv = new();
   driver = new(gen2driv);
   generator = new(gen2driv);
.....
endclass
 
 
class transaction_generator;
 
   transaction trans;
   mymailbox#(transaction) mailbox_h;
   
   function new(mymailbox#(transaction) mbx);
      mailbox_h = mbx;
   endfunction
   ...
...
   trans = new();
   maillbox_h.push(trans);
...
..
endclass
 
class transaction_driver;
 
   transaction trans;
   mymailbox#(transaction) mailbox_h;
   
   function new(mymailbox#(transaction) mbx);
      mailbox_h = mbx;
   endfunction

...
...
 
mailbox_h.get(trans);
...
..
endclass
             			
			
			
*/	   
	   
      	   


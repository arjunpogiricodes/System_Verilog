


module data_types;

// declaring the two state data types
// bit,byte,shortint,int,longint

   //bit clk;
// clock generation -bit data type improves simulation performance 
// in clock we dont want x,z so we take 2 stae data types for this



    bit clk = 1'b0;
    always #10 clk=~clk;

   bit [10:0] vbus;
   int cnt;
   int unsigned cnt1;
   byte crc_byte;
   shortint sint;
   longint lint;

   initial
         begin
            $display("===================================================================================");

            #5;
            @(posedge clk)
             vbus=11'd10;
            $display("vbus=%b",vbus);
             cnt =10;
            $display("cnt=%b",cnt);
             cnt1=10;
             $display("cnt1=%b",cnt1);
           @(posedge clk)
             crc_byte=10;
            $display("crc_byte=%b",crc_byte);
             sint =10;
            $display("sint=%b",sint);
             lint =10;
            $display("lint=%b",lint);
            $display("===================================================================================");
          end

// creating the structer 
// array fo differnt data types

   struct {bit [7:0] address;
           logic [7:0] payload[0:63];
           enum {good=11,error} pkt_type;
           logic [7:0] parity;} packet;

   initial
          begin
              #50;
              packet.address = 8'd30;
              //packet.pkt_type =packet.pkt_type.first();
             packet.pkt_type=good; //not advised to provide integral value only named constant or method shoul be used.
              $display("address =%d and  pkt_type = %d ",packet.address,packet.pkt_type);
            $display("===================================================================================");


          end
// CREATING THE  enum data type

  enum {arjun=84980483,jana=9553874,srinu=9912481,just}phone;

   initial
          begin
              #100;
              phone = arjun;
              $display("phone num   %p \n",phone);
              phone = phone.next();
              @(posedge clk)
              $display("phone num   %d \n",phone);
             phone = phone.last();
             @(posedge clk)
             $display("phone num   %d \n",phone);
             phone = phone.prev();
             @(posedge clk)
              $display("phone num   %d \n",phone);
             phone = phone.next(2);
            @(posedge clk)
              $display("phone num   %s \n",phone);
            $display("===================================================================================");
         end

// creating the user defined data typdef


  typedef struct { bit[7:0] r,g,b;} pixel;
    pixel samsung;
    pixel sony;
       initial
             begin
             #200;
             @(posedge clk)
             samsung.r=8'd20;
             sony.r=8'd10;
             $display("r=%d r=%d r=%d ",samsung.r,samsung.g,samsung.b);
             @(posedge clk)
             $display("sony r = %d sony g =%d sony b =%d ",sony.r,sony.g,sony.b);
            $display("===================================================================================");

        end

  
                  

// creating the enumerated types
// list of values

  typedef   enum{init,read,write,brd,bwr}fsm_state;
  fsm_state state;
    initial
        begin
              #250;
              @(posedge clk)
              $display(" %p",state);
            $display("===================================================================================");
         end
   

// type convertions state and dynamic 
// static we dirctly do the opearation static two types 
// implicit and explicit 
// implicit - truncated 9.8=> 9
// explicit - rounded  9.8 => 10
// dynamic we using $cast  keyward

    

   initial
          begin
             #280;
             // cnt = state;
              @(posedge clk)
              $display(" cnt = %s ",state);
              state = read;
              @(posedge clk)
              state= fsm_state'(5);
              $display(" cnt = %s ",state);

              // it act like task because it cant return any values
              #5;
              $cast(state,2);
                   if($cast(state,3))   
                       $display(" CASTING IS SUCESSFULL");
                   else
                       $display("  CASTING IS FAILED");
            $display("===================================================================================");

            end
 
// creating the string 
// varial length we dont need to mentioned the as per verlog here the size automatically increse
     task disp(string f);
           $display("Time = %0t %s ",$time,f);
     endtask

    string str;
    initial 
           begin
              #320;
               @(posedge clk)
                str = "MAVEN-SILICON";
                $display("%s",str);
              @(posedge clk)
                str = str.tolower();
                // convert the upper case string into lower case
                $display("%s",str); 
                 @(posedge clk)

                $display(" charecter in 5th position is %s ", str.getc(5));
                // getting 5th postion of the str

                 @(posedge clk)
                $display("string is :%s",str); 

                 @(posedge clk)  
                str.putc(5,"_");
                 $display("%s",str); 


               // here replacing the "_" at the 5th position of str string

                 @(posedge clk)
                $display("%s",str.substr(6,str.len-1));

                 @(posedge clk)
                str = {str,".com"};

                // here we doing concatnation operation stored in str 
 
                 @(posedge clk)
                $display("%s",str);
                str = {{3{"w"}},".",str};

                 @(posedge clk)
                // here we use verilog replicate operation {3{w}} it give www and total will be concatnate wholke thing and stored in str
                $display("%s",str);

                @(posedge clk)
                disp($sformatf("https://%s",str));
                // here the $sformatf is a c++, built in function convert things into string fromat here we declaraed in inside string another string  %s s                //pecifeir and str name reference
                 @(posedge clk)

                str=str.toupper();
                $display("%s",str);
            $display("===================================================================================");

               #50 $finish; 
            end  
      





endmodule:data_types       


/*
OUTPUT:
===================================================================================
# vbus=00000001010
# cnt=00000000000000000000000000001010
# cnt1=00000000000000000000000000001010
# crc_byte=00001010
# sint=0000000000001010
# lint=0000000000000000000000000000000000000000000000000000000000001010
# ===================================================================================
# address = 30 and  pkt_type =          11 
# ===================================================================================
# phone num   arjun 
# 
# phone num       9553874 
# 
# phone num       9912482 
# 
# phone num       9912481 
# 
# phone num   arjun 
# 
# ===================================================================================
# r= 20 r=  0 r=  0 
# sony r =  10 sony g =  0 sony b =  0 
# ===================================================================================
#  init
# ===================================================================================
#  cnt = init 
#  cnt = 5 
#  CASTING IS SUCESSFULL
# ===================================================================================
# MAVEN-SILICON
# maven-silicon
#  charecter in 5th position is - 
# string is :maven-silicon
# maven_silicon
# silicon
# maven_silicon.com
# www.maven_silicon.com
# Time = 510 https://www.maven_silicon.com 
# WWW.MAVEN_SILICON.COM
# ===================================================================================

*/ 

      

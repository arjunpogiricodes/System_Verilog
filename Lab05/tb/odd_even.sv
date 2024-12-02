


// storing odd into even location and even umber into odd location from range [1:20]

class gen;

   randc int a;
   constraint ran{ a inside{[0:19]};}
    function void post_randomize();
                             
                   if(a%2 == 0 )  
                       a =a+1;

                   if(a%2 == 1 )
                       a =a+1;
                   

           //d[i] = ga.a;
          //end

    endfunction
  // task dis;
  // for(int i=1;i<21;i++) begin
   
   //constraint even{ d[i] = d[i]+1 -> (d[i]%2 == 0);}
   //constraint odd{ d[i] = d[i]+1 -> (d[i]%2 == 1);}
   
   // end 

      //endtask:dis

endclass:gen

gen ga;
 
module test;
         int d[];
        initial begin
          ga =  new;
          d = new[20];
       for(int i=0;i<21;i++)
             begin 
                   ga.randomize;

                   d[i] = ga.a;
            end
 
           $display(" %0p " , d);
        end
endmodule:test          

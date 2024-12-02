




class prob;
      
  rand    int  ar[];
    
/*
 constraint friday  { ar.size() == 6;}
     constraint friday1 { foreach(ar[i]) ar[i] inside{[25:45]};}
     //constraint friday2 { a}
     constraint friday3 { foreach(ar[i]) (ar[i]%5 == 0 && ar[i] != 35 )|| (ar[i]%9 == 0) ;}
 
   */

     constraint friday  { ar.size() == 6;foreach(ar[i]) ar[i] inside{[25:45]};foreach(ar[i]) ar[i]%5 == 0 ||ar[i]%9 == 0 && ar[i] != 35;
	foreach(ar[i]) 
	if(i<5)
  	ar[i] < ar[i+1]; }




  function void post_randomize;
     //ar.sort();       
  foreach(ar[i])
        $write("%0d\t",ar[i]);
        $display("\n");
     endfunction:post_randomize
  
endclass:prob 
  
prob pa;

module test;

  //int suc;
   initial begin
        
         pa = new;

         //assert(pa.randomize() with {unique{pa.ar};})
           assert(pa.randomize() with {unique{ar};});
          //$display(" succes = %0d ",suc);
         //assert(pa.randomize())
              //    else
            // $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! violation !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
         
         $display("arry =  %0p " ,pa.ar);
      
    
   end     

endmodule:test


/*
25	27	35	36	40	45	

arry =  '{25, 27, 35, 36, 40, 45}  
           V C S   S i m u l a t i o n   R e p o r t 
*/

/*

	foreach(ar[i]) 
  	ar[i] < ar[i+1]; }
// if your giving like this constrinat error

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! violation !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
arry =  '{25, 27, 30, 36, 40, 45}  
           V C S   S i m u l a t i o n   R e p o r t 
*/    

/*

class prob;
      
     rand int  a[];
    


 constraint friday  { a.size() == 10;
                      unique{a};
                      foreach(a[i]) a[i] inside {[5:100]};
                      foreach(a[i]){
                                    if(i==0) 
                                         a[i] == 6;
                                    else 
                                         a[i] == a[i-1]+10;
                                    }  
                     }



  function void post_randomize;
     a.sort();       
  foreach(a[i])
        $write("%0d\t",a[i]);
        $display("\n");
     endfunction:post_randomize
  
endclass:prob 
  
prob pa;

module test;

   initial begin
        
         pa = new;

         //assert(pa.randomize() with {unique{pa.ar};})
         assert(pa.randomize())
                  else
             $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! violation !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
         
         $display("arry =  %0p " ,pa.a);
       
    
   end     

endmodule:test
     
*/

/*
6	16	26	36	46	56	66	76	86	96	

arry =  '{6, 16, 26, 36, 46, 56, 66, 76, 86, 96}  
           V C S   S i m u l a t i o n   R e p o r t 

*/

/*
class prob;
      
     rand int  a[];
    


 constraint friday  { a.size() == 8;
                      //unique{a};
                      foreach(a[i]) a[i] inside {[0:29]};
                      foreach(a[i]){
                                    if(i==0) 
                                         a[i] == 0;
                                    else 
                                         a[i] == a[i-1]+i;
                                    }  
                     }



  function void post_randomize;
     //a.sort();       
  foreach(a[i])
        $write("%0d\t",a[i]);
        $display("\n");
     endfunction:post_randomize
  
endclass:prob 
  
prob pa;

module test;

   initial begin
        
         pa = new;

         //assert(pa.randomize() with {unique{pa.ar};})
         assert(pa.randomize())
                  else
             $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! violation !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
         
         $display("arry =  %0p " ,pa.a);
       
    
   end     

endmodule:test

*/

/*
0	1	3	6	10	15	21	28	

arry =  '{0, 1, 3, 6, 10, 15, 21, 28}  
           V C S   S i m u l a t i o n   R e p o r t 
*/



/*

class prob;
      
     rand int  a[];
    


 constraint friday  { a.size() == 12;
                      //unique{a};
                      //foreach(a[i]) a[i] inside {[0:9]};
                      foreach(a[i]){
                                    if(i<3) 
                                         a[i] == i+1;
                                    else if(i>2 && i < 6)
                                         a[i] == 6-i;
                                    else if (i>5 && i<9)
                                          a[i] == i-2;  
                                    else if( i> 8)
                                         a[i] == 15 - i;  
                                    }  
                     }



  function void post_randomize;
     //a.sort();       
  foreach(a[i])
        $write("%0d\t",a[i]);
        $display("\n");
     endfunction:post_randomize
  
endclass:prob 
  
prob pa;

module test;

   initial begin
        
         pa = new;

         //assert(pa.randomize() with {unique{pa.ar};})
         assert(pa.randomize())
                  else
             $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! violation !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
         
         $display("arry =  %0p " ,pa.a);
       
    
   end     

endmodule:test
*/

/*
1	2	3	3	2	1	4	5	6	6	5	4	

arry =  '{1, 2, 3, 3, 2, 1, 4, 5, 6, 6, 5, 4}  
           V C S   S i m u l a t i o n   R e p o r t 
*/

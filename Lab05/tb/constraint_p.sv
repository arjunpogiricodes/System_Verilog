


// cheking different things for constraint

/*

// 111222333444
class practice;

        rand bit[4:0] pat[];
        constraint log { pat.size() == 12;
                         foreach (pat[i]) 
                         pat[i] == (i+3)/3;
                          
                       }
        function void post_randomize;
             $display(" %0p ",pat);
         endfunction:post_randomize

endclass:practice

practice  pa;

module test;

         initial begin
              pa = new;
              assert(pa.randomize) else $display(" constraint violated! ");
          end
endmodule:test          
*/ 

/*

output :

 '{'h1, 'h1, 'h1, 'h2, 'h2, 'h2, 'h3, 'h3, 'h3, 'h4, 'h4, 'h4}  
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0

*/


// 123321456654

/*
class pak;

     rand bit[3:0] res[];
    // int a,b;
 
     constraint s { 
                   res.size() == 12; }
     constraint m {             
                   foreach(res[i])
                               {
                            if(i > 2 && i < 6)
                                {
                               res[i] == 6-i ;
                               }
                            else if( i > 5 && i < 9)
                               res[i] == i - 2; 
                            else if(i > 8)
                               res[i] == 15-i;
                            else if( i<3)
                                 res[i] == i+1;

                                 }
                    }
                  
     function void post_randomize;
         // a++;
         // if( a >= 3)
           //  b++;
         // if ( a >= 6)
            //   b++; 
          $display(" %0p ",res);
     endfunction:post_randomize

endclass:pak
pak pa;

module test;

         initial begin

                pa = new;
                
                assert(pa.randomize()) else $display("\n /////////////constrint voilated !/////////////////////////\n");
               
                 end



endmodule:test 

*/
/*

 '{'h1, 'h2, 'h3, 'h3, 'h2, 'h1, 'h4, 'h5, 'h6, 'h6, 'h5, 'h4}  
           V C S   S i m u l a t i o n   R e p o r t 

*/   

// 9753186420

/*
class pak;

     rand bit[3:0] res[];
    // int a,b;
 
     constraint s { 
                   res.size() == 10; }
     constraint m {             
                   foreach(res[i]) {
                     if(i<5)
                        res[i] == 10-((i*2)+1);
                     if(i>4)
                        res[i] == 18-(i*2); 

                    }}
                  
     function void post_randomize;

          $display(" %0p ",res);
     endfunction:post_randomize

endclass:pak
pak pa;

module test;

         initial begin

                pa = new;
                
                assert(pa.randomize()) else $display("\n /////////////constrint voilated !/////////////////////////\n");
               
                 end



endmodule:test 
*/ 

/*
 '{'h9, 'h7, 'h5, 'h3, 'h1, 'h8, 'h6, 'h4, 'h2, 'h0}  
           V C S   S i m u l a t i o n   R e p o r t 
*/

// 25,27,30,34,40,45


/*
class pak;

     rand bit[6:0] res[];
    //int i =5;
      
     constraint m {  
                    res.size() == 6;         
                    foreach(res[i])
                     (res[i]<res[i+1]) && (res[i] inside{[25:45]});}
    constraint f {  
                    foreach(res[i])                                        
                    (res[i]%5 == 0) && (res[i] != 35) || (res[i]%9 == 0); 
                     }             
                    
                  
     function void post_randomize;

          $display(" %0p ",res);
     endfunction:post_randomize

endclass:pak
pak pa;

module test;

         initial begin

                pa = new;
                
                assert(pa.randomize()) else $display("\n /////////////constrint voilated !/////////////////////////\n");
               
                 end



endmodule:test 


*/
 
class pak;

     rand  int unsigned res[];
    //int i =5;
      
     constraint m {  
                    res.size() == 6;
                           
                    foreach(res[i])
                     res[i] << res[i+1] &&  res[i] inside{[0:28]} && res[i]+i;}         
                    
                  
     function void post_randomize;

          $display(" %0p ",res);
     endfunction:post_randomize

endclass:pak
pak pa;

module test;

         initial begin

                pa = new;
                
                assert(pa.randomize()) else $display("\n ///////////// constrint voilated! /////////////////////////\n");
               
                 end



endmodule:test 


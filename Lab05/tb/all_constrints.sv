// ckecking all the differnt ways of constrints


/*
class trans;
      rand bit[6:0] addr;
      constraint a{ soft addr > 63;}

      function void post_randomize;
            $display("\n****************  post_randomize  ***********************");
            $display(" address   = %0d " , addr);
            $display("*********************************************************\n");
      endfunction:post_randomize

endclass:trans

trans ta;

module test;
       
      initial begin
                ta = new;
                repeat(20) begin
                assert(ta.randomize() with {addr <20;})
                     else $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CONSTRAINTS VIOLATION  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          
                $display("\n ta.addr = %0d \n",ta.addr);
                end
             end


endmodule:test  
                   */
// soft constrints works only when there is conflict occurs 

/*
****************  post_randomize  ***********************
 address   = 6 
*********************************************************


 ta.addr = 6 


****************  post_randomize  ***********************
 address   = 3 
*********************************************************


 ta.addr = 3 


****************  post_randomize  ***********************
 address   = 0 
*********************************************************


 ta.addr = 0 


****************  post_randomize  ***********************
 address   = 1 
*********************************************************


 ta.addr = 1 


****************  post_randomize  ***********************
 address   = 2 
*********************************************************


 ta.addr = 2 


****************  post_randomize  ***********************
 address   = 11 
*********************************************************


 ta.addr = 11 


****************  post_randomize  ***********************
 address   = 4 
*********************************************************


 ta.addr = 4 

*/   

/*

class trans;
      rand bit[6:0] addr;
      constraint a{ soft addr < 63;}

      function void post_randomize;
            $display("\n****************  post_randomize  ***********************");
            $display(" address   = %0d " , addr);
            $display("*********************************************************\n");
      endfunction:post_randomize

endclass:trans

trans ta;

module test;
       
      initial begin
                ta = new;
                repeat(10) begin
                assert(ta.randomize() with {addr >20;})
                     else $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CONSTRAINTS VIOLATION  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          
                $display("\n ta.addr = %0d \n",ta.addr);
                end
             end


endmodule:test

*/
/*

//for normall cases it wroking fine constrints applied

****************  post_randomize  ***********************
 address   = 43 
*********************************************************


 ta.addr = 43 


****************  post_randomize  ***********************
 address   = 25 
*********************************************************


 ta.addr = 25 


****************  post_randomize  ***********************
 address   = 32 
*********************************************************


 ta.addr = 32 


****************  post_randomize  ***********************
 address   = 24 
*********************************************************


 ta.addr = 24 


****************  post_randomize  ***********************
 address   = 22 
*********************************************************


 ta.addr = 22 


****************  post_randomize  ***********************
 address   = 29 
*********************************************************


 ta.addr = 29 


****************  post_randomize  ***********************
 address   = 34 
*********************************************************


 ta.addr = 34 


****************  post_randomize  ***********************
 address   = 23 
*********************************************************


 ta.addr = 23 


****************  post_randomize  ***********************
 address   = 48 
*********************************************************


 ta.addr = 48 


****************  post_randomize  ***********************
 address   = 43 
*********************************************************


 ta.addr = 43 

           V C S   S i m u l a t i o n   R e p o r t
*/  

// set membership from an array
// give a range using inside we noramlly called set membership
/*

class trans;
      rand bit[6:0] addr;
      bit[6:0] arr[] = {1,2,3,4,5,6,7,8,9,10,11};

      constraint a{ 
                  // foreach(arr[i])
                        //  addr == arr[i];
                   addr inside {arr};
                   //foreach(arr[i])unique{addr};
 
                  }

      function void post_randomize;
            $display("\n****************  post_randomize  ***********************");
            $display(" address   = %0d " , addr);
            $display("*********************************************************\n");
      endfunction:post_randomize

endclass:trans

trans ta;

module test;
       
      initial begin
                ta = new;
                
                assert(ta.randomize() )
                     else $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CONSTRAINTS VIOLATION  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          
                $display("\n ta.addr = %0d \n",ta.addr);
                
             end


endmodule:test

*/
// if your using randc for unique key its theone a error 
/*
The expression contains the variable addr of type randc and cannot be used 
  in solve-before, distribution, unique and function calls.
  Change the type of the randc variable or remove it from the expression.
*/

// if your giving unbounde value like 9870 for arr[6:0] inside it consider last 7 lsb bits give to constrints

/*

****************  post_randomize  ***********************
 address   = 2 
*********************************************************


 ta.addr = 2 

*/


// static constraint


/*

class trans;
      rand bit[6:0] addr;
    
      bit[6:0] arr[] = {1,2,3,4,5,6,7,8,9,10,11};

      static constraint a{ 
                            addr inside {arr};
                         }

      function void post_randomize;
            $display("\n****************  post_randomize  ***********************");
            $display(" address   = %0d " , addr);
            $display("*********************************************************\n");
      endfunction:post_randomize

endclass:trans

trans ta,tb,tc;

module test;
       
      initial begin
                ta = new;
                tb = new ;
                tc = new;
// complusary to declar object for every handle 
                
                assert(ta.randomize() )
                     else $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CONSTRAINTS VIOLATION  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          
                $display("\n ta.addr = %0d \n",ta.addr);

                              
               tc.a.constraint_mode(0);

                assert(tc.randomize() )
                     else $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CONSTRAINTS VIOLATION  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          
                $display("\n after tc.a constraint disabled fot tc  tc.addr = %0d \n",tc.addr);

                assert(ta.randomize() )
                     else $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CONSTRAINTS VIOLATION  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          
                $display("\n after tc.a constraint disabled fot tb  ta.addr = %0d \n",ta.addr);
                
               ta.a.constraint_mode(1);

                assert(tc.randomize() )
                     else $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CONSTRAINTS VIOLATION  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          
                $display("\n after ta.a constraint enabled fot tc  tc.addr = %0d \n",tc.addr);

                assert(ta.randomize() )
                     else $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CONSTRAINTS VIOLATION  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          
                $display("\n after ta.a constraint enabled fot tb  ta.addr = %0d \n",ta.addr);



             end


endmodule:test

*/

// static constraint defualt for all handle if your disabled constraint mode using one handle it applicable for other handle also
/*
****************  post_randomize  ***********************
 address   = 2 
*********************************************************


 ta.addr = 2 


****************  post_randomize  ***********************
 address   = 107 
*********************************************************


 after tc.a constraint disabled fot tc  tc.addr = 107 


****************  post_randomize  ***********************
 address   = 91 
*********************************************************


 after tc.a constraint disabled fot tb  ta.addr = 91 


****************  post_randomize  ***********************
 address   = 7 
*********************************************************


 after ta.a constraint enabled fot tc  tc.addr = 7 


****************  post_randomize  ***********************
 address   = 2 
*********************************************************


 after ta.a constraint enabled fot tb  ta.addr = 2 

           V C S   S i m u l a t i o n   R e p o r t 
Time: 0

*/

// extern 

/*

class trans;
      rand bit[6:0] addr;
    
      bit[6:0] arr[] = {1,2,3,4,5,6,7,8,9,10,11};

      constraint a;
 
      function void post_randomize;
            $display("\n****************  post_randomize  ***********************");
            $display(" address   = %0d " , addr);
            $display("*********************************************************\n");
      endfunction:post_randomize

endclass:trans


     constraint trans :: a{ 
                            addr inside {arr};
                         }


trans ta;

module test;
       
      initial begin
                ta = new;
                
                assert(ta.randomize() )
                     else $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CONSTRAINTS VIOLATION  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          
                $display("\n ta.addr = %0d \n",ta.addr);

                              
               ta.a.constraint_mode(0);


                assert(ta.randomize() )
                     else $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CONSTRAINTS VIOLATION  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          
                $display("\n after ta.a constraint disabled fot tb  ta.addr = %0d \n",ta.addr);
               

             end


endmodule:test

*/
/*

****************  post_randomize  ***********************
 address   = 2 
*********************************************************


 ta.addr = 2 


****************  post_randomize  ***********************
 address   = 91 
*********************************************************


 after ta.a constraint disabled fot tb  ta.addr = 91 

           V C S   S i m u l a t i o n   R e p o r t 

*/

// calling function inside class

/*

class trans;
      rand bit[6:0] addr1;
      rand bit[5:0] addr2;
      bit[6:0] arr[] = {1,2,3,4,5,6,7,8,9,10,11};
      rand int sum1;
      constraint a;

      extern function int summer(bit[6:0]a,bit[5:0]b);

      function void post_randomize;
            $display("\n****************  post_randomize  ***********************");
            $display(" add1   = %0d  add2  = %0d   sum =%d " ,addr1,addr2,sum1);
            $display("*********************************************************\n");
      endfunction:post_randomize

endclass:trans

     function int trans :: summer (bit[6:0]a,bit[5:0]b);
             summer = a+b;
     endfunction:summer 

     constraint trans :: a{ 
                            addr1 inside {arr};
                            addr2 inside {arr};
                            sum1 == summer(addr1,addr2); 
                         }
// gave rand sum then only it take insdie constraint

trans ta;

module test;
       
      initial begin
                ta = new;
                
                assert(ta.randomize() )
                     else $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CONSTRAINTS VIOLATION  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          
                $display(" add1   = %0d  add2  = %0d   sum =%d " ,ta.addr1,ta.addr2,ta.sum1);

                              
               ta.a.constraint_mode(0);
          $display(" constrainmt disabled");


                assert(ta.randomize() )
                     else $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CONSTRAINTS VIOLATION  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                 $display(" constrainmt disabled");
                $display(" add1   = %0d  add2  = %0d   sum =%d " ,ta.addr1,ta.addr2,ta.sum1);

                ta.a.constraint_mode(1);

               $display(" constrainmt enabled");

                assert(ta.randomize() )
                     else $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CONSTRAINTS VIOLATION  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          
                $display(" add1   = %0d  add2  = %0d   sum =%d " ,ta.addr1,ta.addr2,ta.sum1);

                assert(ta.randomize() )
                     else $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CONSTRAINTS VIOLATION  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          
                $display(" add1   = %0d  add2  = %0d   sum =%d " ,ta.addr1,ta.addr2,ta.sum1);

 
               

             end


endmodule:test
    

*/

/*

****************  post_randomize  ***********************
 add1   = 2  add2  = 7   sum =          9 
*********************************************************

 add1   = 2  add2  = 7   sum =          9 
 constrainmt disabled

****************  post_randomize  ***********************
 add1   = 69  add2  = 31   sum = 1888924327 
*********************************************************

 constrainmt disabled
 add1   = 69  add2  = 31   sum = 1888924327 
 constrainmt enabled

****************  post_randomize  ***********************
 add1   = 2  add2  = 11   sum =         13 
*********************************************************

 add1   = 2  add2  = 11   sum =         13 

****************  post_randomize  ***********************
 add1   = 1  add2  = 1   sum =          2 
*********************************************************

 add1   = 1  add2  = 1   sum =          2 
           V C S   S i m u l a t i o n   R e p o r t 

*/

// without class

module test;

   int a,b;
    int sum1;

   initial begin
        repeat(10) begin
        std::randomize(a,b) with { 
                                   a > 10;
                                   a < 100;
                                   b < 200;
                                   b > 100;
                                 };
        sum1 = a+b;
        $display("  a = %0d b = %0d sum = %0d ", a,b,sum1);
        end end
endmodule:test 

/*

  a = 67 b = 121 sum = 188 
  a = 12 b = 107 sum = 119 
  a = 54 b = 102 sum = 156 
  a = 61 b = 112 sum = 173 
  a = 50 b = 147 sum = 197 
  a = 62 b = 177 sum = 239 
  a = 75 b = 113 sum = 188 
  a = 58 b = 137 sum = 195 
  a = 83 b = 179 sum = 262 
  a = 11 b = 114 sum = 125 
           V C S   S i m u l a t i o n   R e p o r t 
*/
  
          

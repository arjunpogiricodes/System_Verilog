


// create the class for parent

class parent;

    local logic[3:0]a;
    protected logic [3:0]b;


    protected function void display();

          $display("\n***********************************************************************\n");
          $display("a = %0d , b = %0d " ,a,b);
          $display("\n***********************************************************************\n");
          
    endfunction:display



    function void update(logic [3:0]a,b);
               this.a = a;
               this.b = b;
               $display("\n***********************************************************************\n");
               $display("a = %0d , b = %0d " ,a,b);
               $display("\n***********************************************************************\n");

    endfunction:update
  
endclass:parent

// creating the class for child

class child extends parent;

    logic [7:0]c;
    function void calc();
        super.display();
       // super.a = 2;
        super.b = 1;
    endfunction:calc

endclass:child 
 
   

// creating the class handle

   parent pa;
   child  ca;

// creating the object

module test;
 
       initial begin
                      pa = new();
                      //pa.a = 2;
                     // pa.b = 1;
                      pa.update(1,2);
                      ca=new;
                      ca.update(3,4);
                      //ca.display();
                      ca.calc();
                end
 
endmodule:test   

/*
output:
***********************************************************************

a = 1 , b = 2 

***********************************************************************


***********************************************************************

a = 3 , b = 4 

***********************************************************************


***********************************************************************

a = 3 , b = 4 

***********************************************************************

           V C S   S i m u l a t i o n   R e p o r t 
*/  

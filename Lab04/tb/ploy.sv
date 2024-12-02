// declaring  classs here

class grandparent;
      int a;
     const  int c  = 20;
      function new(int a);
        //int c = b;
        this.a = a;
          
        $display("\n*********************************  inside the grandparent class *************************************\n");
        $display("value of a is : %0d ",this.a);
        $display("value of a is : %0d ",c);
        $display("\n****************************************************************************************************\n");
      endfunction:new

     function void paste();
        //c = b;
        
        //this.a = a;
        $display("\n*********************************  inside the grandparent class *************************************\n");
        $display("value of a is : %0d ",a);
        $display("value of c is : %0d ",c);
        $display("\n****************************************************************************************************\n");
      endfunction:paste

 endclass:grandparent

// parent class 
class parent extends grandparent(3);
       const int a =300;
        function void number();
            super.a = 10;
          // this.a = this.a+a;
           //super.paste(a);
           $display("\n*********************************  inside the parent class ******************************************\n");
           $display("value of a is : %0d ",this.a);
           $display("\n****************************************************************************************************\n");
        endfunction:number
endclass:parent


// declaring the handle for the class

    parent pa;

// creating module for object

module test;

      initial begin

         pa = new;
         pa.number;
        // pa.a = 300;
        // pa.number;
         pa.paste;

      end

endmodule:test


/*

const int a;
        function void number(int a);
           this.a = this.a+a;
           super.paste(a);


  'const' variable is either driven or connected to a non-const variable.
  Variable 'c' declared as 'const' cannot be used in this context
  Source info: this.c = b;


Error-[IUCV] Invalid use of 'const'
../tb/ploy.sv, 32
  'const' variable is either driven or connected to a non-const variable.
  Variable 'a' declared as 'const' cannot be used in this context
  Source info: this.a = (this.a + a);
*/


/* 

output:

*********************************  inside the grandparent class *************************************

value of a is : 3 
value of a is : 20 

****************************************************************************************************


*********************************  inside the parent class ******************************************

value of a is : 300 

****************************************************************************************************


*********************************  inside the grandparent class *************************************

value of a is : 10 
value of c is : 20 

****************************************************************************************************

           V C S   S i m u l a t i o n   R e p o r t 
*/

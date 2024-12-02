


// creating the virtual class and prototype blueprint

virtual class packet;

           int ar[5];
           pure virtual function void amount();

endclass:packet 
  

// creating the child class

class parent1 extends packet;

      int arr_1[5]={10,20,30,40,50};
      virtual function void amount();
        super.ar[0] = arr_1[0]+1;  
        super.ar[1] = arr_1[1]+1;  
        super.ar[2] = arr_1[2]+1;  
        super.ar[3] = arr_1[3]+1;  
        super.ar[4] = arr_1[4]+1; 
        $display("\n*******************************************************************************************\n");
        $display(" packet => %0p " ,super.ar); 
        $display("\n*******************************************************************************************\n");
        $display(" parent => %0p " ,arr_1);
        $display("\n*******************************************************************************************\n");
     endfunction:amount
endclass:parent1

// creating the another child classs 

class parent2 extends packet;

   int arr_2[5]={100,200,300,400,500};
    virtual function void amount (); 
        super.ar[0] = arr_2[0];
        super.ar[1] = arr_2[1];
        $display("\n*******************************************************************************************\n");
        $display(" packet => %0p " ,super.ar); 
        $display("\n*******************************************************************************************\n");
        $display(" parent => %0p " ,arr_2);
        $display("\n*******************************************************************************************\n");

    endfunction:amount

/*
virtual function void amount (); 
       // super.ar[0] = 100;
       // super.ar[1] = 200;
        $display("\n*******************************************************************************************\n");
        //$display(" packet => %0p " ,super.ar); 
        $display("\n*******************************************************************************************\n");
        //$display(" parent => %0p " ,arr_2);
        $display("\n*******************************************************************************************\n");

    endfunction:amount
if your are using pure virtual method in virtual you have use that method here compulsary if your not is shown an error

*/    
endclass:parent2

// creating the objects for the class 

parent1 pa;
parent2 pb;

/*

packet  pac;

error:

test, "$unit::pac = new();"
  Instantiation of the object 'pac' can not be done because its type 'packet' 
  is an abstract base class.
  Perhaps there is a derived class that should be used.

*/

// creating the module

module test;
            
           initial begin
                   pa = new;
                   pb = new;
                  // pac = new; cant passible bcaz its virtual class
                   
                   pa.amount();
                   pb.amount();
                   $display("\n*******************************************************************************************\n");
                   $display(" pa = %0p ",pa);
                   $display("\n*******************************************************************************************\n");
                   $display(" pb = %0p ",pb);
                   $display("\n*******************************************************************************************\n");
                   $cast(pa , pb);


                   end
endmodule:test

 
/*

output:

*******************************************************************************************

 packet => '{11, 21, 31, 41, 51}  

*******************************************************************************************

 parent => '{10, 20, 30, 40, 50}  

*******************************************************************************************


*******************************************************************************************

 packet => '{100, 200, 0, 0, 0}  

*******************************************************************************************

 parent => '{100, 200, 300, 400, 500}  

*******************************************************************************************


*******************************************************************************************

 pa = '{ar:'{11, 21, 31, 41, 51} , arr_1:'{10, 20, 30, 40, 50} } 

*******************************************************************************************

 pb = '{ar:'{100, 200, 0, 0, 0} , arr_2:'{100, 200, 300, 400, 500} } 

*******************************************************************************************


Error-[DCF] Dynamic cast failed
../tb/virtual_class.sv, 99
  Casting of source class type 'parent2' to destination class type 'parent1' 
  failed due to type mismatch.
  Please ensure matching types for dynamic cast

           V C S   S i m u l a t i o n   R e p o r t 
*/

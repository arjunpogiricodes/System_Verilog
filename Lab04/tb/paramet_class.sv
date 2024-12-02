

// $typename $bits
// creating class for the checking the hoe parameterized

// normal class

class p;
   int a =10;
    task dis(int a);
        this.a = a;
        $display(" value of a = %0d ",this.a);
    endtask:dis
endclass:p
 

// grandparent class 
class  grandparent #(type t = int);
 
  t a;
  virtual task summary(t a);
      this.a = a + this.a;
      $display("\n******************************************************************************************\n");
      $display(" grnad parent value of a       =  ",this.a);
      $display("\n******************************************************************************************\n");
  endtask:summary

endclass:grandparent

// paarent class

class parent #(type p= byte) extends grandparent;

        p a;
        virtual task summary(t a);
           this.a = a + this.a;
           super.summary((this.a));
           $display("\n******************************************************************************************\n");
           $display("parent class value of parent a           =  ",this.a);
           $display("\n******************************************************************************************\n");
           $display("\n******************************************************************************************\n");
           $display("parent class value of granparent a       =  ",super.a);
           $display("\n******************************************************************************************\n");
        endtask:summary
endclass:parent 

// child class

class child #(type x = bit,int size = 4) extends parent;

       x[size-1:0] a;

        virtual task summary(t a);
              this.a = a + this.a;
              super.summary((this.a));
              $display("\n******************************************************************************************\n");
              $display("child class value of child a        =  ",this.a);
              $display("\n******************************************************************************************\n");
              $display("\n******************************************************************************************\n");
              $display("child class value of parent a       =  ",super.a);
              $display("\n******************************************************************************************\n");
         endtask:summary
endclass:child

//extends froim p

class ext#(type c = grandparent#(byte) ) extends p;
        
       c a;
       task dis(c a);
        this.a = a;
        $display(" the value of a = %d",this.a);
      endtask:dis
endclass:ext  
       



// handle  declaration

grandparent #(real)ga;
parent      #(byte)pa;
child       #(reg,6)ca;
ext ea;
p   na;

// creating module for the object creation

module test;

     initial begin
              ga = new;
              pa = new;
              ca = new;
              ea = new;
              na = new;


              ga.summary(2);
              pa.summary(3);
              ca.summary(7);
              ea.dis(5);
              na.dis(8);

              $display("\n******************************************************************************************\n");
              $display(" grandparent class   =\n %0p " ,ga);
              $display(" ga a type = %s",$typename(ga.a),"\tand size = %0d ",$bits(ga));
              $display("\n*******************************************************************************************\n"); 


              $display("\n******************************************************************************************\n");
              $display(" parent class   =\n %0p " ,pa);
              $display(" pa a type = %s",$typename(pa.a) ,"\tand size =  %0d ",$bits(pa.a));
              $display("\n*******************************************************************************************\n");  


              $display("\n******************************************************************************************\n");
              $display(" child class   =\n %0p " ,ca);
              $display(" ca a type = %s",$typename(ca.a) ,"\tand size = %0d",$bits(ca.a));
              $display("\n*******************************************************************************************\n");  


              $display("\n******************************************************************************************\n");
              $display(" child class   =\n %0p " ,ea);
              $display(" ca a type = %s",$typename(ea.a) ,"\tand size = %0d",$bits(ea.a));
              $display("\n*******************************************************************************************\n");  

              $display("\n******************************************************************************************\n");
              $display(" child class   =\n %0p " ,na);
              $display(" ca a type = %s",$typename(na.a) ,"\tand size = %0d",$bits(na.a));
              $display("\n*******************************************************************************************\n");  
 
            end
endmodule:test  

  


              
         


          
 
          
     

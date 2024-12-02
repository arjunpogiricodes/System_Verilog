


module test;

  int d,result;
  int a=2,b=3;

   function automatic mult (input int a,input int b,output int c);
        c = (a*b)+2;
     $display(" inside function");
     $display("@time t = %0d a = %0d and b = %0d and c = %0d ",$time,a,b,c);
    endfunction:mult

    initial
          begin
               #1;
               mult(2,3,d);
               




module memories();

// declaring the  typedef enum data type

  typedef enum{violate,indigo,blue,green,yellow,orange,red,white} color;
    color rainbow;
    initial begin
   $display("============================================================================================================");
    rainbow = violate;
    forever
          begin
                $display(" %s : %d ", rainbow.name,rainbow);
                if(rainbow == rainbow.last())
                  break;
                 else
                  rainbow= rainbow.next();
          end
     $display("============================================================================================================");

    end


 // here enum is the  definition and color is the data type that was assigned to rainbow varible in typedef we can access the definition of enum dirctly
// through variable name  
    struct{enum{vio,ind,blu,gre,yel,ora,red1,whi}maven;} seven;
    initial begin
    #20;
     $display("============================================================================================================");

    seven.maven = vio;
    forever
          begin
                $display(" %s : %d ", seven.maven,seven.maven);
                if(seven.maven == seven.maven.last())
                  break;
                 else
                  seven.maven = seven.maven.next();
          end
    $display("============================================================================================================");

    end
// here we are taking struct data and inside stuct we taking enum so we can those enum named constants by instance_name.enum_name then only you can access 
// here enum  is definition and maven is data type and seven is variable name



// type converstion
// casting 
// static we dirclty f=gives the values for dynamic we use $cast keyward
// tunrcated implicit 
// arounded explicit

     int ic;
     real rc;
     initial begin
     #40;
     $display("============================================================================================================");
     rc = 13.6; // explicit
     ic =int'(20.0-0.2);     
     $display(" rc = %d \n ic = %d ",rc,ic);
        
     // implicit you doing opearionn bw 2 real number then resulted will tunrcated 

     $display("============================================================================================================");
    end
       


initial
#1000 $finish;

endmodule 
  


/*
OUTPUT : 

============================================================================================================
#  violate :           0 
#  indigo :           1 
#  blue :           2 
#  green :           3 
#  yellow :           4 
#  orange :           5 
#  red :           6 
#  white :           7 
# ============================================================================================================
# ============================================================================================================
#  vio :           0 
#  ind :           1 
#  blu :           2 
#  gre :           3 
#  yel :           4 
#  ora :           5 
#  red1 :           6 
#  whi :           7 
# ============================================================================================================
# ============================================================================================================
#  rc =         14 
#  ic =          20 
# ============================================================================================================

*/



module test_array();

	// Declare a dynamic array data_da of int data type
         int data_da[];

		
	// Declare queues data_q & addr_q of int data type
         int data_q[$],addr_q[$];  
            bit [7:0] q[$];
            bit [10:0]a;
           int b;
	// Declare associative array data_mem of int data type and indexed with bit[7:0]
         int data_mem[bit[7:0]];
	
	// Declare int variable result,and and an 8 bit variable idx
        int result;
        bit [7:0]idx;
	

	initial
		begin
	
			// Allocate 10 memory locations for dynamic array & initialize
			// all the locations with some random values less than 20 & display the array
	                data_da = new[10];
                       
                       $display("=====================  allocate 10 memory locations  ================================= ");      
                         data_da = '{10,12,2,3,5,13,12,14,19,11};

                          $display("data_da = %p ",data_da);
                              				
			
			// Call the array reduction method sum which returns the sum
			// of all elements of array and collect the return value to the variable result
                         $display("===========array reduction methods sum,production or,and,xor  ================================= ");       

			 result = data_da.sum();
                           
                               
                         
			
			// Display the sum of elements, result
			 $display("the sum of %p is = %d ",data_da,result);

	
			// Similarly explore other array reduction methods 
			// product,or,and & xor
	                 result = data_da.product();
                             //   with(int'(item >10)*item);  
                         $display("the product even number in the array of %p is = %d ",data_da,result);
                         result = data_da.or();
	                 $display("the bitwise or operation in the array of %p is = %d ",data_da,result);
                         result = data_da.and();
	                 $display("the bitwise and operation in the array of %p is = %d ",data_da,result);
                         result = data_da.xor();
	                 $display("the bitwise xor operation in the array of %p is = %d ",data_da,result);


			// Call the array reduction method sum with "with" clause which returns 
			// total number of elements satisfying the condition within the "with" clause 
                          $display("================ array reduction method sum with with clause  ======================= ");   
                         result =data_da.sum with(int'(item%2 == 0));  
                          $display(" with int no. of even numbers in data_da = %0d", result);

                         result =data_da.sum with((item%2 == 0));  
                         $display(" without int no. of even numbers in data_da = %0d", result);

                         result =data_da.sum with(int'(item%2 == 1));  
                         $display(" with int no. of odd numbers in data_da = %0d", result);

                         result =data_da.sum with((item%2 == 1));  
                         $display(" without  int no. of odd numbers in data_da = %0d", result);
                    


			result = data_da.sum with (int'(item>7));
			
			// Display the value of the result
			
			$display(" with int no. of items greater than 7 = %0d", result);
                       
			result = data_da.sum with (int'(item>7)*item);
			
			// Display the value of the result
			
			$display(" wit int sum of  items greater than 7 = %0d", result);
			
			// Similarly explore other array reduction methods with "with"clause 
		
			   result =data_da.or with(int'(item%2 == 0));  
                          $display(" with int or operation for even number in data_da = %0d", result);

                         result =data_da.and with(int'(item%2 == 1));  
                         $display(" with and opearaion for  odd numbers in data_da = %0d", result);

                         result =data_da.xor with(int'(item%2 == 1));  
                         $display(" with int xor opearation for odd numbers in data_da = %0d", result);
                    


	
			// Sorting Methods
	              $display("================ sorting methods like reverse, sort, rsort,shuffle ======================= ");   
  
			// call all the sorting methods like reverse, sort, rsort & 
			// shuffle & display the array after execution of each method to 
			// understand the behaviour of the array methods
	                $display(" array is : %p " ,data_da);
                        data_da.reverse();
                        $display(" array reverse is : %p " ,data_da);
                        data_da.sort();
                        $display(" array sorting is : %p " ,data_da);
                        data_da.rsort();
                        $display(" array rsorting is : %p " ,data_da);	
                        data_da.shuffle();
                        $display(" array is : %p " ,data_da);

	
			// Call Array locator methods like min, max, unique,find_* with,
			// find_*_index with using dynamic array & display 
			// the contents of data_q after execution of each method to 
			// understand the behaviour of the array methods
                       $display("======= Array locator methods like min, max, unique,find_* with, find_*_index ========= "); 
			   $display(" array is : %p " ,data_da);
                           data_q=data_da.min();
                           $display(" min of is array in data_Da is : %p ",data_q);
                           data_q = data_da.max();
                           $display(" max of the given array in data_ad is  : %p ",data_q);  
                           data_q = data_da.unique();
                           $display(" unique number in given array in data_ad are  : %p ",data_q);  
                           data_q = data_da.find_first with(item > 13);  
                           $display(" first number greter than 13 in given array in data_ad are  : %p ",data_q);  
                           data_q = data_da.find_first_index with(item >13);
                           $display(" first number index greter than 13 in given array in data_ad are  : %p ",data_q); 

                           data_q = data_da.find_last with(item > 12);  
                           $display(" last number greater than  12 in given array in data_ad are  : %p ",data_q);  
                           data_q = data_da.find_last_index with(item == 12);
                           $display(" last number index equal to 12 in given array in data_ad are  : %p ",data_q); 
			
			//Generate some 10 random address less than 100 within a repeat loop 
			//push the address in to the addr_q
                        $display("======= 10 random address less than 100 within a repeat ========= "); 

			repeat(10)
                         begin
                         int i; 
                         addr_q.insert(i,i+50);
                         i++; 
                         end 
			
			//Display the addr_q
			$display(" addr_q is : %p ",addr_q);
			//$display(" length of  addr_q is :%d ",$size(addr_q));
			idx = $size(addr_q);
			
			// With in for loop update the associate array with random data less than 200
			// based on the address stored in addr_q
			// Hint: To get the address use pop method 
                        $display("=======   associate array with random data less than 200 ========= "); 

                        $display("=======   based on the address stored in addr_q ================ "); 

			 for(bit [7:0]i=8'd0;i<idx;i=i+1'b1)
                         begin
                          data_mem[addr_q.pop_front()]=i+100;
			 end  
			// Display the contents of associate array using foreach loop

                        $display("=======    associate array using foreach================ "); 

			 foreach (data_mem[i])
                          $display(" data mem[%d] = %d ",i,data_mem[i]);  
		         	
                          $display("index = %d ",data_mem.first(idx));

			// Display the first index of the array by using associative array method first

                         $display("=======    associative array method =================== "); 

                          if(data_mem.first(idx))
                          begin
                          $display("first data index = %d ",idx);
		          $display("first data =  %p ",data_mem[idx]);	
                          end
			// Display the first element of the array
	                  
			// Display the last index of the array by using associative array method last
			
		          if(data_mem.last(idx))
                          begin
                          $display("last data index = %d ",idx);
		          $display("last data =  %p ",data_mem[idx]);	
                          end


			// Display the last element of the array
                        //data_q = data_da.find_last_index with(item == 12);
                       $display("=======    the last element of the array using locator =================== "); 

                                                
                        data_q = data_mem.find_last  with(item);
                      // $display("data = %p ",q);
                         b=data_q.pop_front();
                        $display("last value= %d",b);



                         q = data_mem.find_last_index  with(item);
                     //  $display("data = %p ",q);

                          a=q.pop_front();
                        $display("last index value = %d",a);

                        data_q = data_mem.find_first  with(item);
                     //  $display("data = %p ",q);
                         b=data_q.pop_front();
                        $display("first value = %d",b);



                         q = data_mem.find_first_index  with(item);
                      // $display("data = %p ",q);

                          a=q.pop_front();
                        $display("first index value =-%d",a);
                       $display("========================================================================================= "); 


				
		end
	
endmodule
	
/*
=====================  allocate 10 memory locations  ================================= 
data_da = '{10, 12, 2, 3, 5, 13, 12, 14, 19, 11}  
===========array reduction methods sum,production or,and,xor  ================================= 
the sum of '{10, 12, 2, 3, 5, 13, 12, 14, 19, 11}  is =         101 
the product even number in the array of '{10, 12, 2, 3, 5, 13, 12, 14, 19, 11}  is =  1643241600 
the bitwise or operation in the array of '{10, 12, 2, 3, 5, 13, 12, 14, 19, 11}  is =          31 
the bitwise and operation in the array of '{10, 12, 2, 3, 5, 13, 12, 14, 19, 11}  is =           0 
the bitwise xor operation in the array of '{10, 12, 2, 3, 5, 13, 12, 14, 19, 11}  is =          21 
================ array reduction method sum with with clause  ======================= 
 with int no. of even numbers in data_da = 5
 without int no. of even numbers in data_da = 1
 with int no. of odd numbers in data_da = 5
 without  int no. of odd numbers in data_da = 1
 with int no. of items greater than 7 = 7
 wit int sum of  items greater than 7 = 91
 with int or operation for even number in data_da = 1
 with and opearaion for  odd numbers in data_da = 0
 with int xor opearation for odd numbers in data_da = 1
================ sorting methods like reverse, sort, rsort,shuffle ======================= 
 array is : '{10, 12, 2, 3, 5, 13, 12, 14, 19, 11}  
 array reverse is : '{11, 19, 14, 12, 13, 5, 3, 2, 12, 10}  
 array sorting is : '{2, 3, 5, 10, 11, 12, 12, 13, 14, 19}  
 array rsorting is : '{19, 14, 13, 12, 12, 11, 10, 5, 3, 2}  
 array is : '{3, 10, 5, 2, 11, 19, 14, 12, 13, 12}  
======= Array locator methods like min, max, unique,find_* with, find_*_index ========= 
 array is : '{3, 10, 5, 2, 11, 19, 14, 12, 13, 12}  
 min of is array in data_Da is : '{2}  
 max of the given array in data_ad is  : '{19}  
 unique number in given array in data_ad are  : '{3, 10, 5, 2, 11, 19, 14, 12, 13}  
 first number greter than 13 in given array in data_ad are  : '{19}  
 first number index greter than 13 in given array in data_ad are  : '{5}  
 last number greater than  12 in given array in data_ad are  : '{13}  
 last number index equal to 12 in given array in data_ad are  : '{9}  
======= 10 random address less than 100 within a repeat ========= 
 addr_q is : '{50, 51, 52, 53, 54, 55, 56, 57, 58, 59}  
=======   associate array with random data less than 200 ========= 
=======   based on the address stored in addr_q ================ 
=======    associate array using foreach================ 
 data mem[ 50] =         100 
 data mem[ 51] =         101 
 data mem[ 52] =         102 
 data mem[ 53] =         103 
 data mem[ 54] =         104 
 data mem[ 55] =         105 
 data mem[ 56] =         106 
 data mem[ 57] =         107 
 data mem[ 58] =         108 
 data mem[ 59] =         109 
index =           1 
=======    associative array method =================== 
first data index =  50 
first data =          100 
last data index =  59 
last data =          109 
=======    the last element of the array using locator =================== 
last value=         109
last index value =   59
first value =         100
first index value =-  50
========================================================================================= 
*/	
	

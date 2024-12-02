function int prod(int a,b,output int o);
	prod = a*b;
	o = 1;
	$display("jJ that is inside the function");
	//return 22;
		
endfunction : prod





module tb();
//call by reference
function automatic int prod1(ref int a,b);
	//$display(a,b);
	prod1 = a*b;
	//$display(prod1);
	$display("From inside call by refernce function");
endfunction:prod1

int a=10,b=7;
int c ;
int out;
initial
begin

//call by order
out =  prod(10,7,c);
$display("Output using call by order : %0d",out);
$display(c);
//call by name
out = prod(.a(10),.b(7),.o(c));
$display("Output using call be name : %0d",out);

//call by value
out = prod(a,b,c);
$display("Output using call by value : %0d",out);

//call by reference
out = prod1(a,b);
$display("Output using call by ref : %0d",out);

//making the function as void
void'(prod(1,3,c));


//call by reference
out = prod1(a,b);
$display("Output using call by ref : %0d",out);
$display(a,b);
end
endmodule:tb

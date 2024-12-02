module tb_usertype();
typedef struct{bit[7:0]r,b,g;logic l;int color;} pixel;
//defining the variables for the new data type
pixel p1,p2;
initial
begin
p1 = '{'d32,'d22,'d12,'b1,'d1222};
p2.r = 'd00;
p2.b = 'd11;
p2.g = 'd22;
printt(p1);
end
task printt(pixel p);
$display(p);
endtask
endmodule

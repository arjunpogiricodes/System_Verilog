module tb_shop();
typedef struct {int unsigned Sno,Dozen;string Name;real Kg,Rs;bit [2:0]Pieces;} data;
data c1,c2,c3,c4;
initial
begin
c1 = '{1,2,"Apple",12,2000,'d14};
$display(c1);
end
endmodule

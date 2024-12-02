module tb_struct();
struct {bit[7:0]r,g,b;int color;}pixel;
struct {bit[7:0]t;enum{k,l}e;logic l1;}s;
initial
begin
	s = '{0,s.e.first,1};
	pixel.r = 8'd125;
	pixel.g = 8'd14;
	pixel.b = 8'd0;
	pixel.color = 32'd111;
$display(pixel);
$display("%p",s);
end



endmodule

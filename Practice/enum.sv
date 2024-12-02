module tb_enum();
enum {it,re,wr,brd,bwr}fsm;
initial
begin
fsm = fsm.last();
fsm = fsm.next();
//if(fsm.name == "it")
$display(fsm);
end

endmodule

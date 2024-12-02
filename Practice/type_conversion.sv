module tb_type();
typedef enum{in,re,wr,brd,bwr} fsm;
fsm state;
int c;
initial
begin
	state = re;
	$display(state.name,state);
	state = 2;
	$display(state.name);
	c = state;
	$display(c);
	$cast(state,4.4);
end
endmodule

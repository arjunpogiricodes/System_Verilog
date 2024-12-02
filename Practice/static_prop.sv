class packet;
	static int p = 0;
	int id;
	function new();
		id = p++;
	endfunction
endclass

class gen1;
	function  packet p();
		p  = new();
	endfunction
endclass

class gen;
	task  start(output packet h);
		 h = new();

	endtask
endclass
packet h1,h2;
packet h[2];
module top();
initial
begin
	gen o[2];
	gen1 o1[10];
	foreach(o1[i])begin
		o1[i] = new;
		$display(o1[i].p);
		end
	$display("Accessing static property  p : %0d",h1.p);
	
	foreach(o[i])begin
		o[i] = new;
	//	$display(o1[i].p);
		end

	o[0].start(h[0]);
	$display(h[0]);

	o[1].start(h[1]);
	$display(h[1]);
	
end
endmodule

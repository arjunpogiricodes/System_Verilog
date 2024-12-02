virtual class packet;
	bit [31:0] arr [0:3];
	pure virtual function void divider_pkt_one();
endclass

class IPV4 extends packet;
	bit [7:0] arr_4 [0:4];
	virtual function void divider_pkt_one();
		arr_4[0] = 1;
		
	endfunction
endclass

class IPV6 extends packet;
	bit [15:0] arr_2 [0:1];
	virtual function void divider_pkt_one();
		//arr_2[0] = 2;
	endfunction
endclass
//packet p1;
IPV4 i4;
IPV6 i6;
module top();
	initial
	begin
		//p1 = new();
		i4 = new();
		i6 = new();
		$display(i4);
		$display(i6);
	end
endmodule

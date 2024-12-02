/*Synopsis Commands:

1. vcs -debug_access+all -sverilog -kdb filename.sv
2.  ./simv -cm_dir ./cov
3. urg -dir cov -format text
4.gvim urgReport/grp*.txt

Questa command:

1. qverilog filename.sv
2. qverilog filename.sv -R -c -do "log -r/*;run -all;coverage report -details;exit"

commands*/

/*
module test;
	bit [2:0]a,b,c;
	
	covergroup cg;
		c1 : coverpoint a{bins b1[] = {[0:3]}; bins b2 = {[4:5]};}
		c2 : coverpoint b{bins b3 = {[0:3]};bins b4 = default;}
		//c3 : coverpoint c{illegal_bins b7 = {2};}//binsof(c2) intersect{[1:5]};}
		//c4 : cross c1,c2;
		//c5 : cross c1,c2 {bins b4 = binsof(c2) intersect{0};illegal_bins b5 = binsof(c2) intersect{[0:7]};} 
		c6 : cross a,c;
	endgroup
			
	initial begin
		cg cg1 = new;
		//cg = new();
		for(int i = 0; i<6;i++)
			begin
				a =  i;
				b = i;
				c = i;
				cg1.sample();
				$display("a = %g , b = %g",a,b);
				$display(cg1.get_coverage());
			end
		
	end
endmodule
*/
class test_sample;
	bit[7:0] d[];
	covergroup cg ;//with function sample(int i);
		c1 : coverpoint d[i] {bins b1 = {[0:50]}; bins b2 = {[51:100]};bins b3 = {[101:255]};}
	endgroup

	

	initial begin
		d = new[10];
		cg cg1 = new;
		
	foreach(d[i]) begin
		d[i] = $random;
		cg1.sample(i);
		$display("d[%0d]  = %0d",i,d[i]);
	end
	end
endmodule
/*
class coverage_model;

rand int unsigned i,j;

covergroup cg;

l: coverpoint i {bins i[]={[0:1]};}// 110:11 121

m: coverpoint j{bins j[]= { [0:1] };}//12)

nn: cross i,j;

kk: cross i,j {

bins i_zero= binsof (i) intersect {0};
}
endgroup: cg

function new();

cg=new;

endfunction

endclass

coverage_model cm;

module test();

initial

begin

cm=new();

repeat (10)

begin

cm.randomize();

cm.cg.sample();

end

//Sdisplay(cm.og.get_coverage):

//VWcm.cq.sample();
end
endmodule*/
/*
class duv_cm;
	logic clk;
	logic [7:0]address;
	logic [2:0]opcode;
	logic valid;
	
	covergroup cg;
		OP :coverpoint opcode;
		ADD : coverpoint address;
		OPXADD : cross OP,ADD;
	endgroup

	function new();
		cg = new;
	endfunction
endclass

duv_cm d;

module test;
	initial
		begin
		 d = new;
		 for(int i = 0;i<19;i++) begin
			{d.address,d.opcode} = i;
			d.cg.sample();
		end
		$display(d.cg.get_coverage);
	end
endmodule*/	

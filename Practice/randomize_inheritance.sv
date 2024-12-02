class parent;
	rand bit[3:0]a;
	constraint a_con{ a<3;}
endclass

//different constraint names
class child1 extends parent;
	constraint c1_con{ a>3;};
endclass

//same constraint names
class child2 extends parent;
	constraint a_con{a>3;};
endclass

//same constraint names different property type
class child3 extends parent;
       	rand int a;
	constraint a_con{a>10;};
endclass

//different constraint names and different property type
class child4 extends parent;
	rand int a;
	constraint c1_con{a>100000;};//this will apply only for this child class
endclass

class child5 extends parent;
	rand bit[3:0]a;
	constraint b_con{a>14;};
	//constraint b_con{b<10;};
endclass

child5 c5 = new;
child1 c1 = new;
child2 c2 = new;
child3 c3 = new;
child4 c4 = new;
module test();
	initial begin
	repeat(10)
	begin		
	c1.randomize();
	$display("Different constraint ",c1);	
	end
	$display("========================================");
	repeat(10)
	begin
	c2.randomize();
	$display("Same constraint name",c2);
	end
	$display("========================================");

	repeat(16)
	begin
	c3.randomize();
	$display("Same constraint name different property type %p",c3);
	end
	$display("========================================");

	repeat(10)
	begin
	c4.randomize();
	$display("Different constraint name different propert type",c4);
	end

	repeat(10)
	begin
	c5.randomize();
	$display("Exp",c5);
	end

	end
endmodule

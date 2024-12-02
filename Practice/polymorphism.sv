class parent;
	int x = 11;
	virtual function void display();
		$display("As parent form, va;ue of x :%0d",x);
	endfunction
endclass : parent 

class child1 extends parent;
	virtual function void display();
		$display("As child1 form, value of x : %0d",x);
	endfunction
endclass : child1

class child2 extends parent;
	int y;
	virtual function void display();
		$display("As child2 form");
	endfunction

endclass : child2

parent p1,p2;
child1 c11,c12;
child2 c21,c22;

module top();
	initial
	begin
		p1 = new();
		p1.display();
		c11 = new();
		c11.x = 22;
		c11.display();
		p1 = c11;
		p1.display();
		p1.x =33;
		p1.display();
		c11.display();
		c22 = new;
		p1 = c22;
		p1.display();
		/*c12 = c11;
		c12.display();	
		c12.x = 44;
		p1.display();
		c12.display();
		c11.display();*/

		$display($typename(c11));
		$display($typename(c12));	
		$display($typename(p1));
		$cast(c12 , p1);	
		c12.display();
		p1.display();
		
	end
endmodule : top

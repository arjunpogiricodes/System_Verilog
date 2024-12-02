
////-------------------------- P.V.M.Vamsi RN110 ------------------/////
/////////////////////////////--SUDUKO--////////////////////////////////
class suduko;
	rand bit[3:0]a[9][9];
	bit[3:0] r1[$],c1[$],s[$];
	
	constraint limt{foreach(a[i,j]) a[i][j] inside{[1:9]};}
	constraint r{foreach(a[i,j])unique{a[i]};}
	//constraint c{foreach(a[j]) foreach(a[i])  unique{a[i][j]};}
        constraint c{foreach(a[j]) unique{a[0][j],a[1][j],a[2][j],a[3][j],a[4][j],a[5][j],a[6][j],a[7][j],a[8][j]};}

       constraint grid { foreach(a[i,j])
		if(i%3 == 0 && j%3==0)                
			    unique { a[i][j],a[i][j+1],a[i][j+2],
				     a[i+1][j],a[i+1][j+1],a[i+1][j+2],
				     a[i+2][j],a[i+2][j+1],a[i+2][j+2]};}
	//constraint c{foreach(a[j]) unique{a[i][j] foreach(a[i])};}
endclass

suduko s1;

module top();
	initial begin
	s1 = new();
	assert(s1.randomize);
	foreach(s1.a[i,j])begin
		$write("%0d ",s1.a[i][j]);
		if(j==8)
		$display("");
	end
/*	foreach(s1.a[j])
		begin
			//$display(s1.a[j][0]);
		$display(j);	
	end
	//	$display(s1.a);*/
	end
endmodule

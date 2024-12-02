#Makefile
clean : 
	rm -rf simv* csrc* *.tmp *.vpd *.vdb *.key *.log *hdrs.h urgReport* *.fsdb verdi*
run1 :
	vcs -sverilog -kdb example.sv
	./simv -cm_dir ./cov
change : 
	urg -dir cov -format text
view:
	vi urgReport/grp*.txt
run : clean run1 

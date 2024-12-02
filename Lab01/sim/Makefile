# Makefile for Arrays - SV Lab01 

# SIMULATOR = Questa for Mentor's Questasim
# SIMULATOR = VCS for Synopsys's VCS

SIMULATOR = VCS

help:
	@echo =================================================================================
	@echo " USAGE   	--  make target                             			"
	@echo " clean   	=>  clean the earlier log and intermediate files.       	"
	@echo " run_sim 	=>  compile & run the simulation in batch mode.        		"
	@echo " run_test	=>  clean, compile & run the simulation in batch mode.		" 
	@echo " run_vcs         =>  run vcs -sverilog filename compile                          "
	@echo " simulate        =>  graph simulation in verdi                                   "
	@echo " simu            =>  vcs simulation in command line                       	"
	@echo " run_qsta        =>  run mentors questa qverilog ../arjun/memories.sv      	"

	@echo =================================================================================

clean : clean_$(SIMULATOR)
run_sim : run_sim_$(SIMULATOR)
run_test : run_test_$(SIMULATOR)

# ---- Start of Definitions for Mentor's Questa Specific Targets -----#

run_test_Questa: clean_Questa run_sim_Questa

run_sim_Questa: 
	qverilog ../tb/test_array.sv

clean_Questa:
	rm -rf  *.log dff 
	clear
run_vcs:
	vcs -sverilog ../arjun/memories.sv 
	./simv
simu:
	./simv      
simulate:
	./simv -gui 
run_qsta:
	qverilog ../arjun/memories.sv	
	
# ---- End of Definitions for Mentor's Questa Specific Targets -----#	

# ---- Start of Definitions for Synopsys VCS Specific Targets -----#

run_test_VCS: clean_VCS run_sim_VCS

run_sim_VCS: 
	vcs -l vcs.log -sverilog ../tb/test_array.sv
	./simv -a vcs.log

clean_VCS:
	rm -rf simv* csrc* *.key *.log ucli* vcs* *work
	clear 
	
# ---- End of Definitions for Synopsys VCS Specific Targets -----#




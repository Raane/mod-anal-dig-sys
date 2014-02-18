SetActiveLib -work
comp -include "$dsn\src\liaison.vhd" 
comp -include "$dsn\src\TestBench\TB_liaison.vhd" 
asim TESTBENCH_FOR_liaison 
wave 
wave -noreg clk
wave -noreg reset
wave -noreg a
wave -noreg b
wave -noreg c
wave -noreg d
wave -noreg status
wave -noreg y
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\TB_liaison_tim_cfg.vhd" 
# asim TIMING_FOR_liaison 

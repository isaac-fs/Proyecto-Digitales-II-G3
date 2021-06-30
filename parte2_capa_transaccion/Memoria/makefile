all: yosys sed verilog

verilog:
	iverilog -o testbench_memoria testbench_memoria.v
	vvp testbench_memoria
	gtkwave memoria.vcd memoria.gtkw &

yosys:
	yosys yosys.ys

sed:
	sed -i 's/module\smemoria(/module memoria_synth(/' memoria_synth.v
	

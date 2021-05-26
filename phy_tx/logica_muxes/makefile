all: yosys sed verilog

verilog:
	iverilog -o Banco_pruebas Banco_pruebas.v
	vvp Banco_pruebas
	gtkwave senales_MUX.vcd MUXES.gtkw &
yosys:
	yosys script_y.ys

sed:
	sed -i 's/module\sMUX1_L1(/module MUX1_L1_synth(/' MUXES_synth.v
	sed -i 's/module\sMUX_L2(/module MUX_L2_synth(/' MUXES_synth.v
	sed -i 's/module\sMUXES(/module MUXES_synth(/' MUXES_synth.v
	

all: yosys sed verilog

verilog:
	iverilog -o Banco_Pruebas Banco_Pruebas.v
	vvp Banco_Pruebas
	gtkwave senales_DEMUX.vcd DEMUXES.gtkw &
yosys:
	yosys -s script_y.ys 

sed:
	sed -i 's/module\sDEMUX_L1(/module DEMUX1_L1_synth(/' DEMUXES_synth.v
	sed -i 's/module\sDEMUX_L2(/module DEMUX_L2_synth(/' DEMUXES_synth.v
	sed -i 's/module\sDEMUXES(/module DEMUXES_synth(/' DEMUXES_synth.v

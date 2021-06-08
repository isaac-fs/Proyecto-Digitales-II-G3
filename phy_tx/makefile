all: yosys sed verilog

verilog:
	iverilog -o testbench testbench.v
	vvp testbench
	gtkwave phy_tx.vcd phy_tx.gtkw &
yosys:
	yosys script_y.ys

sed:
	sed -i 's/module\sphy_tx(/module phy_tx_synth(/' phy_tx_synth.v
	sed -i 's/module\sMUX1_L1(/module MUX1_L1_synth(/' phy_tx_synth.v
	sed -i 's/module\sMUX_L2(/module MUX_L2_synth(/' phy_tx_synth.v
	sed -i 's/module\sMUXES(/module MUXES_synth(/' phy_tx_synth.v
	sed -i 's/module\sparalelo_serial(/module paralelo_serial_synth(/' phy_tx_synth.v
	sed -i 's/module\srecirculador(/module recirculador_synth(/' phy_tx_synth.v
	sed -i 's/module\sSerial_paralelo_tx(/module serial_paralelo_synth(/' phy_tx_synth.v

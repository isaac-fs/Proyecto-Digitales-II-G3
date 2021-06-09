all: yosys sed verilog

synth: yosys sed

verilog:
	iverilog -o out BancoPrueba.v
	vvp BancoPrueba
	gtkwave phy.vcd phy.gtkw &
yosys:
	yosys script_y.ys

sed:
	sed -i 's/module\sphy(/module phy_synth(/' phy_synth.v
	sed -i 's/module\sMUX1_L1(/module MUX1_L1_synth(/' phy_synth.v
	sed -i 's/module\sMUX_L2(/module MUX_L2_synth(/' phy_synth.v
	sed -i 's/module\sMUXES(/module MUXES_synth(/' phy_synth.v
	sed -i 's/module\sparalelo_serial_tx(/module paralelo_serial_tx_synth(/' phy_synth.v
	sed -i 's/module\srecirculador(/module recirculador_synth(/' phy_synth.v
	sed -i 's/module\sSerial_paralelo_tx(/module serial_paralelo_tx_synth(/' phy_synth.v
	sed -i 's/module\sDEMUX_L1(/module DEMUx_L1_synth(/' phy_synth.v
	sed -i 's/module\sDEMUX_L2(/module DEMUX_L2_synth(/' phy_synth.v
	sed -i 's/module\sparalelo_serial_rx(/module paralelo_serial_rx_synth(/' phy_synth.v
	sed -i 's/module\sserial_paralelo_rx(/module serial_paralelo_rx_synth(/' phy_synth.v
	sed -i 's/module\sphy_rx(/module phy_rx_synth(/' phy_synth.v
	sed -i 's/module\sphy_tx(/module phy_tx_synth(/' phy_synth.v

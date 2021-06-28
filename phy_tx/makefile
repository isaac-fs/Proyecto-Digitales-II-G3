all: yosys sed verilog

verilog:
	iverilog -o testbench testbench.v
	vvp testbench
	gtkwave phy_tx.vcd phy_tx.gtkw &
yosys:
	yosys script_y.ys

sed:
	sed -i 's/module\sMUX1_L1(/module MUX1_L1_synth(/' phy_tx_synth.v
	sed -i 's/MUX1_L1 /MUX1_L1_synth /' phy_tx_synth.v
	# sed -i 's/MUX1 /MUX1_synth /' phy_tx_synth.v
	# sed -i 's/MUX2 /MUX2_synth /' phy_tx_synth.v
	# sed -i 's/MUX3 /MUX3_synth /' phy_tx_synth.v

	sed -i 's/module\sMUXES(/module MUXES_synth(/' phy_tx_synth.v
	sed -i 's/MUXES /MUXES_synth /g' phy_tx_synth.v

	sed -i 's/module\sMUX_L2(/module MUX_L2_synth(/' phy_tx_synth.v
	sed -i 's/MUX_L2 /MUX_L2_synth /g' phy_tx_synth.v

	sed -i 's/module\sSerial_paralelo_tx(/module Serial_paralelo_tx_synth(/' phy_tx_synth.v
	sed -i 's/Serial_paralelo_tx /Serial_paralelo_tx_synth /g' phy_tx_synth.v

	sed -i 's/module\sparalelo_serial(/module paralelo_serial_synth(/' phy_tx_synth.v
	sed -i 's/paralelo_serial /paralelo_serial_synth /g' phy_tx_synth.v

	sed -i 's/module\sphy_tx(/module phy_tx_synth(/' phy_tx_synth.v
	
	
	sed -i 's/module\srecirculador(/module recirculador_synth(/' phy_tx_synth.v
	sed -i 's/recirculador /recirculador_synth /g' phy_tx_synth.v


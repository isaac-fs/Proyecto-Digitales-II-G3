all: yosys sed verilog

synth: yosys sed

verilog:
	iverilog -o out BancoPruebas.v
	vvp out
	gtkwave phy.vcd phy.gtkw &
yosys:
	yosys script_y.ys

sed:
	sed -i 's/module phy/module phy_synth/g' phy_synth.v
	sed -i 's/module MUX1_L1/module MUX1_L1_synth/g' phy_synth.v
	sed -i 's/module MUX_L2/module MUX_L2_synth/g' phy_synth.v
	sed -i 's/module MUXES/module MUXES_synth/g' phy_synth.v
	sed -i 's/module paralelo_serial_tx/module paralelo_serial_tx_synth/g' phy_synth.v
	sed -i 's/module recirculador/module recirculador_synth/g' phy_synth.v
	sed -i 's/module Serial_paralelo_tx/module serial_paralelo_tx_synth/g' phy_synth.v
	sed -i 's/module DEMUX_L1/module DEMUX_L1_synth/g' phy_synth.v
	sed -i 's/module DEMUX_L2/module DEMUX_L2_synth/g' phy_synth.v
	sed -i 's/module paralelo_serial_rx/module paralelo_serial_rx_synth/g' phy_synth.v
	sed -i 's/module serial_paralelo_rx/module serial_paralelo_rx_synth/g' phy_synth.v
	sed -i 's/module phy_rx/module phy_synth_rx/g' phy_synth.v
	sed -i 's/module phy_tx/module phy_synth_tx/g' phy_synth.v 
	
	sed -i 's/phy /phy_synth /g' phy_synth.v
	sed -i 's/MUX1_L1 /MUX1_L1_synth /g' phy_synth.v
	sed -i 's/MUX_L2 /MUX_L2_synth /g' phy_synth.v
	sed -i 's/MUXES /MUXES_synth /g' phy_synth.v
	sed -i 's/paralelo_serial_tx /paralelo_serial_tx_synth /g' phy_synth.v
	sed -i 's/recirculador /recirculador_synth /g' phy_synth.v
	sed -i 's/Serial_paralelo_tx /serial_paralelo_tx_synth /g' phy_synth.v
	sed -i 's/DEMUX_L1 /DEMUX_L1_synth /g' phy_synth.v
	sed -i 's/DEMUX_L2 /DEMUX_L2_synth /g' phy_synth.v
	sed -i 's/paralelo_serial_rx /paralelo_serial_rx_synth /g' phy_synth.v
	sed -i 's/serial_paralelo_rx /serial_paralelo_rx_synth /g' phy_synth.v
	sed -i 's/phy_rx /phy_synth_rx /g' phy_synth.v
	sed -i 's/phy_tx /phy_synth_tx /g' phy_synth.v

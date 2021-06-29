all : yosys sed verilog

verilog: 
	iverilog -o out Banco_Pruebas.v
	vvp out
	gtkwave serial.vcd serial.gtkw

yosys: 
	yosys script_y.ys

sed:
	sed -i 's/module\sSerial_paralelo_tx(/module serial_paralelo_synth(/' serial_paralelo_synth.v

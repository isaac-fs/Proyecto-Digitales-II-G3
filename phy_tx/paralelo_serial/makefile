all: yosys sed verilog

verilog:
	iverilog -o Banco_pruebas Banco_pruebas.v
	vvp Banco_pruebas
	gtkwave senales_paralelo_serial.vcd paralelo_serial.gtkw &
yosys:
	yosys script_y.ys

sed:
	sed -i 's/module\sparalelo_serial(/module paralelo_serial_synth(/' paralelo_serial_synth.v
	

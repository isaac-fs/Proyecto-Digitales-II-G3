all:
	iverilog -o Banco_Pruebas Banco_Pruebas.v
	vvp Banco_Pruebas
	gtkwave senales_serial_paralelo.vcd config.gtkw &

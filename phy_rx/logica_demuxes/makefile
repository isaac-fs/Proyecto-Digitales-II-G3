all:
	iverilog -o Banco_Pruebas Banco_Pruebas.v
	vvp Banco_Pruebas
	gtkwave senales_DEMUX_L1.vcd config.gtkw &

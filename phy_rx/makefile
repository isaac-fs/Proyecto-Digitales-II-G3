# escribir make en la terminal para correr el codigo
all:
	iverilog -o Banco_Pruebas Banco_Pruebas.v
	vvp Banco_Pruebas
	gtkwave senales_DEMUX_L2.vcd config.gtkw &

SHELL=/bin/bash
CC = iverilog
#FLAGS = -Ttyp
DEPS =  Banco_Pruebas.v probador.v phy_rx.v phy_rx_synth.v
.PHONY: gtk clean 

phy_rx.vvp: $(DEPS)
	@echo -e "\nCompilando $<"
	@$(CC) $(FLAGS) $< -o $@
	@echo -e "\nCorriendo $@\n"
	@vvp phy_rx.vvp

phy_rx_synth.v: phy_rx.v
	@echo -e "\nGenerando síntesis $@ con Yosys"
	@yosys -q -s yosys.ys
	@sed -i 's/module\sDEMUX_L1(/module DEMUX_L1_synth(/g' phy_rx_synth.v
	@sed -i 's/module\sDEMUX_L2(/module DEMUX_L2_synth(/g' phy_rx_synth.v
	@sed -i 's/module\sphy_rx(/module phy_rx_synth(/g' phy_rx_synth.v
	@sed -i 's/module\sserial_paralelo_rx(/module serial_paralelo_rx_synth(/' phy_rx_synth.v
	@sed -i 's/module\sparalelo_serial_rx(/module paralelo_serial_rx_synth(/g' phy_rx_synth.v

gtk: phy_rx.vvp
	@echo -e "\nCorriendo GTK Wave\n"
	@gtkwave ./phy_rx.vcd & disown

clean: 
	@rm *.vcd *.vvp
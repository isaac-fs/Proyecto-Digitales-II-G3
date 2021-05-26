# Proyecto, avance 1.
# Grupo 3

SHELL=/bin/bash
CC = iverilog
#FLAGS = -Ttyp
DEPS =  testbench.v probador.v phy_tx.v synt_phy_tx.v
.PHONY: gtk clean 

phy_tx.vvp: $(DEPS)
	@echo -e "\nCompilando $<"
	@$(CC) $(FLAGS) $< -o $@
	@echo -e "\nCorriendo $@\n"
	@vvp phy_tx.vvp

synt_phy_tx.v: phy_tx.v
	@echo -e "\nGenerando síntesis $@ con Yosys"
	@yosys -q -s yosys.ys
	@sed -i 's/module\sphy_tx(/module synt_phy_tx(/' synt_phy_tx.v
	@sed -i 's/module\srecirculador(/module synt_recirculador(/' synt_phy_tx.v
	@sed -i 's/module\sMUX1_L1(/module MUX1_L1_synth(/' synt_phy_tx.v
	@sed -i 's/module\sMUX_L2(/module MUX_L2_synth(/' synt_phy_tx.v
	@sed -i 's/module\sMUXES(/module MUXES_synth(/' synt_phy_tx.v

gtk: phy_tx.vvp
	@echo -e "\nCorriendo GTK Wave\n"
	@gtkwave ./phy_tx.vcd & disown

clean: 
	@rm *.vcd *.vvp

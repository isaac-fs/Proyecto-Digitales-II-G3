# Recirculador
# Isaac F. Fonseca Segura

SHELL=/bin/bash
CC = iverilog
#FLAGS = -Ttyp
DEPS =  testbench.v probador.v recirculador.v synth_recirculador.v
.PHONY: gtk clean 

recirculador.vvp: $(DEPS)
	@echo -e "\nCompilando $<"
	@$(CC) $(FLAGS) $< -o $@
	@echo -e "\nCorriendo $@\n"
	@vvp recirculador.vvp

synt_recirculador.v: recirculador.v
	@echo -e "\nGenerando síntesis $@ con Yosys"
	@yosys -q -s yosys.ys
	@sed -i 's/module\srecirculador(/module synth_recirculador(/' synth_recirculador.v

gtk: recirculador.vvp
	@echo -e "\nCorriendo GTK Wave\n"
	@gtkwave ./recirculador.vcd ./prueba_recirculador.gtkw & disown

clean: 
	@rm *.vcd *.vvp

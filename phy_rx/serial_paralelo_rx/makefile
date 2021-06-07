SHELL=/bin/bash
CC = iverilog
#FLAGS = -Ttyp
DEPS =  Banco_Pruebas.v probador.v serial_paralelo_rx.v serial_paralelo_rx_synth.v
.PHONY: gtk clean 

serial_paralelo_rx.vvp: $(DEPS)
	@echo -e "\nCompilando $<"
	@$(CC) $(FLAGS) $< -o $@
	@echo -e "\nCorriendo $@\n"
	@vvp serial_paralelo_rx.vvp

serial_paralelo_rx_synth.v: serial_paralelo_rx.v
	@echo -e "\nGenerando síntesis $@ con Yosys"
	@yosys -s yosys.ys
	@sed -i 's/module\sserial_paralelo_rx(/module serial_paralelo_rx_synth(/' serial_paralelo_rx_synth.v

gtk: serial_paralelo_rx.vvp
	@echo -e "\nCorriendo GTK Wave\n"
	@gtkwave ./serial_paralelo_rx.vcd & disown

clean: 
	@rm *.vcd *.vvp
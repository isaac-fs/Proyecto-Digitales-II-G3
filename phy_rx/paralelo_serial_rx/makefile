SHELL=/bin/bash
CC = iverilog
#FLAGS = -Ttyp
DEPS =  testbench.v probador.v paralelo_serial_rx.v parelo_serial_rx_synth.v
.PHONY: gtk clean 

paralelo_serial_rx.vvp: $(DEPS)
	@echo -e "\nCompilando $<"
	@$(CC) $(FLAGS) $< -o $@
	@echo -e "\nCorriendo $@\n"
	@vvp paralelo_serial_rx.vvp

parelo_serial_rx_synth.v: paralelo_serial_rx.v
	@echo -e "\nGenerando síntesis $@ con Yosys"
	@yosys -q -s yosys.ys
	@sed -i 's/module\sparalelo_serial_rx(/module paralelo_serial_rx_synth(/' paralelo_serial_rx_synth.v

gtk: paralelo_serial_rx.v
	@echo -e "\nCorriendo GTK Wave\n"
	@gtkwave ./paralelo_serial_rx.vcd & disown

clean: 
	@rm *.vcd *.vvp

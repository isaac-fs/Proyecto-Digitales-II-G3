# Makefile por Isaac Fonseca S.
SHELL=/bin/bash
CC = iverilog
#FLAGS = -g2005-sv #-Ttyp
TB_DIR = testbench
RTL_DIR = rtl
SYNTH_DIR = synthesis
TOP_MODULE = FIFO
MODULES = memoria
SIM_NAME = simulacion
SCRIPT = synth_script.ys
DEPS =  $(TB_DIR)/testbench.v $(TB_DIR)/probador.v $(RTL_DIR)/$(TOP_MODULE).v
.PHONY = gtk clean 

# Incluir synth a all para hacer sintesis siempre
# Eliminar gtk de all para poder refrescar la onda en una instancia de gtk
all: synth auto iverilog

iverilog : $(DEPS)
	@echo -e "\nCompilando $<"
	$(CC) $(FLAGS) $< -o $(TB_DIR)/$(SIM_NAME).vvp
	@echo -e "\nCorriendo $@\n"
	@vvp $(TB_DIR)/$(SIM_NAME).vvp

synth: $(RTL_DIR)/$(TOP_MODULE).v
# Editar el script de sintesis
	@sed -i 's/read_verilog\s.*.v/read_verilog $(RTL_DIR)\/$(TOP_MODULE).v/' $(SYNTH_DIR)/synth_script.ys
	@sed -i 's/hierarchy -check -top\s.*./hierarchy -check -top $(TOP_MODULE)/' $(SYNTH_DIR)/synth_script.ys
	@sed -i 's/write_verilog\s.*.v/write_verilog $(SYNTH_DIR)\/$(TOP_MODULE)_synth.v/' $(SYNTH_DIR)/synth_script.ys
# Generar la  síntesis
	@echo -e "\nGenerando síntesis $(TOP_MODULE)_synth.v con Yosys"
	@yosys -qq -s $(SYNTH_DIR)/$(SCRIPT) -l synthesis/yosys_log.log
# Añadir sufijos _synth	
	@echo -e "\nRenombrando módulos de $(TOP_MODULE)_synth.v con sed"
	@sed -i 's/module\s$(TOP_MODULE)(/module $(TOP_MODULE)_synth(/' $(SYNTH_DIR)/$(TOP_MODULE)_synth.v
	@for module in $(MODULES); do \
		sed -i 's/module\s$$module(/module $$module_synth(/' $(SYNTH_DIR)/$(TOP_MODULE)_synth.v; \
		sed -i 's/\\'$$module'\\/\\'$$module'_synth\\/g' ./$(SYNTH_DIR)/$(TOP_MODULE)_synth.v; \
	done
# Los \\ en sed son \ escapados.
# Los \/ en sed son / escapados.
# El formato de variable es '$$VAR'.

auto:
	@echo -e "\nEjecutando AUTOS en módulos de $(TB_DIR).v\n"
	@emacs -batch $(TB_DIR)/testbench.v -f verilog-auto -f save-buffer

gtk: 
	@echo -e "\nCorriendo GTK Wave\n"
	@gtkwave $(TB_DIR)/$(SIM_NAME).vcd $(TB_DIR)/$(TOP_MODULE)_sim.gtkw & disown

clean: 
	@rm -r $(TB_DIR)/*.vcd $(TB_DIR)/*.vvp

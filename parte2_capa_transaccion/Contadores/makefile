ALL: BUILD RUN

BUILD:
	yosys -s sintesis.ys
	sed -i 's/contadores/contadores_synth/g' contadores_synth.v
	
	iverilog -o tb.vvp banco_pruebas.v
	vvp tb.vvp

RUN:
	gtkwave test.vcd contadores_sim.gtkw &

CLEAN:
	rm *.vcd *.vvp

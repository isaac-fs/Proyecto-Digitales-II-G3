#!/bin/bash
for dir in recirculador muxes demuxes paralelo_serial_tx serial_paralelo_rx paralelo_serial_rx serial_paralelo_tx phy_tx phy_rx phy;
do gtkwave $dir/*.gtkw; 
done;
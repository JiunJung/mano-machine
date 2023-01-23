# Mano-machine
Verilog code for mano machine CPU.

<https://en.wikipedia.org/wiki/Mano_machine>

- Mano-machine is a CPU for education.

- These days, CPU structure is very complicated. Mano-machine shows basic structure and operation.

- It works with external Sram. (These days, CPU works with external Dram but making Dram is not easy. So I made simple Sram instead of Dram.)

- It has few instructions.
------

## Sram

- This Sram is not as same as common use sram.

- It has no W/R delay.

- When we_n signal is 0, Sram writes the data. You can easily check if writing is successful by "data_out" signal.

- When we_n signal is 1, Sram reads the data.

![sram waveform](/images/sram.jpg)

# Mano-machine
Verilog code for mano machine CPU.

All of those verilog file was verified by Xilinx Vivado simulation.

For more detail about Mano-machine : <https://en.wikipedia.org/wiki/Mano_machine>

- Mano-machine is a CPU for education.

- These days, CPU structure is very complicated. Mano-machine shows basic structure and operation.

- It works with external Sram. (These days, CPU works with external Dram but making Dram is not easy. So I made simple Sram instead of Dram.)

- It has few instructions.

------

## Sram

- This Sram is not as same as common use sram. It's just for simulate the CPU(Mano-machine).

- It has no W/R delay.

- When we_n signal is 0, Sram writes the data. You can easily check if writing is successful by "data_out" signal.

- When we_n signal is 1, Sram reads the data.

![sram waveform](/images/sram.jpg)

---------

## Testbench

- tb_cpu.v, score.txt, integer.txt is the set of Mano-machine testbench.

- It is a score addition program. 

- In the score.txt, 10 scores (out of 100) are listed.

- In the code.txt, binary codes are listed.

- Binary codes will be stored at address 0 to 11

- Scores will be stored at address 100 to 109

- Integer will be stored at address 200 and 201.

- The result of this test should be result.txt in this repository.

- if you want to test sram, use tb_sram.v

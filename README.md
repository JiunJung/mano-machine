# Mano-machine
Verilog code for mano machine CPU.

All of those verilog file was verified by Xilinx Vivado simulation.

It's different from common use CPU because it has no wire delay. It's just for learning how CPU works. But RTL simulation works because it doen't care wire delay.

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

----------------------

### score.txt

In this file, those are the binary number of...

- 85
- 72 
- 95
- 98
- 86
- 74
- 78
- 81
- 100
- 99

Sum of these scores are 868. So, the result should be 868.

------------------------

### code.txt

|No.|Assembly code|machine code(hexadecimal)|description|
|:---:|:---------:|:-----------------------:|:---------:|
|0.|LDA 200|20C8|move the data from 200 to AC (10 will be stored at AC)|


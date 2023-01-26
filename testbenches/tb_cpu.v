`timescale 0.1ns / 1ps

module tb_cpu;

//parameter
parameter DATA_WIDTH = 16;
parameter ADDR_WIDTH = 16;
//reg
reg clk;
reg reset_n;
//wire
wire [DATA_WIDTH-1:0] sram_to_cpu;
wire [DATA_WIDTH-1:0] cpu_to_sram;
wire [ADDR_WIDTH-1:0] addr;
wire we_n;

cpu cpu0(
    .clk(clk),
    .reset_n(reset_n),
    .data_in(sram_to_cpu),
    .addr(addr),
    .data_out(cpu_to_data),
    .we_n(we_n)
);

sram sram0(
    .clk(clk),
    .we_n(we_n),
    .data_in(cpu_to_sram),
    .addr(addr),
    .data_out(sram_to_cpu)
);

always #5 clk = ~clk;

initial begin
    clk = 1'b0; reset_n = 1'b1; 
    #2
    reset_n = 1'b0;
    #5
    reset_n = 1'b1;
    //use readmem and fdisplay for file operations
    #10
    $finish;

end

endmodule

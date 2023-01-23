`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/23 12:58:02
// Design Name: 
// Module Name: tb_sram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_sram;

reg clk;
reg we_n;
reg [15:0] addr;
reg [15:0] data_in;
wire [15:0] data_out;

always #5 clk = ~clk;

initial begin
clk = 1'b0; we_n = 1'b0;
#8
//write
addr = 4'b0000;
data_in = 4'b0000;
#10
addr = 4'b0001;
data_in = 4'b0101;
#10
addr = 4'b0010;
data_in = 4'b1100;
#10
we_n = 1'b1;
addr = 4'b0000;
//read
#10
addr = 4'b0000;
#10
addr = 4'b0001;
#10
addr = 4'b0010;
#20
$finish;
end

sram sram0(
.clk(clk),
.we_n(we_n),
.data_in(data_in),
.addr(addr),
.data_out(data_out));

endmodule

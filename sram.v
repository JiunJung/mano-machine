`timescale 0.1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: jiun
// 
// Create Date: 2023/01/23 12:42:13
// Design Name: 
// Module Name: sram
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


module sram(
input clk,
input we_n,
input [15:0] data_in,
input [15:0] addr,
output [15:0] data_out
    );
    
reg [15:0] mem [0:31];
reg [15:0] r_data_out;

always @(posedge clk)begin
if(!we_n)begin //write
mem[addr] <= data_in;
end
end

always @(posedge clk)begin
#1 r_data_out <= mem[addr];
end

assign data_out = r_data_out;

endmodule

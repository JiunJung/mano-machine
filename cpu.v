`timescale 1ns / 1ps

module cpu(
input clk,
input reset_n,
input [15:0] data_in,
output [15:0] addr,
output [15:0] data_out,
output we_n
    );
    
//define reg here
reg [15:0] AR, DR, IR, PC, AC;
reg I, E, r_we_n;
reg [3:0] D;
reg [3:0] SC;
reg [15:0] r_data_out;
//define reg done.

//assign here.
assign we_n = r_we_n;
assign addr = AR; //check! you don't have to write the bit size.
//assign end.

always @(posedge clk or negedge reset_n)begin

if(!reset_n)begin
//initialize registers.
AR <= 16'd0;
DR <= 16'd0;
IR <= 16'd0;
PC <= 16'd0;
AC <= 16'd0;
I <= 1'b0;
E <= 1'b0;
D <= 4'd0;
SC <= 4'd0;
r_we_n <= 1'b1; //defalt : read
end

else begin

if(SC == 4'b0000)begin //T0
r_we_n <= 1'b1; //defalt : read
AR <= PC;
SC <= SC + 1;
end

if(SC == 4'b0001)begin //T1
IR <= data_in;
PC <= PC + 1;
SC <= SC + 1;
end

if(SC == 4'b0010)begin //T2
I <= IR[15];
AR <= IR[11:0];
case(IR[14:12]) //decoder
    3'b000 : D <= 8'b00000001;
    3'b001 : D <= 8'b00000010;
    3'b010 : D <= 8'b00000100;
    3'b011 : D <= 8'b00001000;
    3'b100 : D <= 8'b00010000;
    3'b101 : D <= 8'b00100000;
    3'b110 : D <= 8'b01000000;
    3'b111 : D <= 8'b10000000;
    default : D <= 8'b00000000;
endcase
SC <= SC + 1;   
end

if(SC == 4'b0011)begin //T3

if(D[7] == 1'b0)begin //memory reference instructions
if(I == 1'b0)begin //direct addressing mode
SC <= SC + 1;
end 
else if(I == 1'b1)begin
AR <= data_in;
SC <= SC + 1;
end
end
else if(D[7] == 1'b1)begin //register reference instructions
if(I == 1'b0)begin
case(AR)
    16'h800 : AC <= 16'd0;        //CLA
    16'h400 : E <= 1'b0;          //CLE
    16'h200 : AC <= ~AC;          //CMA
    16'h100 : E <= ~E;            //CME
    16'h080 : AC <= {E,AC[15:1]}; //CIR
    16'h040 : AC <= {AC[14:0],E}; //CIL
    16'h020 : AC <= AC + 1;       //INC
endcase
SC <= SC + 1;
end
else if(I == 1'b1)begin
//input-output instructions
end
end
end

if(SC == 4'b0100)begin //T4
//pass
end

if(SC == 4'b0101)begin //T5
//pass
end

if(SC == 4'b0110)begin //T6
//pass
end

end //else

end //always


endmodule

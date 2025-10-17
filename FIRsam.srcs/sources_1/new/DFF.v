`timescale 1ns / 1ps


module DFF(q,d,D_mov,clr,clk);

input [7:0]d;
input clk,clr,D_mov;
output reg[7:0]q;

always@(posedge clk)
if(clr)
q<=0;
else if(D_mov) 
q<=d;

endmodule


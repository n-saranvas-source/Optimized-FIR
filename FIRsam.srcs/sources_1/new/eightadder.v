`timescale 1ns / 1ps

module eightadder(a,b,s);

input [7:0]a,b;
output [7:0]s;

assign s=a+b;
endmodule

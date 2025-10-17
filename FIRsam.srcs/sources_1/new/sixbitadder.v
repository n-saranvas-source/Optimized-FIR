`timescale 1ns / 1ps


module sixbitadder(a,b,s);

input [5:0] a,b;
output [5:0] s;

assign s=a+b;

endmodule

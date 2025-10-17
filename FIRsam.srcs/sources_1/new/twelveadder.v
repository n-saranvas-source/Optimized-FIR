`timescale 1ns / 1ps


module twelveadder(a,b,s);

input [11:0]a,b;
output [11:0]s;

assign s=a+b;

endmodule


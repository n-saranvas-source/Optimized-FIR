`timescale 1ns / 1ps

module twobit_vedic(a,b,s);
input [1:0]a,b;
output [4:0]s;
wire x,y,z,w;

and (s[0],a[0],b[0]);
and (x,a[1],b[0]);
and (y,a[0],b[1]);
and (z,a[1],b[1]);

halfadder ha0(x,y,s[1],w);
halfadder ha1(w,z,s[2],s[3]);

endmodule

`timescale 1ns / 1ps

module halfadder(a,b,s,cout);

input a,b;
output s,cout;

xor(s,a,b);
and(cout,a,b);

endmodule

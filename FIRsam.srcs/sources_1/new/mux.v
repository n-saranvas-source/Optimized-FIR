`timescale 1ns / 1ps


module mux(c,cin,bp,cout);

input c,cin,bp;
output cout;


assign cout=bp?cin:c;


endmodule

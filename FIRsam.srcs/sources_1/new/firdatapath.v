`timescale 1ns / 1ps
module fir_datapath(y,y_ld,D_ld,D_mov,D_sft,clr,data_in,clk,ycarry);
output [15:0]y;
input y_ld,D_ld,D_mov,D_sft,clr,clk;
input [7:0] data_in;
output ycarry;
wire [7:0] a,b,c,e,d;
wire [15:0] xout,yout,zout,wout,uout,vout,Aout,Bout,Cout,Dout;
parameter cin=1'b0;
parameter [7:0] w0=8'd3,w1=8'd6,w2=8'd6,w3=8'd5,w4=8'd1;

wire carry1,carry2,carry3;

pipo Xn(a,data_in,D_ld,clk);
DFF Xn1(b,a,D_mov,clr,clk);
reg_bank_shift Xn2(clk,clr,D_sft,b,e,d,c);

//multi one(xout,a,w0);
//multi two(uout,b,w1);
//multi three(zout,c,w2);
//multi four(wout,d,w3);
//multi five(vout,e,w4);

eightbitvedic one(xout,a,w0);
eightbitvedic two(uout,b,w1);
eightbitvedic three(zout,c,w2);
eightbitvedic four(wout,d,w3);
eightbitvedic five(vout,e,w4);

//wallace_8x8 one(xout,a,w0);
//wallace_8x8 two(uout,b,w1);
//wallace_8x8 three(zout,c,w2);
//wallace_8x8 four(wout,d,w3);
//wallace_8x8 five(vout,e,w4);

//BKA adder0(.cout(carry1),.s(Aout),.a(xout),.b(uout),.cin(cin));
//BKA adder1(.cout(carry2),.s(Bout),.a(Aout),.b(zout),.cin(carry1));
//BKA adder2(.cout(carry3),.s(Cout),.a(Bout),.b(wout),.cin(carry2));
//BKA adder3(.cout(ycarry),.s(Dout),.a(Cout),.b(vout),.cin(carry3));

//CLA adder0(.cout(carry1),.s(Aout),.a(xout),.b(uout),.cin(cin));
//CLA adder1(.cout(carry2),.s(Bout),.a(Aout),.b(zout),.cin(carry1));
//CLA adder2(.cout(carry3),.s(Cout),.a(Bout),.b(wout),.cin(carry2));
//CLA adder3(.cout(ycarry),.s(Dout),.a(Cout),.b(vout),.cin(carry3));

CSA adder0(.cout(carry1),.s(Aout),.a(xout),.b(uout),.cin(cin));
CSA adder1(.cout(carry2),.s(Bout),.a(Aout),.b(zout),.cin(carry1));
CSA adder2(.cout(carry3),.s(Cout),.a(Bout),.b(wout),.cin(carry2));
CSA adder3(.cout(ycarry),.s(Dout),.a(Cout),.b(vout),.cin(carry3));
pipo2 Yn(y,Dout,y_ld,clk);

endmodule


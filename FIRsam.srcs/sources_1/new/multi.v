
//`timescale 1ns / 1ps
//module multi(out,x,y);
//output reg[15:0]out;
//input [7:0]x,y;

//always@(*)
//out<=x*y;

//endmodule
//`timescale 1ns / 1ps


//module eightbitvedic(s,a,b);

//input [7:0]a,b;
//output [15:0]s;
//wire [7:0]q0,q1,q2,q3;
//wire [7:0]temp0;
//wire [11:0]temp1,temp2,temp3;
//wire [7:0]sum0;
//wire [11:0]sum1;


//fourbitvedic vedic0(a[3:0],b[3:0],q0);
//fourbitvedic vedic1(a[3:0],b[7:4],q1);
//fourbitvedic vedic2(a[7:4],b[3:0],q2);
//fourbitvedic vedic3(a[7:4],b[7:4],q3);

//assign temp0={4'b0000,q0[7:4]};
//assign temp1={4'b0000,q2[7:0]};
//assign temp2={q3[7:0],4'b0000};
//assign temp3={4'b0000,sum0[7:0]};

//eightadder z0(q1,temp0,sum0);
//twelveadder z1(temp1,temp2,sum1);
//twelveadder z2(sum1,temp3,s[15:4]);

//assign s[3:0]=q0[3:0];

//endmodule

`timescale 1ns / 1ps


module eightbitvedic(s,a,b);

input [7:0]a,b;
output [15:0]s;
wire [7:0]q0,q1,q2,q3;
wire [7:0]temp0;
wire [11:0]temp1,temp2,temp3;
wire [7:0]sum0;
wire [11:0]sum1;


fourbitvedic vedic0(a[3:0],b[3:0],q0);
fourbitvedic vedic1(a[3:0],b[7:4],q1);
fourbitvedic vedic2(a[7:4],b[3:0],q2);
fourbitvedic vedic3(a[7:4],b[7:4],q3);

assign temp0={4'b0000,q0[7:4]};
assign temp1={4'b0000,q2[7:0]};
assign temp2={q3[7:0],4'b0000};
assign temp3={4'b0000,sum0[7:0]};

//eightadder z0(q1,temp0,sum0);
eightbitBKA z0(.s(sum0),.a(q1),.b(temp0),.cin(1'b0));
twelvebitBKA z1(.s(sum1),.a(temp2),.b(temp1),.cin(1'b0));
twelvebitBKA z2(.s(s[15:4]),.a(temp3),.b(sum1),.cin(1'b0));
//twelveadder z1(temp1,temp2,sum1);
//twelveadder z2(sum1,temp3,s[15:4]);

assign s[3:0]=q0[3:0];

endmodule

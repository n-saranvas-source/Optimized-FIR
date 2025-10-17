//`timescale 1ns / 1ps


//module fourbitvedic(a,b,s);

//input [3:0] a,b;
//output [7:0] s;

//wire [3:0]q0,q1,q2,q3;
//wire [3:0]sum0;
//wire [5:0]sum1;
//wire [3:0]temp0;
//wire [5:0]temp1,temp2;

//twobit_vedic z0(a[1:0],b[1:0],q0);
//twobit_vedic z1(a[1:0],b[3:2],q1);
//twobit_vedic z2(a[3:2],b[1:0],q2);
//twobit_vedic z3(a[3:2],b[3:2],q3);
//assign temp0={2'b00,q0[3:2]};
//assign temp1={q3,2'b00};
//assign temp2={2'b00,q2};
//addfourbit a0(temp0,q1,sum0);
//sixbitadder a1(temp1,temp2,sum1);
//sixbitadder a2({2'b00,sum0},sum1,s[7:2]);



//assign s[1:0]=q0[1:0];


//endmodule


`timescale 1ns / 1ps


module fourbitvedic(a,b,s);

input [3:0] a,b;
output [7:0] s;

wire [3:0]q0,q1,q2,q3;
wire [3:0]sum0;
wire [5:0]sum1;
wire [3:0]temp0;
wire [5:0]temp1,temp2;
//wire cout;
twobit_vedic z0(a[1:0],b[1:0],q0);
twobit_vedic z1(a[1:0],b[3:2],q1);
twobit_vedic z2(a[3:2],b[1:0],q2);
twobit_vedic z3(a[3:2],b[3:2],q3);
assign temp0={2'b00,q0[3:2]};
assign temp1={q3,2'b00};
assign temp2={2'b00,q2};
//BKA_4bit a0(.s(sum0),.b(temp0),.a(q1),.cin(1'b0));
//BKA_6bit a1(.a(temp1),.b(temp2),.s(sum1));
//BKA_6bit a2(.a({2'b00,sum0}),.b(sum1),.s(s[7:2]));

CLA_4bit a0(.s(sum0),.b(temp0),.a(q1),.cin(1'b0));
CLA_6bit a1(.a(temp1),.b(temp2),.s(sum1));
CLA_6bit a2(.a({2'b00,sum0}),.b(sum1),.s(s[7:2]));



assign s[1:0]=q0[1:0];


endmodule
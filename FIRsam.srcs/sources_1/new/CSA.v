`timescale 1ns / 1ps
module CSA(cout,s,a,b,cin);

input [15:0]a,b;
input cin;
output cout;
output [15:0]s;



wire [3:0]bp;
wire [3:0]ca;
wire cout1,cout2,cout3;


assign bp[0]=&(a[3:0]^b[3:0]),
bp[1]=&(a[7:4]^b[7:4]),
bp[2]=&(a[11:8]^b[11:8]),
bp[3]=&(a[15:12]^b[15:12]);

carry_skip fa0(a[3:0],b[3:0],cin,s[3:0],ca[0]);
carry_skip fa1(a[7:4],b[7:4],cout1,s[7:4],ca[1]);
carry_skip fa2(a[11:8],b[11:8],cout2,s[11:8],ca[2]);
carry_skip fa3(a[15:12],b[15:12],cout3,s[15:12],ca[3]);

mux m0(ca[0],cin,bp[0],cout1);
mux m1(ca[1],cout1,bp[1],cout2);
mux m2(ca[2],cout2,bp[2],cout3);
mux m3(ca[3],cout3,bp[3],cout);



endmodule

`timescale 1ns / 1ps


module carry_skip(a,b,cin,s,cout);

input [3:0]a,b;
input cin;
output cout;
output [3:0]s;

wire [3:0]p,g;
//wire bp;

wire [2:0]ca;
assign g = a & b;
assign p=a^b;

assign s[0]=a[0]^b[0]^cin,
s[1]=a[1]^b[1]^ca[0],
s[2]=a[2]^b[2]^ca[1],
s[3]=a[3]^b[3]^ca[2];
assign ca[0] = g[0] | (p[0] & cin),
ca[1] = g[1] | (p[1] & ca[0]),
ca[2] = g[2] | (p[2] & ca[1]);
assign cout = g[3] | (p[3] & ca[2]);

//mux m(ca[2],cin,bp,cout);


endmodule

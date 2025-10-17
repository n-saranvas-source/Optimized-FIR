`timescale 1ns / 1ps
module CLA(cout,s,a,b,cin);

input [15:0]a,b;
input cin;
output cout;
output [15:0]s;

wire [3:0]p,g;
wire [2:0]c;
wire cout4,cout8,cout12,cout16;

CLA_4bit CLA1(.cout(cout4),.s(s[3:0]),.a(a[3:0]),.b(b[3:0]),.cin(cin),.p(p[0]),.g(g[0]));
CLA_4bit CLA2(.cout(cout8),.s(s[7:4]),.a(a[7:4]),.b(b[7:4]),.cin(c[0]),.p(p[1]),.g(g[1]));

CLA_4bit CLA3(.cout(cout12),.s(s[11:8]),.a(a[11:8]),.b(b[11:8]),.cin(c[1]),.p(p[2]),.g(g[2]));
CLA_4bit CLA4(.cout(cout16),.s(s[15:12]),.a(a[15:12]),.b(b[15:12]),.cin(c[2]),.p(p[3]),.g(g[3]));

//assign cout=cout16;

assign c[0]=g[0]|p[0]&cin;
assign c[1]=g[1]|p[1]&g[0]|p[0]&p[1]&cin;
assign c[2]=g[2]|p[2]&g[1]|p[2]&p[1]&g[0]|p[2]&p[1]&p[0]&cin;
assign cout=g[3]|g[2]&p[3]|p[3]&p[2]&g[1]|p[3]&p[2]&p[1]&g[0]|p[3]&p[2]&p[1]&p[0]&cin;


endmodule

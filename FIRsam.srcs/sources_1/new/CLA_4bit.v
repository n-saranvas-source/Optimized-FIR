`timescale 1ns / 1ps
module CLA_4bit(cout,s,p,g,a,b,cin);

input [3:0]a,b;
input cin;
output cout,p,g;
output [3:0]s;

wire [3:0]pro,gen;
wire c0,c1,c2,c3;

assign s[0]=a[0]^b[0]^cin,
s[1]=a[1]^b[1]^c0,
s[2]=a[2]^b[2]^c1,
s[3]=a[3]^b[3]^c2;

assign pro=a|b;
assign gen=a&b;

assign c0=gen[0]|pro[0]&cin,
c1=gen[1]|pro[1]&gen[0]|pro[1]&pro[0]&cin,
c2=gen[2]|pro[2]&gen[1]|pro[2]&pro[1]&gen[0]|pro[2]&pro[1]&pro[0]&cin,
c3=gen[3]|pro[3]&gen[2]|pro[3]&pro[2]&gen[1]|pro[3]&pro[2]&pro[1]&gen[0]|pro[2]&pro[3]&pro[1]&pro[0]&cin;

assign g=gen[3]|pro[3]&gen[2]|pro[3]&pro[2]&gen[1]|pro[3]&pro[2]&pro[1]&gen[0];
assign p=pro[0]&pro[1]&pro[2]&pro[3];

assign cout=c3;



endmodule
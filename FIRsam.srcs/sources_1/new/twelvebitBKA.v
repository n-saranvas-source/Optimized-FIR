`timescale 1ns / 1ps

module twelvebitBKA(cout,s,a,b,cin);

input [11:0]a,b;
input cin;
output cout;
output [11:0]s;

wire [11:0]pi,gi,pj,gj,pk,gk,pl,gl,pm,gm,pn,gn;
wire [11:0]p,g;
wire [10:0] c;

assign p = a ^ b;
assign g = a & b;

buff b1a0(pi[0],gi[0],p[0],g[0]);
carrygen cry1a0(pi[1],gi[1],p[1],g[1],g[0],p[0]);
buff b1a1(pi[2],gi[2],p[2],g[2]);
carrygen cry1a1(pi[3],gi[3],p[3],g[3],g[2],p[2]);
buff b1a2(pi[4],gi[4],p[4],g[4]);
carrygen cry1a2(pi[5],gi[5],p[5],g[5],g[4],p[4]);
buff b1a3(pi[6],gi[6],p[6],g[6]);
carrygen cry1a3(pi[7],gi[7],p[7],g[7],g[6],p[6]);
buff b1a4(pi[8],gi[8],p[8],g[8]);
carrygen cry1a4(pi[9],gi[9],p[9],g[9],g[8],p[8]);
buff b1a5(pi[10],gi[10],p[10],g[10]);
carrygen cry1a5(pi[11],gi[11],p[11],g[11],g[10],p[10]);

buff b2a0(pj[0],gj[0],pi[0],gi[0]);
buff b2a1(pj[1],gj[1],pi[1],gi[1]);
buff b2a2(pj[2],gj[2],pi[2],gi[2]);
carrygen cry2a0(pj[3],gj[3],pi[3],gi[3],gi[1],pi[1]);
buff b2a3(pj[4],gj[4],pi[4],gi[4]);
buff b2a4(pj[5],gj[5],pi[5],gi[5]);
buff b2a5(pj[6],gj[6],pi[6],gi[6]);
carrygen cry2a1(pj[7],gj[7],pi[7],gi[7],gi[5],pi[5]);
buff b2a6(pj[8],gj[8],pi[8],gi[8]);
buff b2a7(pj[9],gj[9],pi[9],gi[9]);
buff b2a8(pj[10],gj[10],pi[10],gi[10]);
carrygen cry2a2(pj[11],gj[11],pi[11],gi[11],gi[9],pi[9]);

buff b3a0(pk[0],gk[0],pj[0],gj[0]);
buff b3a1(pk[1],gk[1],pj[1],gj[1]);
buff b3a2(pk[2],gk[2],pj[2],gj[2]);
buff b3a3(pk[3],gk[3],pj[3],gj[3]);
buff b3a4(pk[4],gk[4],pj[4],gj[4]);
buff b3a5(pk[5],gk[5],pj[5],gj[5]);
buff b3a6(pk[6],gk[6],pj[6],gj[6]);
carrygen cry3a0(pk[7],gk[7],pj[7],gj[7],gj[3],pj[3]);
buff b3a7(pk[8],gk[8],pj[8],gj[8]);
buff b3a8(pk[9],gk[9],pj[9],gj[9]);
buff b3a9(pk[10],gk[10],pj[10],gj[10]);
buff b3a10(pk[11],gk[11],pj[11],gj[11]);

buff b4a0(pl[0],gl[0],pk[0],gk[0]);
buff b4a1(pl[1],gl[1],pk[1],gk[1]);
buff b4a2(pl[2],gl[2],pk[2],gk[2]);
buff b4a3(pl[3],gl[3],pk[3],gk[3]);
buff b4a4(pl[4],gl[4],pk[4],gk[4]);
buff b4a5(pl[5],gl[5],pk[5],gk[5]);
buff b4a6(pl[6],gl[6],pk[6],gk[6]);
buff b4a7(pl[7],gl[7],pk[7],gk[7]);
buff b4a8(pl[8],gl[8],pk[8],gk[8]);
buff b4a9(pl[9],gl[9],pk[9],gk[9]);
buff b4a10(pl[10],gl[10],pk[10],gk[10]);
carrygen cry4a0(pl[11],gl[11],pk[11],gk[11],gk[7],pk[7]);

buff b5a0(pm[0],gm[0],pl[0],gl[0]);
buff b5a1(pm[1],gm[1],pl[1],gl[1]);
buff b5a2(pm[2],gm[2],pl[2],gl[2]);
buff b5a3(pm[3],gm[3],pl[3],gl[3]);
buff b5a4(pm[4],gm[4],pl[4],gl[4]);
carrygen cry5a0(pm[5],gm[5],pl[5],gl[5],gl[3],pl[3]);
buff b5a5(pm[6],gm[6],pl[6],gl[6]);
buff b5a6(pm[7],gm[7],pl[7],gl[7]);
buff b5a7(pm[8],gm[8],pl[8],gl[8]);
carrygen cry5a1(pm[9],gm[9],pl[9],gl[9],gl[7],pl[7]);
buff b5a8(pm[10],gm[10],pl[10],gl[10]);
buff b5a9(pm[11],gm[11],pl[11],gl[11]);

buff b6a0(pn[0],gn[0],pm[0],gm[0]);
buff b6a1(pn[1],gn[1],pm[1],gm[1]);
carrygen cry6a0(pn[2],gn[2],pm[2],gm[2],gm[1],pm[1]);
buff b6a2(pn[3],gn[3],pm[3],gm[3]);
carrygen cry6a1(pn[4],gn[4],pm[4],gm[4],gm[3],pm[3]);
buff b6a3(pn[5],gn[5],pm[5],gm[5]);
carrygen cry6a2(pn[6],gn[6],pm[6],gm[6],gm[5],pm[5]);
buff b6a4(pn[7],gn[7],pm[7],gm[7]);
carrygen cry6a3(pn[8],gn[8],pm[8],gm[8],gm[7],pm[7]);
buff b6a5(pn[9],gn[9],pm[9],gm[9]);
carrygen cry6a4(pn[10],gn[10],pm[10],gm[10],gm[9],pm[9]);
buff b6a6(pn[11],gn[11],pm[11],gm[11]);


carry c0(c[0],g[0],p[0],cin);
 carry c1(c[1],gi[1],pi[1],cin);
 carry c2(c[2],gn[2],pn[2],cin);
 carry c3(c[3],gj[3],pj[3],cin);
 carry c4(c[4],gn[4],pn[4],cin);
 carry c5(c[5],gm[5],pm[5],cin);
 carry c6(c[6],gn[6],pn[6],cin);
 carry c7(c[7],gk[7],pk[7],c[6]);
  carry c8(c[8],gn[8],pn[8],cin);
 carry c9(c[9],gm[9],pm[9],cin);
 carry c10(c[10],gn[10],pn[10],cin);
 //carry c11(c[11],gk[11],pk[11],c[6]);
 
 sum s0(s[0],p[0],cin);
sum s1(s[1],p[1],c[0]);
sum s2(s[2],p[2],c[1]);
sum s3(s[3],p[3],c[2]);
sum s4(s[4],p[4],c[3]);
sum s5(s[5],p[5],c[4]);
sum s6(s[6],p[6],c[5]);
sum s7(s[7],p[7],c[6]);
sum s8(s[8],p[8],c[7]);
sum s9(s[9],p[9],c[8]);
sum s10(s[10],p[10],c[9]);
sum s11(s[11],p[11],c[10]);

assign cout=gl[11]|(pl[11]&cin);


endmodule
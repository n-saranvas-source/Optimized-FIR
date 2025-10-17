`timescale 1ns / 1ps

module CLA_6bit(
    output cout,              
    output [5:0] s,           
    output p,                 
    output g,                 
    input [5:0] a, b,         
    input cin                 
);

    
    wire [5:0] pro, gen;
    wire c0, c1, c2, c3, c4, c5;

   
    assign s[0] = a[0] ^ b[0] ^ cin;
    assign s[1] = a[1] ^ b[1] ^ c0;
    assign s[2] = a[2] ^ b[2] ^ c1;
    assign s[3] = a[3] ^ b[3] ^ c2;
    assign s[4] = a[4] ^ b[4] ^ c3;
    assign s[5] = a[5] ^ b[5] ^ c4;

   
    assign pro = a | b;
    assign gen = a & b;

   
    assign c0 = gen[0] | (pro[0] & cin);
    assign c1 = gen[1] | (pro[1] & gen[0]) | (pro[1] & pro[0] & cin);
    assign c2 = gen[2] | (pro[2] & gen[1]) | (pro[2] & pro[1] & gen[0]) | (pro[2] & pro[1] & pro[0] & cin);
    assign c3 = gen[3] | (pro[3] & gen[2]) | (pro[3] & pro[2] & gen[1]) | (pro[3] & pro[2] & pro[1] & gen[0]) |
                (pro[3] & pro[2] & pro[1] & pro[0] & cin);
    assign c4 = gen[4] | (pro[4] & gen[3]) | (pro[4] & pro[3] & gen[2]) | (pro[4] & pro[3] & pro[2] & gen[1]) |
                (pro[4] & pro[3] & pro[2] & pro[1] & gen[0]) | (pro[4] & pro[3] & pro[2] & pro[1] & pro[0] & cin);
    assign c5 = gen[5] | (pro[5] & gen[4]) | (pro[5] & pro[4] & gen[3]) | (pro[5] & pro[4] & pro[3] & gen[2]) |
                (pro[5] & pro[4] & pro[3] & pro[2] & gen[1]) | (pro[5] & pro[4] & pro[3] & pro[2] & pro[1] & gen[0]) |
                (pro[5] & pro[4] & pro[3] & pro[2] & pro[1] & pro[0] & cin);

   
    assign cout = c5;

   
    assign g = gen[5] | (pro[5] & gen[4]) | (pro[5] & pro[4] & gen[3]) | (pro[5] & pro[4] & pro[3] & gen[2]) |
               (pro[5] & pro[4] & pro[3] & pro[2] & gen[1]) | (pro[5] & pro[4] & pro[3] & pro[2] & pro[1] & gen[0]);
    assign p = pro[0] & pro[1] & pro[2] & pro[3] & pro[4] & pro[5];

endmodule


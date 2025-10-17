`timescale 1ns / 1ps
module reg_bank_shift(clk,rst,load,data_in,reg0,reg1,reg2);

    input clk;           
    input rst;          
    input load;         
    input [7:0] data_in;  
    output [7:0] reg0;    
    output [7:0] reg1;    
    output [7:0] reg2;   
    //output [7:0] reg3; 

    reg [7:0] r0, r1, r2; 
    
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            
            r0 <= 8'b0;
            r1 <= 8'b0;
            r2 <= 8'b0;
           // r3 <= 8'b0;
        end else if (load) begin
            
            r0 <= r1;   
            r1 <= r2;   
            r2 <= data_in;   
            //r3 <= data_in; 
        end
    end

    
    assign reg0 = r0;
    assign reg1 = r1;
    assign reg2 = r2;
    //assign reg3 = r3;

endmodule
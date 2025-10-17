`timescale 1ns / 1ps
module fir_controller(
    y_ld, D_ld, D_mov, D_sft, clr, clk, rst, start, done
);
input clk, rst, start;
output reg y_ld, D_ld, D_mov, D_sft, done, clr;

parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100;

reg [2:0] current_state, next_state;
reg [2:0] delay_counter; 
always @(posedge clk or posedge rst) begin
    if (rst) begin
        current_state <= s0;
    end else begin
        current_state <= next_state;
    end
end


always @(posedge clk) begin
    case(current_state)
        s0: if (start) next_state <= s1;
        s1: next_state <= s2;
        
        s2: begin
            if (delay_counter == 3'b001) 
                next_state <= s3;
            else
                next_state <= s2; 
        end
        
        s3: next_state <= s4;
        s4: next_state <= s1;
        default: next_state <= s0;
    endcase
end


always @(posedge clk or posedge rst) begin
    if (rst) begin
        delay_counter <= 3'b000;
    end else if (current_state == s2) begin
        if (delay_counter < 3'b001)
            delay_counter <= delay_counter + 1;
        else
            delay_counter <= 3'b000; 
    end else begin
        delay_counter <= 3'b000; 
    end
end


always @(current_state) begin
    case(current_state)
        s0: begin 
            y_ld <= 0; D_ld <= 0; D_mov <= 0; D_sft <= 0; done <= 0; clr <= 1; 
        end
        s1: begin 
            y_ld <= 0; D_ld <= 1; D_mov <= 0; D_sft <= 0; done <= 0; clr <= 0; 
        end
        s2: begin 
            y_ld <= 0; D_ld <= 0; D_mov <= 0; D_sft <= 0; done <= 0; clr <= 0; 
        end
        s3: begin 
            y_ld <= 1; D_ld <= 0; D_mov <= 0; D_sft <= 1; done <= 1; clr <= 0; 
        end
        s4: begin 
            y_ld <= 0; D_ld <= 0; D_mov <= 1; D_sft <= 0; done <= 0; clr <= 0; 
        end
        default: begin 
            y_ld <= 0; D_ld <= 0; D_mov <= 0; D_sft <= 0; done <= 0; clr <= 1; 
        end
    endcase
end

endmodule

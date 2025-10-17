`timescale 1ns / 1ps

module full_adder(
    input a_in,
    input b_in, c_in,
    output sum,
    output carry
    );
	 
	 assign sum = a_in ^ b_in ^ c_in ;
	 assign carry = (a_in & b_in) | (b_in & c_in) | (c_in &a_in);

endmodule
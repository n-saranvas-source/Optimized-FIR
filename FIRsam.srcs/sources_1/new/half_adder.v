`timescale 1ns / 1ps

module half_adder(
    input a_in,
    input b_in,
    output sum,
    output carry
    );
	
	 assign sum = a_in ^ b_in;
	 assign carry = a_in & b_in;

endmodule
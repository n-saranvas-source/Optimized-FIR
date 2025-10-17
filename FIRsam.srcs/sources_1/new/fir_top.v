module fir_top (
    input clk, rst, start,
    input [7:0] data_in,
    output [15:0] y,
    output done
);
    wire y_ld, D_ld, D_mov, D_sft, clr, ycarry;

    fir_datapath datapath (
        .y(y),
        .y_ld(y_ld),
        .D_ld(D_ld),
        .D_mov(D_mov),
        .D_sft(D_sft),
        .clr(clr),
        .data_in(data_in),
        .clk(clk),
        .ycarry(ycarry)
    );

    fir_controller controller (
        .y_ld(y_ld),
        .D_ld(D_ld),
        .D_mov(D_mov),
        .D_sft(D_sft),
        .clr(clr),
        .clk(clk),
        .rst(rst),
        .start(start),
        .done(done)
    );
endmodule



`timescale 1ns / 1ps
module fir_tb5();
reg start,clk,rst;
reg [7:0]data_in;

wire y_ld,D_ld,D_mov,D_sft,done,clr,ycarry;
wire [15:0]y;

fir_datapath UUT_DATAPATH (
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
    
    fir_controller UUT_CONTROLLER (
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
    always #5 clk=~clk;
    
    initial begin
    clk = 0;
        rst = 0;
        start = 0;
        data_in = 8'b0;
        
        rst=1;
        #20;
        rst=0;
        
        start=1;
        #10;
        start=0;
        
         #10;
        data_in = 8'd2;
        #20;
        #60;
        
        
        data_in = 8'd10; 
        #20;
        #60;
        
        data_in = 8'd3; 
        #20
        #60;
        
        data_in = 8'd4; 
        #20
        #60;
        
        data_in = 8'd3; 
        #20
        #60;
        
//        data_in = 8'd3; 
//        #20;
//        #60;
        
//        data_in = 8'd9; 
//        #20;
//        #60;
        
//        data_in = 8'd13; 
//        #20;
//        #60;
        
//        data_in = 8'd7; 
//        #20;
//        #60;
        
//        data_in = 8'd2; 
//        #20;
//        #60;
        
//        data_in = 8'd11; 
//        #20;
//        #60;
        
//        data_in = 8'd8; 
//        #20;
//        #60;
   
        $display("FIR Filter Output: %d", y);
        
        #3000 $finish;
    end
    
    
endmodule
// initial begin
//   clk = 0;
//     rst = 0;
//        start = 0;
//        data_in = 8'b0;
        
//        rst=1;
//        #20;
//        rst=0;
        
//        start=1;
//        #10;
//        start=0;
        
//         #10;
//        data_in = 8'd10;
//        #20;
//        #60;
        
//        data_in = 8'd5; 
//        #20;
//        #60;
        
//        data_in = 8'd3; 
//        #20
//        #60;
        
//        data_in = 8'd8; 
//        #20;
//        #60;
        
//        data_in = 8'd9; 
//        #20;
//        #60;
        
//        data_in = 8'd13; 
//        #20;
//        #60;
        
//        data_in = 8'd7; 
//        #20;
//        #60;
        
//        data_in = 8'd2; 
//        #20;
//        #60;
        
//        data_in = 8'd11; 
//        #20;
//        #60;
//        data_in = 8'd8; 
//        #20;
//        #60;
//        $display("FIR Filter Output: %d", y);
        
//        #3000 $finish;
//    end
//endmodule

//`timescale 1ns / 1ps

//module fir_top_tb();
    
//    // Testbench signals
//    reg clk;
//    reg rst;
//    reg start;
//    reg [7:0] data_in;
//    wire [15:0] y;
//    wire done;

//    // Instantiate the DUT (Device Under Test)
//    fir_top DUT (
//        .clk(clk),
//        .rst(rst),
//        .start(start),
//        .data_in(data_in),
//        .y(y),
//        .done(done)
//    );

//    // Clock generation
//    initial begin
//        clk = 0;
//        forever #5 clk = ~clk;  // 100 MHz clock (10 ns period)
//    end

//    // Test sequence
//    initial begin
       
//    clk = 0;
//        rst = 0;
//        start = 0;
//        data_in = 8'b0;
        
//        rst=1;
//        #20;
//        rst=0;
        
//        start=1;
//        #10;
//        start=0;
        
//         #10;
//        data_in = 8'd2;
//        #20;
//        #60;
        
        
//        data_in = 8'd10; 
//        #20;
//        #60;
        
//        data_in = 8'd3; 
//        #20
//        #60;
        
//        data_in = 8'd4; 
//        #20
//        #60;
        
//        data_in = 8'd3; 
//        #20
//        #60;
        
        
//        // Check the output
//        $display("Filter output: %d", y);

//        // End simulation
//       #3000  $finish;
//    end

//    // Monitor signals for debugging
//    initial begin
//        $monitor($time, " clk=%b rst=%b start=%b data_in=%d y=%d done=%b", 
//                 clk, rst, start, data_in, y, done);
//    end

//endmodule

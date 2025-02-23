`timescale 1ns/1ns
`include "reverse.v"
module reverse_tb();
reg clk, rst, start;
reg [15:0] x;
wire [15:0] reverse;
wire Done;
reverse uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .x(x),
    .reverse(reverse),
    .Done(Done)
);
always #5 clk = ~clk;
initial begin
    $dumpfile("reverse.vcd");
    $dumpvars(0, reverse_tb);
    clk = 0; rst = 1; start = 0;
    #5
    rst = 0;
    x = 16'd75;
    start = 1;
    #50
    start = 0;
    wait (Done)
    $display("reverse number : %d", reverse);
    #20
    $finish;

end
endmodule
`include "datapath.v"
`include "controller.v"
module reverse(
    input clk,
    input rst,
    input start,
    input [15:0] x,
    output [15:0] reverse,
    output Done
);
wire ld_x;
wire ld_out;
wire ld_re;
wire x_add;
wire x_div;
wire x_eq;
wire st;
datapath datapath(
    .clk(clk),
    .rst(rst),
    .x(x),
    .st(st),
    .ld_x(ld_x),
    .ld_re(ld_re),
    .ld_out(ld_out),
    .reverse(reverse),
    .x_eq(x_eq)
);
controller controller (
    .clk(clk),
    .rst(rst),
    .start(start),
    .x_eq(x_eq),
    .Done(Done),
    .st(st),
    .ld_x(ld_x),
    .ld_re(ld_re),
    .ld_out(ld_out)
);

endmodule
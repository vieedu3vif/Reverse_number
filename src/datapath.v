`include "register.v"
`include "add.v"
`include "div.v"
`include "mod.v"
`include "mux.v"
`include "mul.v"
`include "comp.v"
module datapath (
    input clk,
    input rst,
    input [15:0] x,
    input st,
    input ld_x,
    input ld_re,
    input ld_out,
    output [15:0] reverse,
    output x_eq
);
wire[15:0] x_mul;
wire[15:0] x_add;
wire[15:0] x_out;
wire [15:0] x_src;
wire [15:0] re_src;
wire [15:0] x_mod;
wire [15:0] x_div;
wire [15:0] re;

register regX (
    .clk(clk),
    .rst(rst),
    .d(x_src), 
    .ld(ld_x),
    .q(x_out)
);
register regRE (
    .clk(clk),
    .rst(rst),
    .d(re_src), 
    .ld(ld_re),
    .q(re)
);
register regO (
    .clk(clk),
    .rst(rst),
    .d(re), 
    .ld(ld_out),
    .q(reverse)
);
mux MuxX (
    .a(x),
    .b(x_div),
    .sel(st),
    .y(x_src)
);
mux MuxRE(
    .a(16'd0),
    .b(x_add),
    .sel(st),
    .y(re_src)
);
mod mod (
    .a(x_out),
    .b(16'd10),
    .y(x_mod)
);
div div (
    .a(x_out),
    .b(16'd10),
    .y(x_div)
);
mul mul (
    .a(re),
    .b(16'd10),
    .y(x_mul)
);
add add (
    .a(x_mul),
    .b(x_mod),
    .y(x_add)
);
comp comp (
    .a(16'd0),
    .b(x_out),
    .y(x_eq)
);
endmodule
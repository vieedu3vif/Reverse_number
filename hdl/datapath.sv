module datapath (

    input wire clk,

    input wire rst_n,

    input wire [15:0] x,

    input wire st,

    input wire ld_x,

    input wire ld_re,

    input wire ld_out,

    output logic [15:0] reverse,

    output logic x_eq

);



logic [15:0] x_mul;

logic [15:0] x_add;

logic [15:0] x_out;

logic [15:0] x_src;

logic [15:0] re_src;

logic [15:0] x_mod;

logic [15:0] x_div;

logic [15:0] re;



register regX (

    .clk(clk),

    .rst_n(rst_n),

    .d(x_src), 

    .ld(ld_x),

    .q(x_out)

);



register regRE (

    .clk(clk),

    .rst_n(rst_n),

    .d(re_src), 

    .ld(ld_re),

    .q(re)

);



register regO (

    .clk(clk),

    .rst_n(rst_n),

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



mod mod_inst (

    .a(x_out),

    .b(16'd10),

    .y(x_mod)

);



div div_inst (

    .a(x_out),

    .b(16'd10),

    .y(x_div)

);



mul mul_inst (

    .a(re),

    .b(16'd10),

    .y(x_mul)

);



add add_inst (

    .a(x_mul),

    .b(x_mod),

    .y(x_add)

);



comp comp_inst (

    .a(16'd0),

    .b(x_out),

    .y(x_eq)

);



endmodule

module reverse (reverse_if.DUT intf);



logic ld_x;

logic ld_out;

logic ld_re;

logic x_eq;

logic st;



datapath datapath_inst (

    .clk(intf.clk),

    .rst_n(intf.rst_n),    

    .x(intf.x),

    .st(st),

    .ld_x(ld_x),

    .ld_re(ld_re),

    .ld_out(ld_out),

    .reverse(intf.reverse),

    .x_eq(x_eq)

);



controller controller_inst (

    .clk(intf.clk),

    .rst_n(intf.rst_n),      

    .start(intf.start),

    .x_eq(x_eq),

    .Done(intf.Done),

    .st(st),

    .ld_x(ld_x),

    .ld_re(ld_re),

    .ld_out(ld_out)

);


endmodule



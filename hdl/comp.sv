module comp (

    input logic [15:0] a,

    input logic [15:0] b,

    output logic y

);

always_comb begin

    y = (a == b) ? 1: 0;

end

endmodule



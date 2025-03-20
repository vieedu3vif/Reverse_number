module mux (

    input  logic [15:0] a,

    input  logic [15:0] b,

    input  logic sel,

    output logic [15:0] y

);

    assign y = sel ? a : b;

endmodule



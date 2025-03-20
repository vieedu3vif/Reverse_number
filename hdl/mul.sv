module mul (

    input  logic [15:0] a,

    input  logic [15:0] b,

    output logic [15:0] y

);

    always_comb begin

        y = a * b;

    end

endmodule



module register (

    input  logic clk,

    input  logic rst_n,   // Reset tích cực mức thấp

    input  logic [15:0] d,

    output logic [15:0] q,

    input  logic ld

);

    always_ff @(posedge clk or negedge rst_n) begin

        if (!rst_n) 

            q <= 16'b00000000;

        else if (ld) 

            q <= d;

    end

endmodule



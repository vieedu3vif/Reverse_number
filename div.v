module div (
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] y
);
always @(*) begin
     y = a / b;
end
endmodule
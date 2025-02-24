module mux (
    input [15:0] a,
    input [15:0] b,
    input sel,
    output reg [15:0] y
);
always @(*) begin
    if (sel) y = a;
    else y = b;
end
endmodule
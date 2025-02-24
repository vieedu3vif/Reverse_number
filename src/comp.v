module comp (
    input [15:0] a,
    input [15:0] b,
    output reg y
);
always @(*) begin
    if (a == b) y = 1;
    else y = 0;
end
endmodule
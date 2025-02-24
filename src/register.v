module register(
    input clk,
    input rst,
    input [15:0] d,
    input ld,
    output reg [15:0] q
);
always @(posedge clk or posedge rst ) begin
    if(rst) q <= 8'b00000000;
    else if(ld) q <= d;
end
endmodule
module controller (
    input rst,
    input clk,
    input start,
    input x_eq,
    output reg Done,
    output reg st,
    output reg ld_x,
    output reg ld_re,
    output reg ld_out
);
reg [2:0] state, next_state;
parameter IDLE = 3'b000, LOAD = 3'b001, COMPARE = 3'b010, NEXT = 3'b011, DONE = 3'b100 ;
always @(posedge clk or posedge rst) begin
    if(rst) state = IDLE;
    else state = next_state;
end
always @(*) begin
    ld_x = 0;
    ld_re = 0;
    ld_out = 0;
    st = 0;
    next_state = state;

    case (state)
    IDLE: begin
        st = 1;
        ld_x = 1;
        ld_re = 1;
        if(start) next_state = LOAD;
    end
    LOAD: begin
        ld_x = 1;
        ld_re = 1;
        next_state = COMPARE;
    end
    COMPARE: begin
        if(!x_eq) next_state = NEXT;
        else next_state = DONE;
    end
    NEXT: begin
        next_state = LOAD;
    end
    DONE: begin
        ld_out = 1;
        Done = 1;
        if(!start) next_state = IDLE;
    end
    endcase
end
endmodule
module controller (

    input wire rst_n,  // Đổi rst thành rst_n

    input wire clk,

    input wire start,

    input wire x_eq,

    output logic Done,

    output logic st,

    output logic ld_x,

    output logic ld_re,

    output logic ld_out

);



typedef enum logic [2:0] {

    IDLE = 3'b000, 

    LOAD = 3'b001, 

    COMPARE = 3'b010, 

    NEXT = 3'b011, 

    DONE_STATE = 3'b100

} state_t;



state_t state, next_state;



always_ff @(posedge clk or negedge rst_n) begin

    if (!rst_n) 

        state <= IDLE;

    else 

        state <= next_state;

end



always_comb begin

    ld_x = 0;

    ld_re = 0;

    ld_out = 0;

    st = 0;

    Done = 0;

    next_state = state;



    case (state)

        IDLE: begin

            st = 1;

            ld_x = 1;

            ld_re = 1;

            if (start) 

                next_state = LOAD;

        end

        LOAD: begin

            ld_x = 1;

            ld_re = 1;

            next_state = COMPARE;

        end

        COMPARE: begin

            if (!x_eq) 

                next_state = NEXT;

            else begin
                ld_out = 1;
                next_state = DONE_STATE;
            end

        end

        NEXT: begin

            next_state = LOAD;

        end

        DONE_STATE: begin

            Done = 1;

            if (!start) 

                next_state = IDLE;

        end

    endcase

end



endmodule



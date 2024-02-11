module fsm_010_detection(
    input clk,
    input reset,
    input data,
    output reg out
);

// Define state enumeration
typedef enum logic [1:0] {
    IDLE,
    S0,
    S01,
    S010
} state_t;

// Define state register and next-state logic
state_t state, next_state;
always @ (posedge clk, negedge reset) begin
    if (reset == 0) begin
        state <= IDLE;
    end else begin
        state <= next_state;
    end
end

// Define output logic
always @ (state) begin
    case (state)
        IDLE: out <= 0;
        S0: out <= 0;
        S01: out <= 0;
        S010: out <= 1;
        default: out <= 0;
    endcase
end

// Define state transition logic
always @ (state, data) begin
    case (state)
        IDLE: if (data == 0) begin
                  next_state = IDLE;
              end else begin
                  next_state = S0;
              end
        S0: if (data == 0) begin
                next_state = S0;
            end else begin
                next_state = S01;
            end
        S01: if (data == 1) begin
                 next_state = S01;
             end else if (data == 0) begin
                 next_state = S0;
             end else begin
                 next_state = IDLE;
             end
        S010: next_state = IDLE;
        default: next_state = IDLE;
    endcase
end

endmodule
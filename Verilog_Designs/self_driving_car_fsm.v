module self_driving_car_fsm (
  input wire [7:0] speed_limit,
  input wire [7:0] car_speed,
  input wire [6:0] leading_distance,
  input wire clk,
  input wire rst,
  output reg accelerate_car,
  output reg door_locked
);

// Define state enumeration
typedef enum logic [1:0] {
  IDLE,
  ACCELERATING,
  BRAKING,
  DOOR_LOCKED
} state_t;

// Define state register and next state logic
reg [1:0] state_reg, state_next;

always_ff @(posedge clk or posedge rst) begin
  if (rst) begin
    state_reg <= IDLE;
    accelerate_car <= 0;
    door_locked <= 1;
  end else begin
    state_reg <= state_next;
    case (state_reg)
      IDLE: begin
        if (leading_distance > 20) begin
          state_next = ACCELERATING;
        end else begin
          state_next = BRAKING;
        end
      end
      ACCELERATING: begin
        if (car_speed < speed_limit) begin
          state_next = ACCELERATING;
          accelerate_car <= 1;
        end else begin
          state_next = IDLE;
          accelerate_car <= 0;
        end
      end
      BRAKING: begin
        if (leading_distance < 10) begin
          state_next = DOOR_LOCKED;
          door_locked <= 1;
        end else if (car_speed > speed_limit) begin
          state_next = BRAKING;
          accelerate_car <= 0;
        end else begin
          state_next = IDLE;
          accelerate_car <= 0;
        end
      end
      DOOR_LOCKED: begin
        if (unlock_doors) begin
          state_next = IDLE;
          door_locked <= 0;
        end else begin
          state_next = DOOR_LOCKED;
          door_locked <= 1;
        end
      end
      default: state_next = IDLE;
    endcase
  end
end

endmodule

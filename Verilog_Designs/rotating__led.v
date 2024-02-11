module rotating__led(clk, rst, dir, led);
input clk, rst, ;
output reg [15:0] led;
reg [15:0] shift_reg;
clk_divider #(3_000_000) c1(clk_in,rst,clk_out);

always @ (posedge clk_out, posedge rst) begin
  if (rst) begin
    shift_reg <= 0;
  end else begin
    if (dir) begin
      shift_reg <= {shift_reg[0], shift_reg[15:1]};
    end else begin
      shift_reg <= {shift_reg[14:0], shift_reg[15]};
    end
  end
end

assign led = shift_reg;




endmodule

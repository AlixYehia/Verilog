module _4bit_piority_encoder (x,y);
input [3:0]x;
output reg [1:0]y;
always @(*) begin
casex(x)
4'b1xxx: y=2'b11;  // that means must be unkwon which is wrong  so i can solve it by typing casex instead of case
4'b01xx: y=2'b10;
4'b001x: y=2'b01;
default: y=2'b00;
endcase
end
initial begin
 $monitor("x=%b, y=%b",x,y);
 end
endmodule
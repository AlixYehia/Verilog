module alu (a,b,opcode,out);  
parameter w=1;
input [w-1:0]a,b;
input [1:0]opcode;
output reg [w-1:0]out;
wire [w-1:0]addresult;

adder_N_Bit #(.w(w)) adder(a, b, addresult); 
// must use in order if didnt connect with .     i can paramtrize #(4) 0r #(N)
always @(*) begin
case(opcode)
2'b00: out=addresult;
2'b10: out=a-b;
2'b01: out=a|b;
default: out=a^b;
endcase
end
initial begin
 $monitor("a=%b, b=%b, opcode=%b, out=%b",a,b,opcode,out);
 end
endmodule
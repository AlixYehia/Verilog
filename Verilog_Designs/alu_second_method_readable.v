module alu (a,b,opcode,out);  
parameter w=1;
input [w-1:0]a,b;
input [1:0]opcode;
output reg [w-1:0]out;
wire [w-1:0]addresult;
wire operation;
adder_N_Bit #(.w(w)) adder(a, b, addresult);

always @(*) begin
case(opcode)
2'b00: begin out=addresult; operation='add'; end
2'b10: begin out=a-b; operation='subtract';  end
2'b01: begin out=a|b; operation='OR';        end
default: begin out=a^b;     operation='XOR'; end
endcase
end
initial begin
 $monitor("a=%b, b=%b, opcode=%b, operation=%c, out=%b",a,b,opcode,operation,out);
 end
endmodule
module adder_N_Bit (a,b,c);  //ignore the carry
parameter w=1;
input [w-1:0]a,b;
output [w-1:0]c;

assign {c}=a+b;
initial begin
 $monitor("a=%b, b=%b, c=%b",a,b,c);
 end
endmodule
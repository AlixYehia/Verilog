module full_adder (a, b, cin, sum, cout);
input [3:0]a,b;
input cin;
output reg [3:0]sum;
output reg cout;

always @(*) begin
{cout,sum}=a+b+cin;
	
end

endmodule
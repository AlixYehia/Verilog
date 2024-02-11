module _4_bit_ribble_counter(set,clk,out);
input set,clk;
output reg [3:0]out;

always @(posedge clk or set) begin
	if(~set)
	out<=0;
	else 
	out<=out+1;
end

endmodule
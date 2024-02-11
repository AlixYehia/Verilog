module clk_divider(clk_in,rst,clk_out);
parameter Div_value=50_000_000;
input clk_in,rst;
output reg clk_out;

reg[$clog2(Div_value)-1:0] count;

always @(posedge clk_in) begin
	if (rst) begin
		clk_out<=0;
		cou<=0;
	end
	else if () begin
		if (count==Div_value) begin
		clk_out<=~clk_out;
			
		end
		else begin
			count<=count+1;
		end
	end
end
endmodule

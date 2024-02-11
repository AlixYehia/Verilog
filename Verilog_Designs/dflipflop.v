module dflipflop(e,d,clk,q);
input e,clk,d;
output reg q;
always@(posedge clk) begin
	if (e)
	q<=d;

end

endmodule
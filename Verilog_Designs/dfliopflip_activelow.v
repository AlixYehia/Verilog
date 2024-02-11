module dfliopflip_activelow(d,rstn,clk,q,qbar);
input d,rstn,clk;
output reg q,qbar;

always @(posedge clk or negedge rstn)begin
	if(~rstn)
	q=0;
	else begin
		q=d;
		qbar=q;
	end
end

endmodule
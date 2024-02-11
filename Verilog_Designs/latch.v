module latch(aclr,aset,gate,data,q);
input aclr,aset,gate;
parameter LAT_WIDTH=1;
input [LAT_WIDTH-1:0]data;
output reg [LAT_WIDTH-1:0]q;

always@(*) begin
	if(aclr)
	q<=1'b0;
	else if(aset)
	q<=1'b1;
	else if(gate)
	q<=data;

end


endmodule
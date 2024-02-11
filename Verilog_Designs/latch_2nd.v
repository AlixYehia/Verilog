module lat (aset,aclr,gate,data,Q);
parameter LAT_WIDTH=1;
input [LAT_WIDTH-1:0] data;
input aset,gate,aclr ;
output  reg [LAT_WIDTH-1:0]  Q;

always @(*) begin
	if (aclr) 
		Q<=0;
	else if (aset) 
	    Q<=1;	
   else if (gate)
        Q<=data;      
	

end
endmodule
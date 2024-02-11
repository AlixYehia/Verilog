module parametrized_shift_register(sclr,sset,enable,clock,shiftin,load,data,aclr,aset,shiftout,q);
parameter LOAD_AVALUE=1,SHIFT_DIRECTION='LEFT',LOAD_SVALUE=0,SHIFT_WIDTH=8;

input sclr,sset,enable,clock,load,aclr,aset;
input reg [SHIFT_WIDTH-1:0]data;
input reg shiftin,shiftout;
output [SHIFT_WIDTH-1:0]q;

always@(posedge clock or posedge aclr) begin
	if(aclr)
	data<=0;
	else if(aset)
	shiftout<=LOAD_AVALUE;
	else if (enable) begin
		if(SHIFT_DIRECTION=='LEFT')
		shiftin<={[6:0]data,0};
		else if(SHIFT_DIRECTION=='RIGHT')
		shiftin<={0,[7:1]data};
	end

	else begin
		if(sclr)
		data<=0;
		else if(sset)
		shiftout<=LOAD_SVALUE;
		else if (enable) begin
			if(SHIFT_DIRECTION=='LEFT')
			shiftin<={[6:0]data,0};
			else if(SHIFT_DIRECTION=='RIGHT')
			shiftin<={0,[7:1]data};
		end
	end
	shiftout<=shiftin;
end
q=shiftout;

endmodule

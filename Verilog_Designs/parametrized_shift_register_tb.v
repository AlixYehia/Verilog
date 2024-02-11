module parametrized_shift_register_tb();
parameter LOAD_AVALUE=1,SHIFT_DIRECTION='LEFT',LOAD_SVALUE=0,SHIFT_WIDTH=8;
reg sclr,sset,enable,clock,load,aclr,aset;
reg [SHIFT_WIDTH-1:0]data;
reg shiftin,shiftout;
wire [SHIFT_WIDTH-1:0]q;
 
parametrized_shift_register dut(sclr,sset,enable,clock,shiftin,load,data,aclr,aset,shiftout,q);

initial begin
	clock=0;
	forever
	#1 clock=~clock;
end

initial begin
	sclr=0;
	sset=0;
	aclr=0;
	aset=0;
	en=0;
	data=0;
	#50
	sclr=1;
	sset=0;
	aclr=0;
	aset=0;
	en=0;
	#50
	sclr=0;
	sset=1;
	aclr=0;
	aset=0;
	en=0;
	#50
	sclr=0;
	sset=0;
	aclr=1;
	aset=0;
	en=0;
	#50
	sclr=0;
	sset=0;
	aclr=0;
	aset=1;
	en=0;
	#50
	sclr=0;
	sset=0;
	aclr=0;
	aset=0;
	en=1;
	#50;
	for(i=0; i<100; i=i+1) begin
		@(negedge clock)
		data=$random;
	end
	#2 $stop;
end

endmodule
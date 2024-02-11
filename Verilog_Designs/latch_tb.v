module latch_tb();
parameter LAT_WIDTH=1;
reg aclr,aset,gate;
reg [LAT_WIDTH-1:0]data;
wire [LAT_WIDTH-1:0]q;
integer i;
latch dut(aclr,aset,gate,data,q);

initial begin
	gate=0;
	forever
	#1 gate=~gate;
end

initial begin
	aclr=1;
	aset=0;
	data=0;
	#50
	aclr=0;
	aset=1;
	#50
	aclr=0;
	aset=0;
	#50;
	for(i=0; i<100; i=i+1) begin
		@(negedge gate)
		data=$random;
	end
	#2 $stop;
end

endmodule
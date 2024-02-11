module tb_latch();
parameter LAT_Width=1;
reg aset,aclr,gate;
reg [LAT_Width-1:0] d;
wire [LAT_Width-1:0] q;

integer i=0;
latch dut (ast,aclr,gate,d,q);

// generating clock 

initial begin
	gate=0;
	forever
	#1 gate=~gate;
end
 // values for inputs
initial begin
aclr=1;
aset=0;
d=0;
#50

aclr=0;
aset=1;
#50
// checking dominant condition for clear 
aclr=0;
aset=0;
#50

for(i=0; i<50; i=i+1) begin
#10
d=$random;
end

#10 $stop;
end

endmodule
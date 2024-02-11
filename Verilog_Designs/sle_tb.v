module sle_tb();
reg aln,clk,en,sln,d;
wire q;
sle dut(aln,clk,en,sln,d,q);
integer lat=0;
integer sd=1;
integer adn=1;
integer i;
initial begin
	clk=0;
	forever
	#1 clk=~clk;
end

initial begin
	aln=1;
	en=0;
	d=0;
	#50
	aln=0;
	en=0;
	#50
	aln=0;
	en=1;
	sln=1;
	#50
	aln=0;
	en=1;
	sln=0;
	#50;
	for(i=0; i<100; i=i+1) begin
		@(negedge clk)
		d=$random;
	end
	#2 $stop;
end

endmodule
module dflipflop_tb();
reg e,clk,d;
wire q;
integer i;
dflipflop dut(e,d,clk,q);
initial begin
	clk=0;
	#2
	forever begin
	
	clk=~clk;
	#2;
	end
end

initial begin
	e=0;
	d=0;
	#50
	e=1;
	#50;
	for(i=0; i<100; i=i+1) begin
	@(negedge clk)
		d=$random;
	end
	#2 $stop;

end
endmodule
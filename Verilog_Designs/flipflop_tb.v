module flipflop_tb();
reg pre,e,clk,d;
wire q;
integer i;

flipflop dut(pre,e,clk,d,q);

//clock generation
initial begin
	clk=0;
	forever
	#1 clk=~clk;
end

initial begin
	//reset and intial values for inputs
	pre=0;
	e=0;
	d=0;
	#50 pre=1;
	#100;
	for(i=0; i<10; i=i+1) begin // output wont change
		@(negedge clk);
		d=$random;
		e=$random;
	end
	#2 $stop;
end
endmodule
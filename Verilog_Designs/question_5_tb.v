module question_5_tb();

reg set,clk;
wire dutout,out;
_4_bitRipple_counter_structural_modelling dut(.clk(clk), .rstn(set), .out(dutout));
_4_bit_ribble_counter gold(set,clk,out);

initial begin
	clk=0;
	forever
	#1 clk=~clk;
end

initial begin
	set=1;
	#50
	set=0;
	#50;
	if(out != dutout) begin
	$display("error not equal");
	end
	#2 $stop;
end

endmodule

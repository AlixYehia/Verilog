module _4_bitRipple_counter_structural_modelling(clk,rstn,out);
input rstn,clk;
output reg [3:0]out;
wire z1,z2,z3,outflipflop,lastout;

dfliopflip_activelow dut1(.d(outflipflop), .rstn(rstn), .clk(clk), .q(z1),      .qbar(outflipflop));
dfliopflip_activelow dut2(.d(outflipflop), .rstn(rstn), .clk(z1),  .q(z2),      .qbar(outflipflop));
dfliopflip_activelow dut3(.d(outflipflop), .rstn(rstn), .clk(z2),  .q(z3),      .qbar(outflipflop));
dfliopflip_activelow dut4(.d(outflipflop), .rstn(rstn), .clk(z3),  .q(lastout), .qbar(outflipflop));

always @(posedge clk or rstn) begin
	if(~rstn)
	out<=lastout;
	else 
	out<=out+1;
end

endmodule
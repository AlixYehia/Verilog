module flipflop (PRE,E,CLK,D,Q);
input PRE,E,CLK,D;
output reg Q;

always@(posedge CLK or negedge PRE ) begin        //active low changes from 1 ton 0

if(~PRE)
Q<=1'b1;
else begin
	if(E==1)
	Q<=D;
end

end


endmodule
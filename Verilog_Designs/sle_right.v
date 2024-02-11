module sle(aln,clk,en,sln,d,q);
input aln,clk,en,sln,d;
output reg q;
integer lat=0;   // lat not asynochrous signal so cant be put in sensitivity list
integer sd=1;
integer adn=1;
/// need mux since senythesis tool might be stupid also it is wrong to check            incorrect coding style for reset since it ,jst
// for lat first thing since aln has piority so i can put lat inside the else not first thing
always@(posedge clk or negedge aln) begin
	if(lat==0)begin // wrong to put here
		if (aln==0)
		q<=~adn;
		// should be here
		else if(en==1&&sln==0)
		q<=sd;
		else if(en&&sln==1)
		q<=d;
	end
end

    
always @(*)begin
	if(lat)begin
		if(aln==0)
		q<=~adn;
		else if(en)begin
			if(sln==0)
			q<=sd;
			else
			q<=d; 
		end
	end
end

endmodule
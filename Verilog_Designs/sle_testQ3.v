module sle(aln,adn,lat,clk,en,sln,sd,d,q);
input aln,adn,lat,clk,en,sln,sd,d;
output reg q;
lat=0;
sd=1;
adn=1;

always@(posedge clk or negedge aln) begin
	if(lat==0)begin
		if (aln==0)
		q<=~adn;
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
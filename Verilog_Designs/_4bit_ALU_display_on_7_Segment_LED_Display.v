module _4bit_ALU_display_on_7_Segment_LED_Display (A,B,opcode,enable,out);  
parameter n=4;
input [n-1:0]A,B;
input [1:0]opcode;
input enable;
output reg [6:0]out;
wire [n-1:0]aluout;

alu #(.w(n)) ALU(A, B, opcode, aluout);

always @(*) begin
if (enable==1) begin
	

	if (aluout==0) begin
		out=7'b1111110;
	end

	else if (aluout==1) begin
		out=7'b0110000;
	end

	else if (aluout==2) begin
		out=7'b1101101;
	end

	else if (aluout==3) begin
		out=7'b1111001;
	end

	else if (aluout==4) begin
		out=7'b0110011;
	end

	else if (aluout==5) begin
		out=7'b1011011;
	end

	else if (aluout==6) begin
		out=7'b1011111;
	end

	else if (aluout==7) begin
		out=7'b1110000;
	end

	else if (aluout==8) begin
		out=7'b1111111;
	end

	else if (aluout==9) begin
		out=7'b1111011;
	end

	else if (aluout==10) begin
		out=7'b1110111;
	end

	else if (aluout==11) begin
		out=7'b0011111;
	end

	else if (aluout==12) begin
		out=7'b1001110;
	end

	else if (aluout==13) begin
		out=7'b0111101;
	end

	else if (aluout==14) begin
		out=7'b1001111;
	end

	else if (aluout==15) begin
		out=7'b1000111;
	end



end

else if (enable==0) begin
	out=7'b0;
end

end

endmodule
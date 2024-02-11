module voda_user_detector(clk, rst, x, y, users_count);
	parameter IDLE = 2'b00;
	parameter ZERO = 2'b01;
	parameter ONE = 2'b10;
	parameter STORE = 2'b11; // minimum distance between two vehicles is 40 meters with speed_limit = 80 km/hr

	input clk, rst, x;
	output reg y;
	output reg [9:0] users_count;

	reg [1:0] cs, ns; // cs: current state, ns: next state

	//Next State Logic
	always @(*) begin
		case (cs)
			IDLE: 
				if (x)
					ns = IDLE;
				else 
					ns = ZERO;

			ZERO:
				if (x)
					ns = ONE;
				else 
					ns = ZERO;

			ONE: 
				if (x)
					ns = IDLE;
				else 
					ns = STORE;

			STORE: 
				if (x)
					ns = IDLE;
				else 
					ns = ZERO;

			default: 	ns = IDLE;
		endcase
	end


	//State Memory
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			cs <= IDLE;
			users_count <= 0;
		end
		else
			cs <= ns;
	end

	//Output Logic
	always @(cs) begin
		case (cs)
			IDLE: y = 0;
			ZERO: y = 0;
			ONE:  y = 0;
			STORE: begin
				y = 1;
				users_count = users_count + 1;
			end


		endcase

	end
endmodule
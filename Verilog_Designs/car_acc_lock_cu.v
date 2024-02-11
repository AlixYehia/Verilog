module acc_lock_cu(clk, rstn, speed_limit, leading_distance, car_speed, unlock_doors, accelerate_car);
	parameter STOP = 2'b00;
	parameter ACCELEARATE = 2'b01;
	parameter DECELERATE = 2'b11;
	parameter MIN_DISTANCE = 7'd40; // minimum distance between two vehicles is 40 meters with speed_limit = 80 km/hr

	input clk, rstn;
	input [7:0] speed_limit; 
	input [6:0] leading_distance; 
	input [7:0] car_speed;
	output reg unlock_doors, accelerate_car;

	reg [1:0] cs, ns; // cs: current state, ns: next state

	//Next State Logic
	always @(cs, speed_limit, leading_distance, car_speed) begin
		case (cs)
			STOP: 
				if (leading_distance < MIN_DISTANCE)
					ns = STOP;
				else 
					ns = ACCELEARATE;

			ACCELEARATE:
				if ( (leading_distance >= MIN_DISTANCE) && (car_speed < speed_limit) )
					ns = ACCELEARATE;
				else 
					ns = DECELERATE;

			DECELERATE: 
				if (car_speed == 0)
					ns = STOP;
				else if ( (leading_distance >= MIN_DISTANCE) && (car_speed < speed_limit) ) 
					ns = ACCELEARATE;
				else
					ns = DECELERATE;
			default: 	ns = STOP;
		endcase
	end


	//State Memory
	always @(posedge clk or negedge rstn) begin
		if(~rstn)
			cs <= STOP;
		else
			cs <= ns;
	end

	//Output Logic
	always @(cs) begin
		case (cs)
			STOP: begin 
				unlock_doors = 1'b1;
				accelerate_car = 1'b0;
			end
			ACCELEARATE: begin
				unlock_doors = 1'b0;
				accelerate_car = 1'b1;
			end
			DECELERATE: begin
				unlock_doors = 1'b0;
				accelerate_car = 1'b0;
			end
		endcase

	end
endmodule
module car_acc_lock_cu_tb();
	reg clk, rstn;
  reg [7:0] speed_limit;
  reg [6:0] leading_distance; 
  reg [7:0] car_speed;
  wire unlock_doors, accelerate_car;

  acc_lock_cu c1(clk, rstn, speed_limit, leading_distance, car_speed, unlock_doors, accelerate_car);

  //clock generation
  initial begin
    clk = 0;
    forever
      #1 clk = ~clk;
  end

	//reset and initial values for inputs
  initial begin
    rstn = 0;
    speed_limit = 8'd80;
    leading_distance = 7'd50;
    car_speed = 0;
    #50
    // test acceleration and deceleration with speed limit
    car_speed = 8'd20;
    rstn = 1;
    #1000
    // test the safety for car crashes with leading vehicle/object
    leading_distance = 7'd10;
    #1000;
    $stop;
  end 

  //change speed of the car during the current state entered in the previous clock edge
  always @(negedge clk) begin
    if (rstn) begin
      if (car_speed != 0) begin
        if (accelerate_car)
          car_speed = car_speed + 1;
        else 
          car_speed = car_speed - 1;
      end
    end
  end

	// //Test monitor and results
   initial begin
     $monitor("clk = %b, rst = %b, speed_limit = %d, leading_distance = %d, car_speed = %d, unlock_doors = %d, accelerate_car = %d", clk, rstn, speed_limit, leading_distance, car_speed, unlock_doors, accelerate_car);
   end
endmodule
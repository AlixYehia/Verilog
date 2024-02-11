module self_driving_car_fsm_tb;

  // Define test inputs
  reg [7:0] speed_limit;
  reg [7:0] car_speed;
  reg [6:0] leading_distance;
  reg clk;
  reg rst;
  reg unlock_doors;
  
  // Define test outputs
  wire accelerate_car;
  wire door_locked;
  
  // Instantiate the DUT
  self_driving_car_fsm dut (
    .speed_limit(speed_limit),
    .car_speed(car_speed),
    .leading_distance(leading_distance),
    .clk(clk),
    .rst(rst),
    .unlock_doors(unlock_doors),
    .accelerate_car(accelerate_car),
    .door_locked(door_locked)
  );
  
  // Define clock period
  parameter CLK_PERIOD = 10;
  
  // Generate clock signal
  always #CLK_PERIOD clk = ~clk;
  
  // Initialize inputs
  initial begin
    speed_limit = 80;
    car_speed = 60;
    leading_distance = 30;
    rst = 1;
    unlock_doors = 0;
    #10 rst = 0;
  end
  
  // Test case 1: Car should accelerate until it reaches the speed limit
  initial begin
    #100;
    assert(accelerate_car === 1) else $error("Test case 1 failed: Expected accelerate_car to be high");
    car_speed = 80;
    #100;
    assert(accelerate_car === 0) else $error("Test case 1 failed: Expected accelerate_car to be low");
  end
  
  // Test case 2: Car should brake when it gets too close to the vehicle in front
  initial begin
    leading_distance = 5;
    #100;
    assert(accelerate_car === 0) else $error("Test case 2 failed: Expected accelerate_car to be low");
    leading_distance = 30;
    #100;
    assert(accelerate_car === 1) else $error("Test case 2 failed: Expected accelerate_car to be high");
  end
  
  // Test case 3: Car should lock doors when it brakes
  initial begin
    leading_distance = 5;
    #100;
    assert(door_locked === 1) else $error("Test case 3 failed: Expected door_locked to be high");
    unlock_doors = 1;
    #100;
    assert(door_locked === 0) else $error("Test case 3 failed: Expected door_locked to be low");
  end
  
  // End simulation
  initial begin
    #1000;
    $finish;
  end
  
endmodule

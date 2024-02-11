module voda_user_detector_tb();
	reg x, rst, clk;
	wire y;
  wire [9:0] users_count;

  voda_user_detector v1(clk, rst, x, y, users_count);

	integer i;
	
	//clock generation
  initial begin
    clk = 0;
    forever
      #1 clk = ~clk;
  end

	//reset and initial values for inputs
  initial begin
    rst = 1;
    x = 0;
    #50
    rst = 0;
    #100;
    for (i = 0; i < 10000; i=i+1) begin
    	#2
    	x = $random;
    end
    $stop;
  end

	//Test monitor and results
  initial begin
    $monitor("rst = %b, clk = %b, x = %b, y = %b, Number of users: %d", rst, clk, x, y, users_count);
  end

endmodule
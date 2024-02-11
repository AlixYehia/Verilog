module fsm_010_detection_tb();

    // Declare signals
    reg clk;
    reg reset;
    reg x;
    wire y;
    wire [31:0] count;

    // Instantiate DUT
    fsm_010_detection dut(
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y),
        .count(count)
    );

    // Clock generator
    always #5 clk = ~clk;

    // Reset generator
    initial begin
        reset = 0;
        #10 reset = 1;
        #10 reset = 0;
    end

    // Test case 1: Detect "010" once
    initial begin
        clk = 0;
        x = 0;
        #20 x = 1;
        #20 x = 0;
        #20 x = 1;
        #20 x = 1;
        #20 x = 0;
        #20 x = 1;
        #20 x = 0;
        #20 $display("Test case 1: count = %d, y = %b", count, y);
        #20 $finish;
    end

endmodule

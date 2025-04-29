`define assert(actual, expected, outputName, inputs, description, type) \
    $write("\nTIME: "); $write($realtime); \
    if (actual == expected) \
        $display("   PASSED:   "); \
    else begin \
        $display(" ** FAILED:   "); \
        if (description) $display("TEST: %s", description); \
    end \
    $write("%s = ", outputName, type, actual); \
    $write(", EXPECTED: ", type, expected); \
    if (inputs) $display(" WITH: %s", inputs);
// End of `assert macro.

// It looks like this testbench contains a "$finish" system task.
// Be aware that some simulation programs (e.g. Modelsim) will immediately close once the "$finish" system task is executed.
// If you find that your simulation program is closing unexpectedly, try removing any "$finish" system tasks in this file.

`timescale 1 ns/ 1 ns
module testbench;
    reg CLK = 0;
    reg [2:0] D = 3'b0;
    reg Load = 0;
    wire [2:0] Q;
    three_bit_reg uut(CLK, D, Load, Q);
    always begin
        #1; CLK = ~CLK;
    end
    initial begin
        D = 3'b010;
        #2;
        Load = 1;
        #2;
         `assert(Q,3'b010,"Q","D = 3'b010, Load = 1","","%b");
        Load = 0;
        #2;
        $finish;
    end


endmodule
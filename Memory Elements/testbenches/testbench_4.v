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
   reg [3:0] D = 4'b0011;
   wire [3:0] Q;
   
   
   top UUT(CLK, D, Q);
   
   always begin 
      #5; CLK = ~CLK;
   
   end
   initial begin
      #10;
      `assert(Q, 4'b0011, "Q", "D = 0011, CLK = 1", "F not 0", "%b");
      #10;
      D = 4'b1010;
      #5;
      `assert(Q, 4'b0011, "Q", "D = 1010, CLK = 0", "F not 0", "%b");
      $finish;
   end
endmodule
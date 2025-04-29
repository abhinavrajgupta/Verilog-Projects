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
   reg E = 0;
   wire A, B, Q;
   
   top UUT(CLK, E, A, B, Q);
   
   always begin
      CLK = ~CLK; #5;
   end
   
   initial begin
      #10;
      E = 1;
      #15;
      `assert(Q, 1'b1, "Q", "Wait 10 seconds and E = 1 for 15 seconds", "F not 0", "%b");
      `assert(A, 1'b1, "A", "Wait 10 seconds and E = 1 for 15 seconds", "F not 0", "%b");
      `assert(B, 1'b0, "B", "Wait 10 seconds and E = 1 for 15 seconds", "F not 0", "%b");
      $finish;
   end
endmodule
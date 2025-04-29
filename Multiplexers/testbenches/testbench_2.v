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
   reg A = 0;
   reg B = 1;
   reg C = 0;
   reg D = 1;
   reg CTRL1;
   reg CTRL2;
   
   wire OUT;
   
   MUX4to1 UUT(A, B, C, D, CTRL1, CTRL2, OUT);
   
   initial begin
      {CTRL1, CTRL2} = 2'b01;
      #5 `assert(OUT, 1'b1, "OUT", " CTRL1 = 0, CTRL2 = 1 and A = 0, B = 1, C = 0, D = 1", "OUT not 0", "%b");
      $finish;
   end
endmodule
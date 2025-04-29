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
   reg A=0,B=0,C=0,D=0;
   wire [3:0] F;
   grey_code UUT(A, B, C, D, F);
   initial begin
      {A, B, C, D} = 4'b1110; #5;
        `assert(F[3], 1'b1, "F[3]", "A = 1, B = 1, C = 1, D = 0", "F[3] not 1", "%b");
        `assert(F[2], 1'b0, "F[2]", "A = 1, B = 1, C = 1, D = 0", "F[2] not 0", "%b");
        `assert(F[1], 1'b0, "F[1]", "A = 1, B = 1, C = 1, D = 0", "F[1] not 0", "%b");
        `assert(F[0], 1'b1, "F[0]", "A = 1, B = 1, C = 1, D = 0", "F[0] not 1", "%b");
      $finish;
   end
endmodule
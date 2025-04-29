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

module testbench;
   reg Enable, A, B, C;
   wire [7:0] F;
   
   Line_Decoder UUT(Enable, A, B, C, F);
   initial begin
      {Enable, A, B, C} = 4'b1000;
      #5 `assert(F, 8'b10000000, "F", "Enable = 1, A = 0, B = 0, C = 0", "F not 0", "%b");
      $finish;
   end
endmodule
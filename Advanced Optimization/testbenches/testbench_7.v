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
   reg [7:0] Value = 0;
   wire [7:0] SevenSegDig1, SevenSegDig2;
   Top UUT(Value, SevenSegDig1, SevenSegDig2);
   initial begin
      Value = 8'h0x52; #5;
      `assert(SevenSegDig1,8'b01101101,"SevenSegDig1","Value=0x52","SevenSegDig1 not 01100110","%b");
      `assert(SevenSegDig2,8'b01011011,"SevenSegDig2","Value=0x52","SevenSegDig2 not 01101101","%b");
      $finish;
   end
endmodule
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
    reg [5:0] A = 0, B = 0;
    reg gti = 0, lti = 0, eqi = 1;
    wire gto, lto, eqo;
    RippleCarryComparator UUT(A, B, gti, lti, eqi, gto, lto, eqo);

    initial begin
            A=28;
            B=57; #2;
            `assert(lto,1'b1,"lto","A = 28, B = 57","","%b");
            `assert(gto,1'b0,"gto","","","%b");
            `assert(eqo,1'b0,"eqo","","","%b");
        $finish;
    end
endmodule
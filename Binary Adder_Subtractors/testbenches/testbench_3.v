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

module testbench;
    reg [5:0] A = 0;
    reg [5:0] B = 0;
    reg S = 0;
    wire [5:0] ANSWER;
    Adder_Subtractor uut(A, B, S, ANSWER);
    initial begin
        A=15; B=33; #2;
        `assert(ANSWER,6'b110000,"ANSWER","A=15, B=33","ANSWER not 48","%b");
    end
endmodule
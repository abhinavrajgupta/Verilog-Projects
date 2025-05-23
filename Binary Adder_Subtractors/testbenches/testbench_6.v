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
        S=1;
        A=8; B=3; #2;
        `assert(ANSWER,6'b000101,"ANSWER","A=8, B=3","ANSWER not 5","%b");
    end
endmodule
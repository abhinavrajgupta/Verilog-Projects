// module full_adder(A, B, Cin, ANSWER, Cout);
//     input A, B, Cin;
//     output ANSWER, Cout;

// endmodule

// module Adder_Subtractor(A, B, S, ANSWER);
//     input [5:0] A, B;
//     input S;
//     output [5:0] ANSWER;


// endmodule

module full_adder(A, B, Cin, ANSWER, Cout);
    input A, B, Cin;
    output ANSWER, Cout;
    assign ANSWER = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule
module Adder_Subtractor(A, B, S, ANSWER);
    input [5:0] A, B;
    input S;
    output [5:0] ANSWER;
    wire [5:0] B_negative;
    wire [5:0] B_sub;
    wire [6:0]Cout;
    assign B_negative = S ? ~B : B;
    assign B_sub = S ? 1'b1 : 1'b0;
    full_adder FA0(A[0], B_negative[0], B_sub, ANSWER[0], Cout[0]);
    full_adder FA1(A[1], B_negative[1], Cout[0], ANSWER[1], Cout[1]);
    full_adder FA2(A[2], B_negative[2], Cout[1], ANSWER[2], Cout[2]);
    full_adder FA3(A[3], B_negative[3], Cout[2], ANSWER[3], Cout[3]);
    full_adder FA4(A[4], B_negative[4], Cout[3], ANSWER[4], Cout[4]);
    full_adder FA5(A[5], B_negative[5], Cout[4], ANSWER[5], Cout[5]);
endmodule

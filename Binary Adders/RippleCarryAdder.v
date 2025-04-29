module FullAdder(A, B,CIN,SUM,COUT);
    input A, B, CIN;
    output SUM, COUT;
    assign SUM = (~A & B & ~CIN) | (A & ~B & ~CIN) | (~A & ~B & CIN) | (A & B & CIN);
    assign COUT = (A & B) | (A & CIN)| (B & CIN);
endmodule

module RippleCarryAdder(A,B,SUM);
    input [5:0] A,B;
    input CIN;
    output[5:0] SUM;
    wire COUT[5:0];

   FullAdder FA0(A[0], B[0], 0, SUM[0], COUT[0]);
   FullAdder FA1(A[1], B[1], COUT[0], SUM[1], COUT[1]);
   FullAdder FA2(A[2], B[2], COUT[1], SUM[2], COUT[2]);
   FullAdder FA3(A[3], B[3], COUT[2], SUM[3], COUT[3]);
   FullAdder FA4(A[4], B[4], COUT[3], SUM[4], COUT[4]);
   FullAdder FA5(A[5], B[5], COUT[4], SUM[5], COUT[5]);
endmodule


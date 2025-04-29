// module comparator(A, B, git, lti, eqi, gto, lto, eqo);
//    input A, B, gti, lti, eqi;
//    output gto, lto, eqo;
   
//    //Logic
// endmodule

// module RippleCarryComparator(A, B, gti, lti, eqi, gto, lto, eqo);
//    input [5:0] A, B;
//    input gti, lti, eqi;
//    ouptut gto, lto, eqo;
   
//    //logic
// endmodule


// module RippleCarryComparator(
//    input [5:0] A,
//    input [5:0] B,
//    input gti,
//    input lti,
//    input eqi,
//    output reg gto,
//    output reg lto,
//    output reg eqo
// );
//    reg [5:0] greater, less, equal;
//    integer i;
//    always @* begin
//       greater[0] = (gti && (A[0] > B[0])) || (!gti && (A[0] >= B[0]));
//       less[0] = (lti && (A[0] < B[0])) || (!lti && (A[0] <= B[0]));
//       equal[0] = (eqi && (A[0] == B[0])) || (!eqi && (A[0] != B[0]));

//       for (i = 1; i < 6; i = i + 1) begin
//          greater[i] = (greater[i-1] && (A[i] > B[i])) || (!greater[i-1] && (A[i] >= B[i]));
//          less[i] = (less[i-1] && (A[i] < B[i])) || (!less[i-1] && (A[i] <= B[i]));
//          equal[i] = (equal[i-1] && (A[i] == B[i])) || (!equal[i-1] && (A[i] != B[i]));
//       end

//       gto = greater[5];
//       lto = less[5];
//       eqo = equal[5];
//    end
// endmodule

module RippleCarryComparator(
   input [5:0] A,
   input [5:0] B,
   input gti,
   input lti,
   input eqi,
   output reg gto,
   output reg lto,
   output reg eqo
);
   reg [5:0] greater, less, equal;
   integer i;

   always @* begin
      // Comparison for the LSB
      greater[0] = (gti && (A[0] > B[0])) || (!gti && (A[0] >= B[0]) && (A[0] != B[0]));
      less[0] = (lti && (A[0] < B[0])) || (!lti && (A[0] <= B[0]) && (A[0] != B[0]));
      equal[0] = (eqi && (A[0] == B[0])) || (!eqi && (A[0] != B[0]));

      // Comparison for the remaining bits
      for (i = 1; i < 6; i = i + 1) begin
         greater[i] = (greater[i-1] && ((A[i] > B[i]) || (A[i] == B[i]))) || ((!greater[i-1]) && (A[i] > B[i]));
         less[i] = (less[i-1] && ((A[i] < B[i]) || (A[i] == B[i]))) || ((!less[i-1]) && (A[i] < B[i]));
         equal[i] = (equal[i-1] && (A[i] == B[i]));
      end

      // Output results
      gto = greater[5];
      lto = less[5];
      eqo = equal[5];
   end
endmodule

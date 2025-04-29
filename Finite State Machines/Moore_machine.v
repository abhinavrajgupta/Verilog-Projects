// module top(CLK, E, A, B, Q);
//    input E, CLK;
//    output A, B, Q;
   
//    // Logic
// endmodule

// module top(
//     input CLK, E,
//     output reg A, B, Q
// );

// // Define your logic here
// always @(posedge CLK or negedge E) begin
//     if (!E) begin
//         A <= 1'b0;
//         B <= 1'b1;
//         Q <= 1'b0;
//     end else if (E) begin
//         A <= 1'b1;
//         B <= 1'b0;
//         Q <= 1; // Example logic (AND gate)
//     end else begin
//       A <= 1'b1;
//       B <= 1'b0;
//       Q <= 1'b1;
//     end
// end

// endmodule

module top(
    input CLK, E,
    output reg A, B, Q
);

// Define your logic here
always @(posedge CLK or negedge E) begin
    if (!E) begin
        A <= 1'b0;
        B <= 1'b1;
        Q <= 1'b0;
    end else if (E & CLK)begin
        A <= 1'b1;
        B <= 1'b1;
        Q <= A & B; // Example logic (AND gate)
    end else if (E) begin
      A <=1'b1;
      B <=1'b0;
      C <=1'b1;
    end else begin
      A <= 1'b1;
      B <= 1'b0;
      Q <= 1'b1;
    end
end
endmodule
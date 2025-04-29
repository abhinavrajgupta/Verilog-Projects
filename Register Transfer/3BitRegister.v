// module three_bit_reg(CLK, D, Load, Q);
//    input CLK;
//    input Enable;
//    input [2:0] D;
//    input Load;
//    output reg [2:0] Q = 0;
   
//    //Logic
// endmodule

// module three_bit_reg(
//    input CLK,
//    input [2:0] D,
//    input Load,
//    output reg [2:0] Q
// );

// always @(posedge CLK) begin
//    if (Load == 1'b1) begin
//       Q <= D;  
//    end
// end
// endmodule

module three_bit_reg(CLK, D, Load, Q);
   input CLK;
   input [2:0] D;
   input Load;
   output reg [2:0] Q = 0;
   
   //Logic
   always @(posedge CLK) begin
      if (Load) begin
         Q <= D;
      end else begin
         Q <= Q; 
      end
   end
endmodule





module dflipflop(
    input CLK, D,
    output reg Q = 0
);
    always @(posedge CLK)
        Q <= D;
endmodule

module top(
    input CLK,
    input [3:0] D,
    output [3:0] Q
);
    wire [3:0] q_temp;
    dflipflop flipflop0(.CLK(CLK), .D(D[0]), .Q(q_temp[0]));
    dflipflop flipflop1(.CLK(CLK), .D(D[1]), .Q(q_temp[1]));
    dflipflop flipflop2(.CLK(CLK), .D(D[2]), .Q(q_temp[2]));
    dflipflop flipflop3(.CLK(CLK), .D(D[3]), .Q(q_temp[3]));
    
    assign Q = q_temp;
endmodule

module MUX4to1(A,B,C,D,CTRL1,CTRL2,OUT);
    input A, B, C, D, CTRL1, CTRL2;
    output reg OUT;

    //Logic
always @(*) begin
    case ({CTRL2, CTRL1}) 
        2'b01: OUT = A;
        2'b10: OUT = B;
        2'b00: OUT = C;
        2'b11: OUT = D;
        default: OUT = 0; 
    endcase
end
endmodule
module Line_Decoder (
    input Enable, A, B, C,
    output reg [7:0] F
);

always @(*) begin
    if (Enable) begin
        case ({A, B, C})
            3'b000: F = 8'b10000000;
            3'b001: F = 8'b01000000;
            3'b010: F = 8'b00100000;
            3'b011: F = 8'b00010000;
            3'b100: F = 8'b00001000;
            3'b101: F = 8'b00000100;
            3'b110: F = 8'b00000010;
            3'b111: F = 8'b00000001;
            default: F = 8'b00000000;
        endcase
    end else begin
        F = 8'b00000000;
    end
end
endmodule

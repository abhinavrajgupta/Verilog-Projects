// module SevenSegDriver();


// endmodule

// module Top(Value,SevenSegDig1,SevenSegDig2);
//     //Port Declarations    

//     //Logic
//     SevenSegDriver Unit0();
//     SevenSegDriver Unit1();
// endmodule

// module SevenSegDriver(
//     input [3:0] Value,
//     output reg [6:0] SevenSeg,
//     output reg DP
// );

// always @* begin
//     case(Value[3:0])
//         4'b0000: SevenSeg = 8'b00111111; // Display 0
//         4'b0001: SevenSeg = 8'b01111101; // Display 1
//         4'b0010: SevenSeg = 8'b01001111; // Display 2
//         4'b0011: SevenSeg = 8'b01110111; // Display 3
//         4'b0100: SevenSeg = 8'b01011110; // Display 4
//         4'b0101: SevenSeg = 8'b01101101; // Display 5
//         4'b0110: SevenSeg = 8'b01011011; // Display 6
//         4'b0111: SevenSeg = 8'b01110001; // Display 7
//         4'b1000: SevenSeg = 8'b00111001; // Display 8
//         4'b1001: SevenSeg = 8'b01100110; // Display 9
//         4'b1010: SevenSeg = 8'b00000110; // Display A
//         4'b1011: SevenSeg = 8'b01001111; // Display B
//         4'b1100: SevenSeg = 8'b01111101; // Display C
//         4'b1101: SevenSeg = 8'b01011011; // Display D
//         4'b1110: SevenSeg = 8'b01110111; // Display E
//         4'b1111: SevenSeg = 8'b01101101; // Display F
//         default: SevenSeg = 8'b11111111; // Turn off all segments if Value is invalid
//     endcase
// end

// endmodule

// module Top(
//     input [7:0] Value,
//     output wire [7:0] SevenSegDig1,
//     output wire [7:0] SevenSegDig2
// );

//     SevenSegDriver Unit0(.Value({4'b0000, Value[3:0]}), .SevenSeg(SevenSegDig2));
//     SevenSegDriver Unit1(.Value({4'b0000, Value[7:4]}), .SevenSeg(SevenSegDig1));


// endmodule

module SevenSegDriver (
    input [7:0] Value,
    output reg [6:0] SevenSegDig
);

always @* begin
    case(Value)
        8'h00: SevenSegDig = 7'b0111111; // Display 0
        8'h01: SevenSegDig = 7'b0000110; // Display 1
        8'h02: SevenSegDig = 7'b1011011; // Display 2
        8'h03: SevenSegDig = 7'b1001111; // Display 3
        8'h04: SevenSegDig = 7'b1100110; // Display 4
        8'h05: SevenSegDig = 7'b1101101; // Display 5
        8'h06: SevenSegDig = 7'b1111101; // Display 6
        8'h07: SevenSegDig = 7'b0000111; // Display 7
        8'h08: SevenSegDig = 7'b1111111; // Display 8
        8'h09: SevenSegDig = 7'b1101111; // Display 9
        8'h0A: SevenSegDig = 7'b1110111; // Display A
        8'h0B: SevenSegDig = 7'b1111100; // Display B
        8'h0C: SevenSegDig = 7'b0111001; // Display C
        8'h0D: SevenSegDig = 7'b1011110; // Display D
        8'h0E: SevenSegDig = 7'b1111001; // Display E
        8'h0F: SevenSegDig = 7'b1110001; // Display F
        default: SevenSegDig = 7'b1111111; // Default value (display all segments)
    endcase
end

endmodule


module Top (
    input [7:0] Value,
    output [6:0] SevenSegDig1,
    output [6:0] SevenSegDig2
);

wire [3:0] Value1 = Value[7:4];
wire [3:0] Value2 = Value[3:0];

SevenSegDriver Unit0(.Value(Value1), .SevenSegDig(SevenSegDig1));
SevenSegDriver Unit1(.Value(Value2), .SevenSegDig(SevenSegDig2));

endmodule
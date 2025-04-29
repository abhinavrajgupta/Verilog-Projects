module tflipflop(
    input CLK, 
    input T,   
    input RST, 
    output reg Q 
);
    always @(posedge CLK or posedge RST) begin
        if (RST)       
            Q <= 4'b0000; 
        else if (T)   
            Q <= Q + 1;
    end
endmodule

module top(
    input CLK, 
    input RST, 
    output reg [3:0] Q 
);
    reg [3:0] t_inputs; 
    always @* begin
        t_inputs[0] = Q[0] & Q[1] & Q[2] & ~Q[3];
        t_inputs[1] = Q[3];
        t_inputs[2] = Q[3];
        t_inputs[3] = Q[3];
    end

    always @(posedge CLK or posedge RST) begin
        if (RST)       
            Q <= 4'b0000; 
        else if (CLK)  
            Q <= Q + 1;
    end
endmodule

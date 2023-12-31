module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
   
    digit ones( .clk(clk), .reset(reset), .enable(1), .q(q[3:0]));
    digit tens( .clk(clk), .reset(reset), .enable(ena[1]), .q(q[7:4]));
    digit huns( .clk(clk), .reset(reset), .enable(ena[2]), .q(q[11:8]));
    digit thou( .clk(clk), .reset(reset), .enable(ena[3]), .q(q[15:12]));
    
    assign ena[3] = q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9;
    assign ena[2] = q[7:4] == 4'd9 && q[3:0] == 4'd9;
    assign ena[1] = q[3:0] == 4'd9;

endmodule

module digit(
    input clk,
    input reset,        // Synchronous active-high reset
    input enable,
    output [3:0] q);
    
    always@(posedge clk) begin
        if (reset)
            q[3:0] <= 0;
        else if (enable) begin
            if (q == 4'd9)
                q <= 0;
            else
                q[3:0] <= q[3:0] + 1'b1;
        end
        end
endmodule

// Question . 32-bit LFSR/lfsr32 - https://hdlbits.01xz.net/wiki/Lfsr32

module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    wire x4, x3, x2, x1;
    
    assign x4= q[1]^q[0];
    assign x3= q[2]^q[0];
    assign x2= q[22]^q[0];
    assign x1= 1'b0^q[0];
    
    always@(posedge clk) begin
        if (reset)
            q <= 32'h1;
        else begin
            q[31] <= x1;
            q[30:22] <= q[31:23];
            q[21] <= x2;
            q[20:2] <= q[21:3];
            q[1] <= x3;
            q[0] <= x4;
        end
    end

endmodule

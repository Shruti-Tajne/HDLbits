// Question . Count 1 to 10 - https://hdlbits.01xz.net/wiki/Count1to10

module top_module (
    input clk,
    input reset,
    output [3:0] q);
    
    always@(posedge clk) begin
        if (reset || q==4'd10)
            q <= 1;
        else 
            q <= q + 1;
    end

endmodule

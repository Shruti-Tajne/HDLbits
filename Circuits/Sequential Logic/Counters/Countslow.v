//Question . Countslow - https://hdlbits.01xz.net/wiki/Countslow

module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    always@(posedge clk) begin
        if (reset)
            q <= 0;
        else begin
            if (q==4'd9 && slowena==1) 
                q <= 0;
            else if (slowena==0 && q==4'd9)
                q <= q;
            else if (slowena)
                q <= q + 1;
            else 
                q <= q;
        end
    end

endmodule

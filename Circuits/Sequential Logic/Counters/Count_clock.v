//Question . 12 hour clock/ Count clock - https://hdlbits.01xz.net/wiki/Count_clock

module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    bcd second1 (clk, reset, ena, ss[3:0]);
    bcd #(5) second2 (clk, reset, (ena && ss[3:0]==9), ss[7:4]);
    bcd min1 (clk, reset, (ena && ss[3:0]==9 && ss[7:4]==5), mm[3:0]);
    bcd #(5) min2 (clk, reset, (ena && ss[3:0]==9 && ss[7:4]==5 && mm[3:0]==9), mm[7:4]);
    
    always@(posedge clk) begin
        if (reset) begin
            pm <= 1'b0;
            hh[7:4] <= 4'd1;
            hh[3:0] <= 4'd2;
        end
        else begin
            if (ena) begin
                if (mm[7:4]==5 && mm[3:0]==9 && ss[7:4]==5 && ss[3:0]==9) begin
                    hh[3:0] <= hh[3:0] + 1'b1;
                    if (hh[3:0]==9) begin
                    	hh[3:0] <= 0;
                    	hh[7:4] <= hh[7:4] + 1'b1;
                	end
                    else if (hh[7:4]==1 && hh[3:0]==2) begin
                    	hh[7:4] <= 4'd0;
                    	hh[3:0] <= 4'd1;
                	end
                    else if (hh[7:4]==1 && hh[3:0]==1) begin
                    	pm <= ~pm;
                	end
                end
            end
        end
    end

endmodule

module bcd #(parameter OVERFLOW = 9)(
    input clk,
    input reset,
    input ena,
    output [$clog2(OVERFLOW)-1:0] digit
);
    always@(posedge clk) begin
        if (reset)
            digit <= 0;
        else begin
            if (ena) begin
                if (digit==OVERFLOW)
                    digit <= 0;
            	else
             		digit <= digit + 1'b1;
            end
          	else
                digit <= digit;
        end
    end
endmodule

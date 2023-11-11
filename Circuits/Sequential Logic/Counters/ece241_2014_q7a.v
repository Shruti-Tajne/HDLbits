//Question . Counter 1-12/ ece241_2014_q7a - https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q7a

module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //

    count4 the_counter (.clk(clk), .enable(c_enable), .load(c_load), .d(c_d) , .Q(Q));
    
    assign c_enable = enable;
    
    always@(*) begin
        if (reset) begin
            c_load = 1;
            c_d = 1;
        end
        else begin
            c_load = 0;
            c_d = 0;
            if (enable && Q==4'd12) begin
            	c_load = 1;
                c_d = 1;
            end
        end
    end
    

endmodule

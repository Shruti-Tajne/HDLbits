// Question . Counter 1000/ exe241 2014 q7b - https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q7b

module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //

    bcdcount counter0 (clk, reset, c_enable[0], second);
    bcdcount counter1 (clk, reset, c_enable[1], minute);
    bcdcount counter2 (clk, reset, c_enable[2], hour);
    
    wire [3:0] second, minute, hour;
    
    assign OneHertz = (second==4'd9) && (minute==4'd9) && (hour==4'd9);
    assign c_enable[0] = 1'b1;
    assign c_enable[1] = (second==4'd9) ? 1'b1:1'b0;
    assign c_enable[2] = (second==4'd9 && minute==4'd9) ? 1'b1:1'b0;

endmodule

// Question . 2-to-1 multiplexer/ Mux2to1 - https://hdlbits.01xz.net/wiki/Mux2to1

module top_module( 
    input a, b, sel,
    output out ); 

    assign out = sel ? b:a;
endmodule

// Question 10. 7485 chip - https://hdlbits.01xz.net/wiki/7458

module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    wire and31;
    wire and32;
    wire and21;
    wire and22;

    assign and31 = (p1a&p1c&p1b);
    assign and32 = (p1f&p1e&p1d);
	assign and21 = (p2a&p2b);
    assign and22 = (p2c&p2d);
    assign p1y = and31 | and32;
    assign p2y = and21 | and22;


endmodule

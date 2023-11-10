// Question 8. Xnorgate - https://hdlbits.01xz.net/wiki/Xnorgate

module top_module( 
    input a, 
    input b, 
    output out );
  
    assign out = ~(a^b);
  
endmodule

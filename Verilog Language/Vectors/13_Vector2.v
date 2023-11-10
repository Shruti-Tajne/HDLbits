// Question 13. Vector part select/Vector2 - https://hdlbits.01xz.net/wiki/Vector2

//Keep it simple!! :D

module top_module (
	input [31:0] in,
	output [31:0] out
);

	assign out[31:24] = in[ 7: 0];	
	assign out[23:16] = in[15: 8];	
	assign out[15: 8] = in[23:16];	
	assign out[ 7: 0] = in[31:24];	
	
endmodule

// --------------------SOLUTION 2----------------------------------
// No need to overcomplicate, this is what I did first

module top_module( 
    input [31:0] in,
    output [31:0] out );//

    // assign out[31:24] = ...;
    localparam BYTE_SIZE = 8;
    
    localparam NUM_BYTES = $size(in)/BYTE_SIZE;
    
    genvar i;
    generate
        for (i=1;i<=NUM_BYTES;i++) begin: endian_switch
            assign out[i*BYTE_SIZE-1 -:BYTE_SIZE] = in[(NUM_BYTES-i+1)*BYTE_SIZE-1 -:BYTE_SIZE];
        end
    endgenerate

endmodule

// Question 5. Not Gate/ Inverter - https://hdlbits.01xz.net/wiki/Notgate

module top_module(
	input in,
	output out
);
	
	assign out = ~in;
	
endmodule

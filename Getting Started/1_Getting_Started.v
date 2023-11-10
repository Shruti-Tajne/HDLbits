// Question 1. Step One - https://hdlbits.01xz.net/wiki/Step_one

module top_module( output one );

//"one" is the name we gave to a "literal wire" and connected it to VDD so it will always remain high
	assign one = 1'b1;
	
endmodule

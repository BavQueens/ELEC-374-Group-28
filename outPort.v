module outPort(
	input wire clear, clock, outPortIn,
	output wire [31:0] q
);

	wire [31:0] d;

	register outPortreg(clock, clear, outPortIn, d, q);

endmodule
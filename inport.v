module inPort(
	input wire clear, clock,
	output wire [31:0] busMuxInOut
);

	wire [31:0] d;

	register outPortreg(clock, clear, outPortIn, d, busMuxInOut);

endmodule
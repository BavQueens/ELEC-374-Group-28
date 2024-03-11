module mar(
	input wire clear, clock, MARin, read,
	output wire [31:0] out
);

	wire [31:0] d;

	register MARreg(clock, clear, MARin, d, out);

endmodule
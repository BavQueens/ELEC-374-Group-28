module mar(
	input wire clock,clear, MARin, read,
	output wire [31:0] out
);

	wire [31:0] d;

	register MARreg(clock, clear, MARin, d, out);

endmodule
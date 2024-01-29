module mdr(
	input wire clear, clock, MDRin, read,
	input wire [31:0] BusMuxOut, MDataIn,
	output wire [31:0] out
);

	wire [31:0] d;

	mux_MDR muxMdr(BusMuxOut, MDataIn, read, d);

	reg_32_bit MDRreg(clock, clear, MDRin, d, out);

endmodule
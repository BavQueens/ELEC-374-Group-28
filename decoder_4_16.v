module decoder_4_16(
input [3:0] in,
output [15:0] out
);

	wire [15:0] temp = 1;
	assign out = temp << in;

endmodule
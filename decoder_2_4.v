module decoder_2_4 (
input [1:0] in,
output [3:0] out
);

	wire [3:0] temp = 1;
	assign out = temp << in;

endmodule
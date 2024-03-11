module CON_FF (
input [31:0] bus_in,
input [1:0] ir_field,
input CON_in,
output q
);

wire [3:0] decoder_out;
reg d;

decoder_2_4 decoder(ir_field, decoder_out);

always @(bus_in, ir_field, decoder_out) 
	begin
	case (decoder_out)
		4'b0001: d = !bus_in;
		4'b0010: d = !(!bus_in);
		4'b0100: d = !bus_in[31];
		4'b1000: d = bus_in[31];
		default: d = 1'b0;
	endcase
end

d_flip_flop CON(d, CON_in, q);

endmodule

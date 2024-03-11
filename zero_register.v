module zero_register(
	input wire clock, 
	input wire clear,
	input wire enable,
	input wire BAout,
	input wire [31:0] d,
	output wire [31:0] bus_out
);

wire [31:0] q;
register register0(clock, clear, enable, d, q);

assign bus_out = BAout ? 0 : q;

endmodule
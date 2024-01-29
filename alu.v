module alu(
	input wire [31:0] Y,
	input wire [31:0] B,

	input wire [4:0] operation,

	output reg [63:0] C 
);


wire [31:0] add_out;
wire [31:0] sub_out;
wire [31:0] and_out;
wire [31:0] or_out;
wire [31:0] shr_out;
wire [31:0] shra_out;
wire [31:0] shl_out;
wire [31:0] ror_out;
wire [31:0] rol_out;
wire [63:0] mul_out;
wire [63:0] div_out;
wire [31:0] neg_out;
wire [31:0] not_out;


always @(*)
	begin
		case (operation)
		
			5'b00011: begin //addition
				C[31:0] <= add_out[31:0];
				C[63:32] <= 32'd0;
				end
			5'b00100: begin //subtraction
				C[31:0] <= sub_out[31:0];
				C[63:32] <= 32'd0;
				end
			5'b00101: begin // mul
				C[63:0] <= mul_out[63:0];
				end
			5'b00110: begin // div
				C[63:0] <= div_out[63:0];
				end
			5'b00111: begin // neg
				C[31:0] <= neg_out[31:0];
				C[63:32] <= 32'd0;
				end
			5'b01000: begin //not
				C[31:0] <= not_out[31:0];
				C[63:32] <= 32'd0;
				end
			5'b01001: begin //rol 
				C[31:0] <= rol_out[31:0];
				C[63:32] <= 32'd0;
				end
			5'b01010: begin //ror 
				C[31:0] <= ror_out[31:0];
				C[63:32] <= 32'd0;
				end
			5'b01011: begin //or
				C[31:0] <= or_out[31:0];
				C[63:32] <= 32'd0;
				end
			5'b01111: begin //and 
				C[31:0] <= and_out[31:0];
				C[63:32] <= 32'd0;
				end
			5'b10000:  begin //shl 
				C[31:0] <= shl_out[31:0];
				C[63:32] <= 32'd0;
				end
			5'b10001: begin //shr
				C[31:0] <= shr_out[31:0];
				C[63:32] <= 32'd0;
				end
			5'b10010: begin //shra
				C[31:0] <= shra_out[31:0];
				C[63:32] <= 32'd0;
				end
			default: begin
				C[63:0] <= 32'd0;
			end
//...			

		endcase
end

adder adds(Y, B, add_out, 1'b0);
adder subs(Y, B, sub_out, 1'b1);
And_32_bit ands(Y, B, and_out);
Or_32_bit ors(Y, B, or_out);
shiftRight shr(Y, B, shr_out);
shiftLeft shl(Y, B, shl_out);
shiftRightArithmetic shra(Y, B, shra_out);
rotateRight ror(Y, B, ror_out);
rotateLeft rol(Y, B, rol_out);
multiplier mul(Y, B, mul_out);
divider div(Y, B, div_out);
Negate neg(B, neg_out);
Not_32_bit nots(B, not_out);
//...

endmodule

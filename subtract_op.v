`timescale 1ns/10ps
module subtract_op(A, B, C);
input [31:0] A, B;
output wire [31:0] C;
reg [31:0] temp;
always@(A or B)
	begin
	temp <= !B + 1;
	end
Adder add(A, temp, C);

endmodule
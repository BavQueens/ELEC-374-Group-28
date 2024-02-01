`timescale 1ns/10ps
module Or(A, B, C);
input [31:0] A, B;
output reg [31:0] C;

always@(A or B)
	begin

	C = A || B; // or operation
	
	end
endmodule
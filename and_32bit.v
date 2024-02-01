`timescale 1ns/10ps
module and_32bit(A, B, C);
input [31:0] A, B;
output reg [31:0] C;
always@(A or B)
	begin

	C = A && B; //and operation
	

	end
endmodule
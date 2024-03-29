`timescale 1ns/10ps
module rotateRight(A, B, C);
input [31:0] A, B;
output reg [31:0] C;
always@(A or B)
	begin
	C =  (A >> B[3:0])|(A << 32-B[3:0]);
	end
endmodule
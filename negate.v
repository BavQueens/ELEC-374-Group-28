`timescale 1ns/10ps
module Negate(A, B);
input [31:0] A;
output reg [31:0] B;

always@(A)
	begin
	
	B = ( ~A ) + 1'b1; // neg operation
	
	end
endmodule
`timescale 1ns/10ps
module Not_32_bit(A, B);
input [31:0] A;
output reg [31:0] B;

always@(A)
	begin
	B = !A; //not operation
	
	end
endmodule
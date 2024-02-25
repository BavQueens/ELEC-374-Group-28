`timescale 1ns/10ps
module shiftRightArithmetic(A, B, C);
input [31:0] A, B;
output reg [31:0] C;
always@(A or B)
	begin
	
	C = A >>> B; //Lock signed bit, shift the rest.
		//assign C = A >>> B; remove end 
	end
endmodule

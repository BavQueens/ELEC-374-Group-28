`timescale 1ns/10ps
module And(A, B, C);
input [31:0] A, B;
output reg [31:0] C;
input wire select;
always@(A or B)
	begin
	if (select == 1) begin
		C = A && B; //and operation
	else begin 
		if (select == 2)
		C = A || B; // or operation
	end	

	end
endmodule
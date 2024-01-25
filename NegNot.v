`timescale 1ns/10ps
module Negate(A, B);
input [31:0] A;
output reg [31:0] B;
input wire select;
always@(A)
	begin
	if (select == 1) begin
		B = !A; //not operation
	else begin 
		if (select == 2)
		B = ( ~A ) + 1'b1; // neg operation
	end
	
	end
endmodule
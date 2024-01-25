`timescale 1ns/10ps
module shiftRight(A, B, C);
input [31:0] A, B;
output reg [31:0] C;
input wire select;
integer i; 

always@(A or B)
	begin
	if (select ==1) begin
		C = A >> B; //shift right
	else begin 
		if (select == 2)
		C = A >>> B; //Lock signed bit, shift the rest. Shift right arithmatic
	else begin 
		if (select == 3)
		C = A << B; // Shift left
	else begin 
		if (select == 4)
			for (int i =0; i<32; i = i+1) begin
				C =(A << i) | (A >>(32-i));
		end
	else begin 
		if (select == 5)
			for (int i =0; i<32; i = i+1) begin
				C =(A >> i) | (A <<(32-i));
		end
	end
	end
endmodule
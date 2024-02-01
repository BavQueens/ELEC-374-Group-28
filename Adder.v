`timescale 1ns/10ps
module adder(A, B, C);
input [31:0] A, B;
output reg [31:0] C;
reg [32:0] localCarry;
reg [31:0] temp;
integer i;
always@(A or B)
	begin
	
	temp = B;

	
	localCarry = 33'd0;
	for(i=0; i<32; i = i +1)
	begin //addition
		C[i] = A[i]^temp[i]^localCarry[i]; 
		localCarry[i+1] = (A[i]&temp[i])|(localCarry[i]&(A[i]|temp[i]));
	end
	end
endmodule
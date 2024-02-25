`timescale 1ns/10ps
module rotateLeft(A, B, C);
input [31:0] A, B;
output reg [31:0] C;
always@(A or B)
	begin
	//Case statement arranges bits 1 of 32 ways
	case(B%32)
		31 : C = {A[0], A[31:1]};
		30 : C = {A[1:0], A[31:2]};
		29 : C = {A[2:0], A[31:3]};
		28 : C = {A[3:0], A[31:4]};
		27 : C = {A[4:0], A[31:5]};
		26 : C = {A[5:0], A[31:6]};
		25 : C = {A[6:0], A[31:7]};
		24 : C = {A[7:0], A[31:8]};
		23 : C = {A[8:0], A[31:9]};
		22 : C = {A[9:0], A[31:10]};
		21 : C = {A[10:0], A[31:11]};
		20 : C = {A[11:0], A[31:12]};
		19 : C = {A[12:0], A[31:13]};
		18 : C = {A[13:0], A[31:14]};
		17 : C = {A[14:0], A[31:15]};
		16 : C = {A[15:0], A[31:16]};
		15 : C = {A[16:0], A[31:17]};
		14 : C = {A[17:0], A[31:18]};
		13 : C = {A[18:0], A[31:19]};
		12 : C = {A[19:0], A[31:20]};
		11 : C = {A[20:0], A[31:21]};
		10 : C = {A[21:0], A[31:22]};
		9 : C = {A[22:0], A[31:23]};
		8 : C = {A[23:0], A[31:24]};
		7 : C = {A[24:0], A[31:25]};
		6 : C = {A[25:0], A[31:26]};
		5 : C = {A[26:0], A[31:27]};
		4 : C = {A[27:0], A[31:28]};
		3 : C = {A[28:0], A[31:29]};
		2 : C = {A[29:0], A[31:30]};
		1 : C = {A[30:0], A[31]};
		default : C = A;
		endcase
	end
	// try assign C = (A << B[3:0]) | (A >> 32-B[3:0]);
endmodule

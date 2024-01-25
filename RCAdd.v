`timescale 1ns/10ps
module adder(A, B, C, select);
input [31:0] A, B;
input wire select; //select add or subtract
output reg [31:0] C;
reg [32:0] localCarry;
reg [31:0] temp;
integer i;
always@(A or B or select)
	begin
	/*if (select == 1) begin
		temp = ~B + 1'b1; //2's compliment
	end else begin
		temp = B;
	end*/
	
		localCarry = 33'd0;
		for(i=0; i<32; i = i +1)
		begin
			C[i] = A[i]^temp[i]^localCarry[i];
			localCarry[i+1] = (A[i]&temp[i])|(localCarry[i]&(A[i]|temp[i]));
		end
	end
endmodule
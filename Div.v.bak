`timescale 1ns/10ps
module divider(A, B, C);
input [31:0] A, B; //A is Dividend, B is Divisor M
output reg [63:0] C;
reg [31:0] temp;
integer i;
always@(A or B)
	begin
	C = {32'b0, A};
	
		for (i=0;i<32;i=i+1) begin //for 32 bits,
			C = C << 1;
			temp = C[63:32];
			C[63:32] = C[63:32] - B;
			
			if (C[63] == 1) begin // if negative,
				C[0] = 0;
				C[63:32] = temp;
			end else begin
				C[0] = 1;
			end
		end
		
		//remainder is in C[63:32]
	end
endmodule
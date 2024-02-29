`timescale 1ns/10ps
module divider(A, B, C);
    input [31:0] A, B; // A is Dividend, B is Divisor
    output reg [63:0] C; // Upper 32 for remainder, lower 32 for quotient
    reg [31:0] temp;
    reg signed [31:0] A_signed, B_signed;
    reg A_neg, B_neg;
    integer i;

    always@(A or B) begin
        
        A_neg = A[31]; 
        B_neg = B[31]; 
        A_signed = A_neg ? -A : A; 
        B_signed = B_neg ? -B : B; 

        
        C = {32'b0, A_signed};

        for (i = 0; i < 32; i = i + 1) begin
            C = C << 1; 
            temp = C[63:32] - B_signed; 
            if (temp[31] == 1) begin 
                C[0] = 0; 
            end else begin
                C[63:32] = temp; 
                C[0] = 1; 
            end
        end

        if (A_neg ^ B_neg) begin
            C[31:0] = -C[31:0]; 
        end

        
        if (A_neg) begin
            C[63:32] = -C[63:32]; 
        end
		  
		  
    end
endmodule
module pc_32_bit #(parameter qInitial = 32'b0)(
	input wire clock, 
	input wire clear,
	input wire IncPC,
	input wire enable,
	input wire [31:0] d,
	output reg [31:0] q
);
		
	
	initial q = qInitial;
	always@(clock) 
	begin
		if (clear) begin
			q[31:0] = 32'b0;
		end
		else if (enable) begin
			q[31:0] = d[31:0];
		end
		else if (IncPC) begin
			q[31:0] = q[31:0] + 1'b1;
		end 

	end
endmodule
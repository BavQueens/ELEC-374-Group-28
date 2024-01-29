module mux_MDR(
// 2-1 multiplexer for the MDR unit
	input wire [31:0] busMuxOut, // standard bus out
	input wire [31:0] mDataIn, // Data from memory
	
	input wire read,
	output reg [31:0] out // output to standard 32-bit register mdr
);

always@(*)begin
		if (read==0) 
			out[31:0] <= busMuxOut[31:0];
		
		else if (read==1)
			out[31:0] <= mDataIn[31:0];
	end

endmodule
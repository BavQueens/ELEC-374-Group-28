
module mux_32_1 (
	//Input data from register outputs
	input wire [31:0] busMuxIn_0R, busMuxIn_1R, busMuxIn_2R, busMuxIn_3R, 
		busMuxIn_4R, busMuxIn_5R, busMuxIn_6R, busMuxIn_7R, busMuxIn_8R, 
		busMuxIn_9R, busMuxIn_10R, busMuxIn_11R, busMuxIn_12R, busMuxIn_13R, 
		busMuxIn_14R, busMuxIn_15R, busMuxIn_HI, busMuxIn_LO, busMuxIn_ZHI, 
		busMuxIn_ZLO, busMuxIn_PC, busMuxIn_MDR, busMuxIn_InPort, busMuxIn_C,
	//Read from encoder output
	input wire [4:0] read,
	output reg [31:0] out
);

always@(*)begin
		case(read)
		0	:	out <= busMuxIn_0R [31:0];
		1	:	out <= busMuxIn_1R[31:0];
		2	:	out <= busMuxIn_2R[31:0];
		3	:	out <= busMuxIn_3R[31:0];
		4	:	out <= busMuxIn_4R[31:0];
		5	:	out <= busMuxIn_5R[31:0];
		6	:	out <= busMuxIn_6R[31:0];
		7	:	out <= busMuxIn_7R[31:0];
		8	:	out <= busMuxIn_8R[31:0];
		9	:	out <= busMuxIn_9R[31:0];
		10	:	out <= busMuxIn_10R[31:0];
		11	:	out <= busMuxIn_11R[31:0];
		12	:	out <= busMuxIn_12R[31:0];
		13	:	out <= busMuxIn_13R[31:0];
		14	:	out <= busMuxIn_14R[31:0];
		15	:	out <= busMuxIn_15R[31:0];
		16	:	out <= busMuxIn_HI[31:0];
		17	:	out <= busMuxIn_LO[31:0];
		18	:	out <= busMuxIn_ZHI[31:0];
		19	:	out <= busMuxIn_ZLO[31:0];
		20	:	out <= busMuxIn_PC[31:0];
		21	:	out <= busMuxIn_MDR[31:0];
		22	:	out <= busMuxIn_InPort[31:0];
		23	:	out <= busMuxIn_C[31:0];
		default	: out <= 32'b0;
		endcase
	end
endmodule
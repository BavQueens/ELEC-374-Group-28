module bus(

input wire clock, clear,

input wire R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in,
	R10in, R11in, R12in, R13in, R14in, R15in, HIin, LOin, Zhighin, Zlowin,
	PCin, MDRin, OutPortin, Cin, MARin, IRin, Yin, Zin, //register enables
	
input wire R0out, R1out, R2out, R3out, 
	R4out, R5out, R6out, R7out, R8out, 
	R9out, R10out, R11out, R12out, R13out, 
	R14out, R15out, HIout, LOout, ZHIout, 
	ZLOout, PCout, MDRout, Inportout, Cout, //encoder inputs
	
input IncPC, read, operation,
	
	
input wire [31:0] Mdatain

);

wire [31:0] busMuxIn_0R, busMuxIn_1R, busMuxIn_2R, busMuxIn_3R, 
		busMuxIn_4R, busMuxIn_5R, busMuxIn_6R, busMuxIn_7R, busMuxIn_8R, 
		busMuxIn_9R, busMuxIn_10R, busMuxIn_11R, busMuxIn_12R, busMuxIn_13R, 
		busMuxIn_14R, busMuxIn_15R, busMuxIn_HI, busMuxIn_LO, busMuxIn_ZHI, 
		busMuxIn_ZLO, busMuxIn_PC, busMuxIn_MDR, busMuxIn_InPort, busMuxIn_C, Y_data_out;
	
	wire [31:0] MuxOut;
	
	wire [63:0] z_data_out;
	wire [31:0] MDR_mux_out;
	
	wire [31:0] encodein;

	wire [4:0] encodeOut;

mux_32_1 mux (busMuxIn_0R, busMuxIn_1R, busMuxIn_2R, busMuxIn_3R, busMuxIn_4R,
		busMuxIn_5R, busMuxIn_6R, busMuxIn_7R, busMuxIn_8R, 
		busMuxIn_9R, busMuxIn_10R, busMuxIn_11R, busMuxIn_12R, busMuxIn_13R, 
		busMuxIn_14R, busMuxIn_15R, busMuxIn_HI, busMuxIn_LO, busMuxIn_ZHI, 
		busMuxIn_ZLO, busMuxIn_PC, busMuxIn_MDR, busMuxIn_InPort, busMuxIn_C, 
		encodeOut, Muxout);
		

encoder encoder_32bit(R0out, R1out, R2out, R3out, 
	R4out, R5out, R6out, R7out, R8out, 
	R9out, R10out, R11out, R12out, R13out, 
	R14out, R15out, HIout, LOout, ZHIout, 
	ZLOout, PCout, MDRout, Inportout, Cout, encodeOut);
	
	
	register register0 (clock, clear, R0in, Muxout, busMuxIn_0R);
	register register1 (clock, clear, R1in, Muxout, busMuxIn_1R);
	register register2 (clock, clear, R2in, Muxout, busMuxIn_2R);
	register register3 (clock, clear, R3in, Muxout, busMuxIn_3R);
	register register4 (clock, clear, R4in, Muxout, busMuxIn_4R);
	register register5 (clock, clear, R5in, Muxout, busMuxIn_5R);
	register register6 (clock, clear, R6in, Muxout, busMuxIn_6R);
	register register7 (clock, clear, R7in, Muxout, busMuxIn_7R);
	register register8 (clock, clear, R8in, Muxout, busMuxIn_8R);
	register register9 (clock, clear, R9in, Muxout, busMuxIn_9R);
	register register10 (clock, clear, R10in, Muxout, busMuxIn_10R);
	register register11 (clock, clear, R11in, Muxout, busMuxIn_11R);
	register register12 (clock, clear, R12in, Muxout, busMuxIn_12R);
	register register13 (clock, clear, R13in, Muxout, busMuxIn_13R);
	register register14 (clock, clear, R14in, Muxout, busMuxIn_14R);
	register register15 (clock, clear, R15in, Muxout, busMuxIn_15R);
	register registerHI (clock, clear, HIin, Muxout, busMuxIn_HI);
	register registerLO (clock, clear, LOin, Muxout, busMuxIn_LO);
	register registerZHI (clock, clear, Zhighin, z_data_out[63:32], busMuxIn_ZHI);
	register registerZLO (clock, clear, Zlowin, z_data_out[31:0], busMuxIn_ZLO);
	register registerPC (clock, clear, PCin, Muxout, busMuxIn_PC);
	register registerMDR (clock, clear, MDRin, MDR_mux_out, busMuxIn_MDR);
	register registerInPort (clock, clear, OutPortin, Muxout, busMuxIn_InPort);
	register registerC (clock, clear, Cin, Muxout, busMuxIn_C);
	
	//alu alu32bit(IncPC, read, operation, z_data_out);

endmodule
module select_encode (
	input [31:0] ir_out,
	input Gra, Grb, Grc,
	input Rin, Rout, BAout,
	
	output wire R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in,
	R10in, R11in, R12in, R13in, R14in, R15in,
	output wire R0out, R1out, R2out, R3out,R4out, R5out, R6out, R7out, R8out,R9out, R10out, R11out, R12out, R13out, 
	R14out, R15out,
	
	
	
	output [4:0] opcode, 
	
	output [31:0] cSign


);

	wire [3:0] Ra, Rb, Rc;
	
	wire [3:0] decoder_input;
	
	wire [15:0] decoder_output;
	

	assign Ra = ir_out[26:23];
	assign Rb = ir_out[22:19];
	assign Rc = ir_out[18:15];
	
	
	assign decoder_input = Gra ? Ra:
								  Grb ? Rb:
								  Grc ? Rc:
								  4'b0000;
								  
	assign cSign = {{13{ir_out[18]}},ir_out[18:0]};
	
	decoder_4_16 decoder(decoder_input, decoder_output);
	
	assign opcode = ir_out[31:27];
	
		//assign all_in = Rin ? decoder_output: 16'b0;
		//assign all_out = (Rout|BAout) ? decoder_output: 16'b0;
		assign {R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in,
		R10in, R11in, R12in, R13in, R14in, R15in} = Rin ? decoder_output: 16'b0;
		assign {R0out, R1out, R2out, R3out,R4out, R5out, R6out, R7out, R8out,R9out,
		R10out, R11out, R12out, R13out,R14out, R15out} =(Rout|BAout) ? decoder_output: 16'b0;
	
		
endmodule
	
	
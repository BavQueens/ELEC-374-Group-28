/*module select_encode (
	input [31:0] ir_out,
	input Gra, Grb, Grc,
	input Rin, Rout, BAout,
	
	output wire R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in,
	R10in, R11in, R12in, R13in, R14in, R15in,
	output wire R0out, R1out, R2out, R3out,R4out, R5out, R6out, R7out, R8out,R9out, R10out, R11out, R12out, R13out, 
	R14out, R15out,
	
	
	
	output wire opcode, 
	
	output wire cSign,
	
	output wire cSignEx


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
	
		
endmodule */
module select_encode(
    output wire R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
    output wire R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
    output reg[31:0] C_sign_extended,
    input Gra, Grb, Grc, Rin, Rout, BAout,
    input [31:0] IR
);
    reg[3:0] regSel;
    wire[15:0] regSelDec;

    decoder_4_16 Decoder(regSelDec, regSel);
    
    always @(*)
    begin
        if(Gra)
            regSel = IR[26:23];
        else if(Grb)
            if(IR[31:27] == 5'b10100)
                regSel = 4'b1111;
            else
                regSel = IR[22:19];
        else if(Grc)
            regSel = IR[18:15];
        
        if(IR[18] == 1)
            C_sign_extended = {13'b1111111111111, IR[18:0]};
        else
            C_sign_extended = {13'b0000000000000, IR[18:0]};
    end

    // Individual assignments for Rin and Rout signals
    assign R0in = Rin & regSelDec[0];
    assign R1in = Rin & regSelDec[1];
    assign R2in = Rin & regSelDec[2];
    assign R3in = Rin & regSelDec[3];
    assign R4in = Rin & regSelDec[4];
    assign R5in = Rin & regSelDec[5];
    assign R6in = Rin & regSelDec[6];
    assign R7in = Rin & regSelDec[7];
    assign R8in = Rin & regSelDec[8];
    assign R9in = Rin & regSelDec[9];
    assign R10in = Rin & regSelDec[10];
    assign R11in = Rin & regSelDec[11];
    assign R12in = Rin & regSelDec[12];
    assign R13in = Rin & regSelDec[13];
    assign R14in = Rin & regSelDec[14];
    assign R15in = Rin & regSelDec[15];

    assign R0out = (Rout | BAout) & regSelDec[0];
    assign R1out = (Rout | BAout) & regSelDec[1];
    assign R2out = (Rout | BAout) & regSelDec[2];
    assign R3out = (Rout | BAout) & regSelDec[3];
    assign R4out = (Rout | BAout) & regSelDec[4];
    assign R5out = (Rout | BAout) & regSelDec[5];
    assign R6out = (Rout | BAout) & regSelDec[6];
    assign R7out = (Rout | BAout) & regSelDec[7];
    assign R8out = (Rout | BAout) & regSelDec[8];
    assign R9out = (Rout | BAout) & regSelDec[9];
    assign R10out = (Rout | BAout) & regSelDec[10];
    assign R11out = (Rout | BAout) & regSelDec[11];
    assign R12out = (Rout | BAout) & regSelDec[12];
    assign R13out = (Rout | BAout) & regSelDec[13];
    assign R14out = (Rout | BAout) & regSelDec[14];
    assign R15out = (Rout | BAout) & regSelDec[15];

endmodule

	

`timescale 1ns/10ps
module divide_tb;
	reg MARin, Zlowin, Zhighin, PCin, MDRin, IRin, Yin;
	reg IncPC, read, LOin, HIin, R6in, R7in;
	reg clock;
	reg [4:0] operation;
	reg [31:0] Mdatain;
	reg R0out, R1out, R2out, R3out, 
		R4out, R5out, R6out, R7out, R8out, 
		R9out, R10out, R11out, R12out, R13out, 
		R14out, R15out, HIout, LOout, ZHIout, 
		ZLOout, PCout, MDRout, Inportout, Cout;

	parameter	Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011,
					Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111,
					T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100, T6 = 4'b1101;
	reg [3:0] Present_state = Default;

bus BUS(clock, clear, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in,
	R10in, R11in, R12in, R13in, R14in, R15in, HIin, LOin, Zhighin, Zlowin,
	PCin, MDRin, OutPortin, Cin, MARin, IRin, Yin, R0out, R1out, R2out, R3out, 
	R4out, R5out, R6out, R7out, R8out, 
	R9out, R10out, R11out, R12out, R13out, 
	R14out, R15out, HIout, LOout, ZHIout, 
	ZLOout, PCout, MDRout, Inportout, Cout, IncPC, read, Mdatain,
	operation);

initial
	begin
		clock = 0;
		forever #10 clock = ~clock;
	end
	
always@(posedge clock)
	begin
		case (Present_state)
			Default : Present_state = Reg_load1a;
			Reg_load1a : Present_state = Reg_load1b;
			Reg_load1b : Present_state = Reg_load2a;
			Reg_load2a : Present_state = Reg_load2b;
			Reg_load2b : Present_state = Reg_load3a;
			Reg_load3a : Present_state = Reg_load3b;
			Reg_load3b : Present_state = T0;
			T0 : Present_state = T1;
			T1 : Present_state = T2;
			T2 : Present_state = T3;
			T3 : Present_state = T4;
			T4 : Present_state = T5;
			T5 : Present_state = T6;
		endcase
	end

always@(Present_state)
	begin
		case (Present_state) // assert the required signals in each clock cycle
			Default: begin

				PCout <= 0; ZLOout <= 0; MDRout <= 0; // initialize the signals
				R6out <= 0; R7out <= 0; MARin <= 0; Zlowin <= 0; Zhighin <= 0;
				PCin <=0; MDRin <= 0; IRin <= 0; Yin <= 0;
				IncPC <=0; read <= 0; operation <= 5'b00000;
				LOin <=0; HIin <= 0; R6in<=0; R7in<=0; Mdatain <= 32'h00000000;
				{R0out, R1out, R2out, R3out, 
					R4out, R5out, R6out, R7out, R8out, 
					R9out, R10out, R11out, R12out, R13out, 
					R14out, R15out, HIout, LOout, ZHIout, 
					ZLOout, PCout, MDRout, Inportout, Cout} <= 24'b000000000000000000000000;
			end
			Reg_load1a: begin
				Mdatain <= 32'h00000012;
				#5 read <= 1; MDRin <= 1;
				#15 read <= 0; MDRin <= 0;
			end
			Reg_load1b: begin
				#5 MDRout <= 1; R6in <= 1;
				#15 MDRout <= 0; R6in <= 0; // initialize R6 with the value $12 (18)
			end
			Reg_load2a: begin
				Mdatain <= 32'h00000014;
				#5 read <=1; MDRin <=1;
				#15 read <= 0; MDRin <= 0;
			end
			 Reg_load2b: begin
				#5 MDRout <= 1; R7in <= 1;
				#15 MDRout <= 0; R7in <= 0; // initialize R7 with the value $14 (20)
			end
			Reg_load3a: begin
				Mdatain <= 32'h00000018;
				#5 read <= 1; MDRin <= 1;
				#15 read <= 0; MDRin <= 0;
			end
			 Reg_load3b: begin
				#5 MDRout <= 1; LOin <= 1; HIin <= 1;
				#15 MDRout <= 0; LOin <= 0; HIin <= 0; // initialize LO, HI with the value $18 (22)
			end
			T0: begin // see if you need to de-assert these signals
				#5 PCout <= 1; MARin <= 1; IncPC <= 1; Zlowin <= 1;
				#15 PCout <= 0; MARin <= 0; IncPC <= 0; Zlowin <= 0;
			end
			T1: begin
				Mdatain <= 32'h83380000; // OPCODE 1000 0011 0011 1000 0...
				#5 ZLOout <= 1; PCin <=1; read<=1; MDRin<=1;  
				#15 ZLOout <= 0; PCin <=0; read<=0; MDRin<=0;
			end
			T2: begin
				#5 MDRout <= 1; IRin <=1;
				#15 MDRout <= 0; IRin <=0;
			end
			T3: begin
				# 5 R6out <= 1; Yin <= 1;
				# 15 R6out <= 0; Yin <= 0; // R6 into Y
			end
			T4: begin
				# 5 R7out <= 1; operation <= 5'b10000; Zlowin <= 1; Zhighin <= 1; //"DIV" //R7 to muxout, direct to ALU
				# 15 R7out <= 0; Zlowin <= 0; Zhighin <= 0;
			end
			T5: begin
				# 5 ZLOout <= 1; LOin <= 1; // result from alu (ZLOout) to LO (Quotient)
				# 15 ZLOout <= 0; LOin <= 0; 
			end
			T6: begin
				# 5 ZHIout <= 1; HIin <= 1; // result from alu (ZHIout) to HI (Remainder)
				# 15 ZHIout <= 0; HIin <= 0; 
			end
		endcase
	end
endmodule
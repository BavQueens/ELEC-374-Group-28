`timescale 1ns/10ps
module ld_tb;
	reg Gra, Grb, Grc, Rin, Rout, BAout, CON_in;
	reg MARin, Zlowin, Zhighin, PCin, MDRin, OutPortin, IRin, Yin ;
	reg IncPC, write, read, LOin, HIin;
	reg clock, clear;
	reg [4:0] operation;
	reg [31:0] Mdatain;
	reg HIout, LOout, ZHIout, ZLOout, PCout, MDRout, Inportout, Cout;
	wire CON_out;

	parameter	Default = 4'b0000, T0 = 4'b0001, T1 = 4'b0010, T2 = 4'b0011, T3 = 4'b0100,
					T4 = 4'b0101, T5 = 4'b0110, T6 = 4'b0111, T7 = 4'b1000;
	reg [3:0] Present_state = Default;

bus BUS(.clock(clock), 
.clear(clear), 
.Gra(Gra), 
.Grb(Grb), 
.Grc(Grc), 
.Rin(Rin), 
.Rout(Rout), 
.BAout(BAout), 
.CON_in(CON_in), 
.HIin(HIin), 
.LOin(LOin), 
.Zhighin(Zhighin), 
.Zlowin(Zlowin),
	.PCin(PCin), 
	.MDRin(MDRin), 
	.OutPortin(OutPortin), 
	.MARin(MARin), 
	.IRin(IRin), 
	.Yin(Yin), 
	.HIout(HIout), 
	.LOout(LOout), 
	.ZHIout(ZHIout), 
	.ZLOout(ZLOout), 
	.PCout(PCout), 
	.MDRout(MDRout), 
	.Inportout(Inportout), 
	.Cout(Cout), 
	.IncPC(IncPC), 
	.write(write), 
	.read(read), 
	.operation(operation), 
	.CON_out(CON_out));

initial
	begin
		clock = 0;
		forever #10 clock = ~clock;
	end
	
always@(posedge clock)
	begin
		case (Present_state)
			Default : Present_state = T0;
			T0 : Present_state = T1;
			T1 : Present_state = T2;
			T2 : Present_state = T3;
			T3 : Present_state = T4;
			T4 : Present_state = T5;
			T5 : Present_state = T6;
			T6 : Present_state = T7;
		endcase
	end

always@(Present_state)
	begin
		case (Present_state) // assert the required signals in each clock cycle
			Default: begin
				
				Gra <=0; Grb <=0; Grc <=0; Rin <=0; Rout <=0; BAout <=0; CON_in <= 0;
				MARin <=0; Zlowin <=0; Zhighin <=0; PCin <=0; MDRin <=0; IRin <=0; Yin <= 0;
				IncPC <=0; write <=0; read <=0; LOin <=0; HIin <=0;
	
				operation <= 0;
				Mdatain <= 0;
				
				{HIout, LOout, ZHIout, 
					ZLOout, PCout, MDRout, Inportout, Cout} <= 8'b00000000;
			end
			T0: begin // see if you need to de-assert these signals
				#5 PCout <= 1; MARin <= 1; IncPC <= 1; Zlowin <= 1;
				#15 PCout <= 0; MARin <= 0; IncPC <= 0; Zlowin <= 0;
			end
			T1: begin
				// Mdatain <= 32'h; 00000 0001 0010 0
				#5 ZLOout <= 1; PCin <=1; read<=1; MDRin<=1;  
				#15 ZLOout <= 0; PCin <=0; read<=0; MDRin<=0;
			end
			T2: begin
				#5 MDRout <= 1; IRin <=1;
				#15 MDRout <= 0; IRin <=0;
			end
			T3: begin
				# 5 Grb <=1; BAout <=1; Yin <= 1;
				# 15 Grb <=0; BAout <=0; Yin <= 0;
			end
			T4: begin
				# 5 Cout <= 1; operation <= 5'b00011; Zlowin <= 1;
				# 15 Cout <= 0; Zlowin <= 0;
			end
			T5: begin
				# 5 ZLOout <= 1; MARin <=1;
				# 15 ZLOout <= 0; MARin <=0;
			end
			T6: begin
				# 5 read <= 1; MDRin <=1; 
				# 15 read <= 0; MDRin <=0; 
			end
			T7: begin
				# 5 MDRout <=1; Gra <= 1; Rin <= 1;
				# 15 MDRout <=0; Gra <= 0; Rin <= 0;
			end
		endcase
	end
endmodule

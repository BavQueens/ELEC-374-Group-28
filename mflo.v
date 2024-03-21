`timescale 1ns/10ps
module mfhi_tb;
	reg Gra, Grb, Grc, Rin, Rout, BAout, CON_in;
	reg MARin, Zlowin, Zhighin, PCin, MDRin, IRin, Yin;
	reg IncPC, write, read, LOin, HIin;
	reg clock;
	reg [4:0] operation;
	reg [31:0] Mdatain;
	reg HIout, LOout, ZHIout, 
	ZLOout, PCout, MDRout, Inportout, Cout;
	reg CON_out;

	parameter	Default = 4'b0000, T0 = 4'b0001, T1 = 4'b0010, T2 = 4'b0011, T3 = 4'b0100,
					T4 = 4'b0101, T5 = 4'b0110, T6 = 4'b0111, T7 = 4'b1000;
	reg [3:0] Present_state = Default;

bus BUS(clock, clear, Gra, Grb, Grc, Rin, Rout, BAout, CON_in, HIin, LOin, Zhighin, Zlowin,
	PCin, MDRin, OutPortin, MARin, IRin, Yin, HIout, LOout, ZHIout, 
	ZLOout, PCout, MDRout, Inportout, Cout, IncPC, write, read, operation, CON_out);

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
				#5 PCin <= 1; MDRin <= 1; read <= 1; Zlowout <= 1; 
				#5 PCin <= 0; MDRin <= 0; read <= 0; Zlowout <= 0; 
			
			end
			T2: begin
				#5 MDRout <= 1; IRin <= 1;
				#15 MDRout <= 0; IRin <= 0;
			end
			T3: begin
				#5 Gra <= 1; Rin <=1; LOout <= 1;
				#15 Gra <= 0; Rin <= 0; LOout <= 0;
			end
			
		endcase
	end
endmodule
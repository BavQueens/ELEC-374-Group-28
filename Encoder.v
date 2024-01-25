module encoder(
input wire R0out, R1out, R2out, R3out, 
	R4out, R5out, R6out, R7out, R8out, 
	R9out, R10out, R11out, R12out, R13out, 
	R14out, R15out, HIout, LOout, ZHIout, 
	ZLOout, PCout, MDRout, Inportout, Cout,

//input wire [31:0] in,
output reg [4:0] out
);

wire [31:0] in = { 8'd0, Cout, Inportout, MDRout, PCout, ZLOout, ZHIout, LOout, HIout, R15out, R14out, R13out, R12out,
					R11out, R10out, R9out, R8out, R7out, R6out, R5out, R4out, R3out, R2out, R1out, R0out};
always@(*)begin
	case(in)
		32'h00000001 : out = 0;
		32'h00000002 : out = 1;
		32'h00000004 : out = 2;
		32'h00000008 : out = 3;
		32'h00000010 : out = 4;
		32'h00000020 : out = 5;
		32'h00000040 : out = 6;
		32'h00000080 : out = 7;
		32'h00000100 : out = 8;
		32'h00000200 : out = 9;
		32'h00000400 : out = 10;
		32'h00000800 : out = 11;
		32'h00001000 : out = 12;
		32'h00002000 : out = 13;
		32'h00004000 : out = 14;
		32'h00008000 : out = 15;
		32'h00010000 : out = 16;
		32'h00020000 : out = 17;
		32'h00040000 : out = 18;
		32'h00080000 : out = 19;
		32'h00100000 : out = 20;
		32'h00200000 : out = 21;
		32'h00400000 : out = 22;
		32'h00800000 : out = 23;
		default		: out = 5'bx;
		endcase
	end
endmodule
module Ram
(
	input [31:0] data,
	input [8:0] addr,
	input write, read, clock,
	output reg [31:0] q
);

	// Declare the RAM variable (Keep low for testing, actual 511:0)
	reg [31:0] ram[511:0];
	
	
	initial begin : INIT
		//$readmemh("InitR.mif", ram);
		//ld
		//ram[32'h0] = 32'b00000001000000000000000010010101;	// follow cpu specifications doc 
		//ram[32'h95] = 32'h00000005;
		
		//ram[32'h0] = 32'b00000000000000000000000010010101;
		//ram[32'h95] = ram[32'h95] + 32'h00000038;
		
		//ldi
		ram[32'h0] = 32'h00001001000000000000000010010101;
		ram[32'h95] = 32'h00000005;
		
		//andi 
		
		
		//st
		//ram[32'h0] = 32'b00010000100000000000000010000111;
		//ram[32'h87] = 32'h12341234;	
	end
	
	always @ (posedge clock)
	begin
	// Write
		if (write)
			ram[addr] <= data;
		if (read)
			q <= ram[addr];
		
	end
		
endmodule

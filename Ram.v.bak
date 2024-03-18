module Ram
(
	input [31:0] data,
	input [8:0] addr,
	input write, read, clock,
	output [31:0] q
);

	// Declare the RAM variable (Keep low for testing, actual 511:0)
	reg [31:0] ram[511:0];
	
	// Variable to hold the registered read address
	reg [8:0] addr_reg;
	
	initial begin : INIT
		$readmemh("InitR.mif", ram);
	end
	
	always @ (posedge clock)
	begin
	// Write
		if (write)
			ram[addr] <= data;
		if (read)
			addr_reg <= addr;
		
	end
		
	// Continuous assignment implies read returns NEW data.
	// This is the natural behavior of the TriMatrix memory
	// blocks in Single Port mode.  
	assign q = ram[addr_reg];
	
	
endmodule

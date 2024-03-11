module d_flip_flop(
input d,
input clk,
//input reset,
output reg q,
output reg qnot
);

//wire qn;
//assign qn = !q;

always @ (clk) begin
	q = d;
	qnot = !d; 
end
endmodule

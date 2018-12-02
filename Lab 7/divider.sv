//
// lab7 : version 10/15/2018
//                                               
module divider #(parameter BIT_SIZE=4)
	(output logic tc, output logic [BIT_SIZE-1:0] count, input logic clk,
	input logic rst, input logic ena, input logic [BIT_SIZE-1:0] init_count);

	logic [BIT_SIZE-1:0] next_count;

	// enter your code here

always_ff @ (posedge clk) begin
	count <= next_count;
end

always_comb begin

tc = 0;
next_count = count;

if (ena == 1) begin
	next_count = count - 1;
	if (count == 0) begin
	tc = 1;
	next_count = init_count;
	end
end

if (rst == 1) begin
	next_count = init_count;
end
end
endmodule

//
// lab6 : version 10/08/2018
//                                               
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module alu_1 (output logic [3:0] f, output logic c_out, input logic [2:0] sel,
	input logic [3:0] a, input logic [3:0] b, input logic c_in);

	// enter your code here
always @* begin
case(sel)
3'b000: {c_out, f} = {1'b0,a};
3'b001: {c_out, f} = a + b + c_in;
3'b010: {c_out, f} = a + b;
3'b011: {c_out, f} = a - b - c_in;
3'b100: {c_out, f} = a - b;
3'b101: {c_out, f} = a + 1;
3'b110: {c_out, f} = a - 1;
3'b111: {c_out, f} = {1'b0,a & b};
endcase
end

endmodule

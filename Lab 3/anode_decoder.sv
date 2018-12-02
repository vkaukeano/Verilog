//
// lab3 : version 09/17/2018
//                                               
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module anode_decoder(
	output logic [3:0] anode,
	input logic [1:0] switch_in
	);

	// add the design code here
always @* begin
case(switch_in)
	2'b00: anode = 4'b1110;
	2'b01: anode = 4'b1101;
	2'b10: anode = 4'b1011;
	2'b11: anode = 4'b0111;
	endcase
	end

endmodule

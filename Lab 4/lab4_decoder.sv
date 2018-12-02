//
// lab4 : version 09/24/2018
//                                               
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module lab4_decoder(
	output logic [3:0] led,
	output logic [3:0] an,
	output logic [6:0] cathode,
	input logic [6:0] sw
	);

	// insert your code here

wire [3:1] bad_bit;

assign an = 4'b1110;

hamming7_4_decode u1(.decode(led), .bad_bit(bad_bit), .h_code(sw));
svn_seg_decoder u2(.seg_out(cathode), .display_on(1'b1), .bcd_in({0,bad_bit}));

endmodule

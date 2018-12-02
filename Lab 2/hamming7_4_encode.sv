//
// lab2 : version 09/11/2018
//                                               
`timescale 1ns / 1ps
module hamming7_4_encode(
	output logic [7:1] e,
	input logic [4:1] d
	);


	// enter your code here
	
logic p1, p2, p3;

assign p1 = d[1] ^ d[2] ^ d[4];

assign p2 = d[1] ^ d[3] ^ d[4];

assign p3 = d[2] ^ d[3] ^ d[4];

assign e[7:1] = {d[4], d[3], d[2], p3, d[1], p2, p1};

endmodule

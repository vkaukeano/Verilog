//
// lab6 : version 10/08/2018
//                                               
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module lab6_alu_1 (
	output logic c_out,
	output logic [6:0] cathode,
	input logic [11:0] sw
	);
	
	// enter your code here
	logic [3:0] calc;
	
alu_1 u_alu_1 ( .f(calc) , .c_out(c_out) , .sel(sw[11:9]) , .a(sw[3:0]) , .b(sw[7:4]), .c_in(sw[8])  );
svn_seg_decoder u_svn_seg(.seg_out(cathode), .display_on(1'b1), .bcd_in(calc));

endmodule

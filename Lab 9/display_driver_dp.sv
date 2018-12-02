//
// lab9 : version 10/29/2018
//                                               
`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

module display_driver_dp(output logic [6:0] cathode, output logic [3:0] anode, input logic [3:0] digit3,
	input logic [3:0] digit2, input logic [3:0] digit1, input logic [3:0] digit0,
	input logic [1:0] digit_sel, input logic display_on, input logic [1:0] anode_sel);

	// insert your code here

logic [3:0] bcd_in;

always_comb begin
case (digit_sel)
2'b00: bcd_in = digit0;
2'b01: bcd_in = digit1;
2'b10: bcd_in = digit2;
2'b11: bcd_in = digit3;
endcase
end

svn_seg_decoder u1(.seg_out(cathode), .bcd_in(bcd_in), .display_on(display_on));
anode_decoder u2(.anode(anode), .switch_in(anode_sel));


endmodule

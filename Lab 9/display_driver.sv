//
// lab9 : version 10/29/2018
//                                               
`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

module display_driver( output logic [6:0] cathode, output logic [3:0] anode,
	output logic [1:0] anode_sel, output logic m_sec,
	input logic [3:0] digit3, input logic [3:0] digit2, input logic [3:0] digit1,
	input logic [3:0] digit0, input logic display_on, input logic rst, input logic clk);

	// insert your code here


logic [1:0] digit_sel;


display_driver_fsm u1(.anode_sel(anode_sel), .digit_sel(digit_sel), .clk(clk), .rst(rst), .m_sec(m_sec));

display_driver_dp u2(.cathode(cathode), .anode(anode), .digit0(digit0), .digit1(digit1), .digit2(digit2), .digit3(digit3),
.digit_sel(digit_sel), .display_on(display_on), .anode_sel(anode_sel));

divider #(.BIT_SIZE(17)) u3(.tc(m_sec), .clk(clk), .ena(1'b1),.rst(rst) ,.init_count(17'd99999));

endmodule

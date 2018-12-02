//
// lab3 : version 09/17/2018
//                                               
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module svn_seg_decoder(
	output logic [6:0] seg_out,
	input logic [3:0] bcd_in,
	input logic display_on
	);
always @* begin
if (display_on == 1'b1) begin
case(bcd_in)
	4'b0000: seg_out = 7'b1000000;  //0 
	4'b0001: seg_out = 7'b1111001;  //1
	4'b0010: seg_out = 7'b0100100;  //2
	4'b0011: seg_out = 7'b0110000;  //3
	4'b0100: seg_out = 7'b0011001;  //4
	4'b0101: seg_out = 7'b0010010;  //5
	4'b0110: seg_out = 7'b0000010;  //6
	4'b0111: seg_out = 7'b1111000;  //7
	4'b1000: seg_out = 7'b0000000;  //8
	4'b1001: seg_out = 7'b0010000;  //9
	4'b1010: seg_out = 7'b0100000;  //A
	4'b1011: seg_out = 7'b0000011;  //B
	4'b1100: seg_out = 7'b1000110;  //C
	4'b1101: seg_out = 7'b0100001;  //D
	4'b1110: seg_out = 7'b0000110;  //E
	4'b1111: seg_out = 7'b0001110;  //F
	endcase
	end
else seg_out = 7'b1111111;
end
endmodule

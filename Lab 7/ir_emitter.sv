//
// lab7 : version 10/15/2018
//                                               
module ir_emitter (output logic emitter_out, input logic clk, input logic rst, input logic ena);

logic tc_carrier,tc_carrier_2, tc_modulator;
logic sw_carrier,sw_modulator;

	// enter your code here - declare internal signals

	// carrier divide by 100MHz/38kHz / 2 = 1315 (rounded up)
	// enter your code here
divider #(.BIT_SIZE(11)) u1 (.tc(tc_carrier_2) , .count(), .clk(clk), .rst(rst), .ena(ena), .init_count(11'd1315));
	// carrier divide by 2 to make it a square wave of 50% duty cycle
	// enter your code here
divider #(.BIT_SIZE(1)) u2(.tc(tc_carrier) , .count(sw_carrier), .clk(clk), .rst(rst), .ena(tc_carrier_2), .init_count(1));

	// modulation divide by 10 (10 on ... 10 off)
	// enter your code here
divider #(.BIT_SIZE(4)) u3(.tc(tc_modulator) , .count(), .clk(clk), .rst(rst), .ena(tc_carrier), .init_count(9));

	// modulation divide by 2 to make it a square wave of 50% duty cycle
	// enter your code here
divider #(.BIT_SIZE(1)) u4(.tc() , .count(sw_modulator), .clk(clk), .rst(rst), .ena(tc_modulator), .init_count(1));

	// AND gate to create the emitter out signal
	// enter your code here

assign emitter_out = sw_carrier & sw_modulator;

endmodule

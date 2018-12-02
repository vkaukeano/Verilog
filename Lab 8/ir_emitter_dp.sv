//
// lab8 : version 10/22/2018
//                                               
module ir_emitter_dp (output logic emitter_out, output logic tc_modulator, input logic clk,
	input logic rst, input logic ena, input logic init_sel, input logic sw_modulator);

	// insert your code here
logic tc_76k, tc_carrier, sw_carrier;
logic [5:0] mod_init_count;

divider #(.BIT_SIZE(11)) u1(.tc(tc_76k), .count(), .clk(clk), .rst(rst), .ena(ena), .init_count(11'd1315));
divider #(.BIT_SIZE(1)) u2(.tc(tc_carrier), .count(sw_carrier), .clk(clk), .rst(rst), .ena(tc_76k), .init_count(11'd1));
divider #(.BIT_SIZE(6)) u3(.tc(tc_modulator), .count(), .clk(clk), .rst(rst), .ena(tc_carrier), .init_count(mod_init_count));



always_comb begin
case(init_sel)
1'b1: mod_init_count = 6'd63;
1'b0: mod_init_count = 6'd21;
endcase
end

assign emitter_out = sw_carrier & sw_modulator;

endmodule


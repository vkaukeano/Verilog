//
// lab9 : version 10/29/2018
//                                               
`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

module display_driver_fsm(output logic [1:0] anode_sel, output logic [1:0] digit_sel,
	input logic clk, input logic rst, input logic m_sec);

	// define and enumerate state variables
	enum logic [1:0] {D0, D1, D2, D3} state, next_state;

	// sequential logic
	always_ff @(posedge clk) begin
		state <= next_state;
	end

	// combinational for state machine
	always_comb begin
// complete the combinational logic for the state machine
		// defaults
	next_state = state;
		// main logic
case(state)
D0: begin
anode_sel = 2'b00;
digit_sel = 2'b00;
if (m_sec == 1)
next_state = D1;
end

D1: begin
anode_sel = 2'b01;
digit_sel = 2'b01;
if (m_sec == 1) begin
next_state = D2;
end
end

D2: begin
anode_sel = 2'b10;
digit_sel = 2'b10;
if (m_sec == 1) 
next_state = D3;

end

D3: begin
anode_sel = 2'b11;
digit_sel = 2'b11;
if (m_sec == 1) 
next_state = D0;
end
endcase

		// priority logic
if (rst == 1'b1) begin
next_state = D0;
anode_sel = 2'b00;
digit_sel = 2'b00;
end

end // combinational state machine always

endmodule

//
// lab10 : version 11/05/2018
//                                               
module ir_emitter_fsm (output logic sw_modulator, output logic pulse_width, output logic dp_rst,
	input logic clk, input logic rst, input logic strt, input logic tc_modulator,
	input logic [3:0] sw);

	// enter your code here

enum logic [3:0] {IDLE, STRTCN, STRTCF, CNB0, CFB0, CNB1, CFB1, CNB2, CFB2, CNLAST, CFLAST, STOPCN, STOPCF, DONE} state, next_state;

always_ff @(posedge clk) begin
		state <= next_state;
	end

	always_comb begin
	next_state = state;
	sw_modulator = 1'b0;
	pulse_width = 1'b1;
	dp_rst = 1'b1;
	
	case(state)
// 0	
	IDLE: begin
	if(strt == 1'b1) begin 
	next_state = STRTCN;
	end
	
	sw_modulator = 1'b0;
	pulse_width = 1'b1;
	dp_rst = 1'b1;
	end
// 1	
	STRTCN: begin
	if(tc_modulator == 1'b1) begin 
	next_state = STRTCF;
	end
	
	sw_modulator = 1'b1;
	pulse_width = 1'b0;
	dp_rst = 1'b0;
	end
// 2	
	STRTCF: begin
	if(tc_modulator == 1'b1) begin 
	next_state = CNB0;
	end
	
	sw_modulator = 1'b0;
	pulse_width = 1'b0;
	dp_rst = 1'b0;
	end
// 3
	CNB0: begin
	if(tc_modulator == 1'b1) begin 
	next_state = CFB0;
	end
	
	sw_modulator = 1'b1;
	pulse_width = sw[0];
	dp_rst = 1'b0;
	end
// 4
	CFB0: begin
	if(tc_modulator == 1'b1) begin 
	next_state = CNB1;
	end
	
	sw_modulator = 1'b0;
	pulse_width = 1'b0;
	dp_rst = 1'b0;
	end
// 5
	CNB1: begin
	if(tc_modulator == 1'b1) begin 
	next_state = CFB1;
	end
	
	sw_modulator = 1'b1;
	pulse_width = sw[1];
	dp_rst = 1'b0;
	end
// 6
	CFB1: begin
	if(tc_modulator == 1'b1) begin 
	next_state = CNB2;
	end
	
	sw_modulator = 1'b0;
	pulse_width = 1'b0;
	dp_rst = 1'b0;
	end
// 7
	CNB2: begin
	if(tc_modulator == 1'b1) begin 
	next_state = CFB2;
	end
	
	sw_modulator = 1'b1;
	pulse_width = sw[2];
	dp_rst = 1'b0;
	end
// 8
	CFB2: begin
	if(tc_modulator == 1'b1) begin 
	next_state = CNLAST;
	end
	
	sw_modulator = 1'b0;
	pulse_width = 1'b0;
	dp_rst = 1'b0;
	end
// 9
	CNLAST: begin
	if(tc_modulator == 1'b1) begin 
	next_state = CFLAST;
	end
	
	sw_modulator = 1'b1;
	pulse_width = sw[3];
	dp_rst = 1'b0;
	end
// 10
CFLAST: begin
	if(tc_modulator == 1'b1) begin 
	next_state = STOPCN;
	end
	
	sw_modulator = 1'b0;
	pulse_width = 1'b1;
	dp_rst = 1'b0;
	end
// 11
	STOPCN: begin
	if(tc_modulator == 1'b1) begin 
	next_state = STOPCF;
	end
	
	sw_modulator = 1'b1;
	pulse_width = 1'b0;
	dp_rst = 1'b0;
	end
// 12
	STOPCF: begin
	if(tc_modulator == 1'b1) begin 
	next_state = DONE;
	end
	
	sw_modulator = 1'b0;
	pulse_width = 1'b0;
	dp_rst = 1'b0;
	end
// 13
	DONE: begin
	sw_modulator = 1'b0;
	pulse_width = 1'b0;
	dp_rst = 1'b1;
	end

endcase

if(rst == 1) begin
next_state = IDLE;
end

end 
endmodule

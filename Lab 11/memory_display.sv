//
// lab11 : version 11/13/2018
//                                               
module memory_display (output logic [6:0] cathode, output logic [3:0] anode,
	output logic m_sec, output logic [3:0] rp_data, output logic [3:0] rq_data,
	input logic rst, input logic clk, input logic m_write,
	input logic w_ena, input logic [3:0] w_data, input logic [7:0] sw);

logic w_wr;
logic [3:0] digit0, digit1, digit2, digit3;

rf_8x4_2r1w u_rf(.rq_data(rq_data), .rp_data(rp_data), .w_data(w_data), .w_addr(sw[2:0]), 
.rq_addr(sw[6:4]), .rp_addr(sw[2:0]), .w_wr(w_wr), .clk(clk));

display_driver u_dd(.digit0({1'b0, sw[2:0]}), .digit1(digit1), .digit2({1'b0,sw[6:4]}), .digit3(rq_data), 
.cathode(cathode), .anode(anode), .anode_sel(), .m_sec(m_sec), .display_on(1'b1), .clk(clk), .rst(rst));

assign w_wr = w_ena & m_write;
always_comb begin

case(sw[7])

1'b1:begin
digit1 = w_data;
end

1'b0:begin
digit1 = rp_data;
end
endcase
end
endmodule

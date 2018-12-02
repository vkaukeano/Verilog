//
// lab12 : version 11/27/2018
//                                               
module processor_dp #(parameter DB_SIZE = 9, DB_COUNT = 499)
	(output logic [6:0] cathode, output logic [3:0] anode,
	output logic c_out, input logic clk, input logic rst, input logic [15:0] sw,
	input logic btnL);

	// insert your design here
logic m_sec, m_write, w_ena;
logic [3:0] alu_out, rq_data, rp_data,w_data;

btn_debounce #(.DB_SIZE(DB_SIZE), .DB_COUNT(DB_COUNT))
u_bdbn(.zero_to_one(m_write), .btn(btnL), .m_sec(m_sec), .clk(clk), .rst(rst));

always_comb begin

w_ena = sw[7] | sw[3];

case( ({sw[7], sw[3]} == 2'b01) )
1'b0:begin
w_data = sw[11:8];
end

1'b1:begin
w_data = alu_out;
end

endcase
end

memory_display u_md(.rq_data(rq_data), .rp_data(rp_data), .cathode(cathode), .anode(anode), .m_sec(m_sec), .sw(sw[7:0]), 
.w_data(w_data), .w_ena(w_ena), .m_write(m_write), .clk(clk), .rst(rst));

alu_1 u_alu(.f(alu_out), .c_out(c_out), .b(rq_data), .a(rp_data), .c_in(sw[15]), .sel(sw[14:12]));
endmodule

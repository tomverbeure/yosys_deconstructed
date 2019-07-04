
module sub_design(clk, in, out);

	parameter INSERT_FF = 0;

	input clk;

	input in;
	output out;

	generate if (INSERT_FF) begin
		reg out_ff;
		always @(posedge clk) 
			out_ff <= in;
		assign out = out_ff;
	end else begin
		assign out = in;
	end endgenerate

endmodule


module my_design(clk, reset_, a, b, z, sb_in, sb_out, sb_out_z);

	input clk;
	input reset_;

	input [7:0] a;
	input [7:0] b;
	input [7:0] z;

	input  sb_in;
	output sb_out;
	inout  sb_out_z;

	always @(posedge clk, negedge reset_)
		if (!reset_)
			z <= 0;
		else
			z <= a + b;

	SB_IO u_sb_in (
		.PACKAGE_PIN(sb_in),
		.LATCH_INPUT_VALUE(1'b1),
		.CLOCK_ENABLE(1'b0),
		.INPUT_CLK(clk),
		.OUTPUT_CLK(clk),
		.OUTPUT_ENABLE(1'b0),
		.D_OUT_0(1'b0),
		.D_OUT_1(1'b0),
		.D_IN_0(sb_in_from_pad),
		.D_IN_1()
	);


	SB_DFF u_sb_in2sb_internal0 (sb_internal0, clk, sb_in_from_pad);

	sub_design u_sb_internal02sb_internal1(clk, sb_internal0, sb_internal1);

	sub_design #(.INSERT_FF(1) ) u_sb_internal12sb_out(clk, sb_internal1, sb_out_to_pad);

	SB_IO u_sb_out (
		.PACKAGE_PIN(sb_out),
		.LATCH_INPUT_VALUE(1'b0),
		.CLOCK_ENABLE(1'b0),
		.INPUT_CLK(clk),
		.OUTPUT_CLK(clk),
		.OUTPUT_ENABLE(1'b1),
		.D_OUT_0(sb_out_to_pad),
		.D_OUT_1(sb_out_to_pad),
		.D_IN_0(),
		.D_IN_1()
	);

	assign sb_out_z = 1'bz;

endmodule



module sb_io_pads_design(clk, sb_in, sb_out);

	input clk;

	input  sb_in;
	output sb_out;

    wire sb_in_from_pad;
    wire sb_out_to_pad;

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

	SB_DFF u_sb_in_to_sb_out (sb_out_to_pad, clk, sb_in_from_pad);

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

endmodule


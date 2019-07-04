
module simple_design(clk, reset_, a, b, z);

	input clk;
	input reset_;

	input [7:0] a;
	input [7:0] b;
	input [7:0] z;

	always @(posedge clk, negedge reset_)
		if (!reset_)
			z <= 0;
		else
			z <= a + b;

endmodule


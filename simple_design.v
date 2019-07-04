
module simple_design(clk, reset_, a, b, c, d, z0, z1);

	input clk;
	input reset_;

	input [7:0] a;
	input [7:0] b;
    input [2:0] c;
    input [5:0] d;
	output [7:0] z0;
	output [7:0] z1;

	always @(posedge clk, negedge reset_)
        if (!reset_) begin
			z0 <= 0;
			z1 <= 0;
        end
        else begin
            if (c<2)
			    z0 <= a + b + 0;
            if (d<100)
			    z1 <= a + b + 1;
        end

endmodule


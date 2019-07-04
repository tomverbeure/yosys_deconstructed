
module add_ff_design(clk, reset_, a, b, z);

	input               clk;
	input               reset_;

	input       [3:0]   a;
	input       [3:0]   b;
	output  reg [3:0]   z;

	always @(posedge clk, negedge reset_)
        if (!reset_) begin
			z <= 0;
        end
        else begin
		    z <= a + b;
        end

endmodule


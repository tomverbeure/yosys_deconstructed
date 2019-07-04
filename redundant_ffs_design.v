
// Shows how there's still logic at the 6.map_gates.0.tech_map stage, but how
// everything is optimized away after the map_gates.0.ice40_opt stage.

module redundant_ffs_design(clk, reset_, a, z);

	input           clk;
	input           reset_;

	input           a;
	output reg      z;

    reg [3:0]       delay_line;

	always @(posedge clk, negedge reset_)
        if (!reset_) begin
            delay_line  <= 0;
            z           <= 0;
        end
        else begin
            delay_line[3:0] <= { delay_line[2:0], a & 1'b0 };
            z <= delay_line[3];
        end

endmodule


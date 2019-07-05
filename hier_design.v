
// Shows how after reading the initial Verilog, the top-level, hier_design,
// has no understanding of the characteristics of sub_design.
// That only gets introduced after the 1.begin.1.hierarchy stage.
//
// It also shows the concept of flattening, as seen in 2.flatten.0.flatten.

module sub_design(clk, in, out);

	parameter INSERT_FF = 0;

	input           clk;

	input           in;
	output          out;

	generate if (INSERT_FF) begin
        // Insert FF between in and out
		reg out_ff;
		always @(posedge clk) 
			out_ff <= in;
		assign out = out_ff;

	end else begin
        // Simply pass in to out.
		assign out = in;

	end endgenerate

endmodule


module hier_design(clk, a, z);

	input           clk;

	input           a;
	output          z;

    wire            i0;

	sub_design                   u_a_to_i0(clk, a, i0);
	sub_design #(.INSERT_FF(1) ) u_i0_to_z(clk, i0, z);

endmodule


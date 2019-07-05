
module tribuf_design(a, b, z0, z1, z2);

	input       a;
	input       b;

	output      z0, z1; 
    inout       z2;

    assign z0 = a ? 1'b1 : 1'bz;

    assign z1 = a ? 1'b1 : 1'bz;
    assign z1 = b ? 1'b1 : 1'bz;

    assign z2 = a;

endmodule


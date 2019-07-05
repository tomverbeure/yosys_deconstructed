
module tribuf_design(clk, en_a, a, en_b, b, z0, z1, z2);

    input       clk;

	input       en_a, a;
	input       en_b, b;

	output      z0; 
    output reg  z1; 
    inout       z2;

    wire        bus;

    assign z0 = en_a ? a : 1'bz;

    assign bus = en_a ? a : 1'bz;
    assign bus = en_b ? b : 1'bz;

    always @(posedge clk) 
        z1 <= bus; 

    assign z2 = en_a ? a : 1'bz;

endmodule


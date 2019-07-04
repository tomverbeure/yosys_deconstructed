

module test0(clk, reset_, a, b, z);

	input clk;
	input reset_;

	input a;
	input b;

	output reg z;

	always @(posedge clk, negedge reset_)
	begin
		if (!reset_) begin
			z <= 0;
		end
		else begin
			z <= a & b;
		end
	end

endmodule


module test1(clk, reset_, we, waddr, wdata, re, raddr, rdata);

	input clk;
	input reset_;

	input 		we, re;
	input      [7:0] waddr, raddr;
	input  	   [7:0] wdata;

	output reg [7:0] rdata;

	reg [7:0] mem[0:255];

	always @(posedge clk)
	begin
		if (we)
			mem[waddr] <= wdata;

		rdata <= mem[raddr];
	end

endmodule

module test2(clk, reset_, we, waddr, wdata, raddr, rdata);

	input clk;
	input reset_;

	input		we;
	input      [7:0] waddr, raddr;
	input  	   [7:0] wdata;
	output reg [7:0] rdata;

	reg [7:0] mem[0:255];
	reg [7:0] raddr_p1;

	always @(posedge clk)
	begin
		if (we)
			mem[waddr] <= wdata;

//		rdata <= mem[raddr];
		raddr_p1 <= raddr;
	end

	assign rdata = mem[raddr_p1];

endmodule

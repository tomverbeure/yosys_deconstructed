
module merge_design(clk, reset_, a, b, z0, z1);

    input clk;
    input reset_;

    input           [7:0] a;
    input           [7:0] b;
    output reg      [7:0] z0;
    output reg      [7:0] z1;

    always @(posedge clk, negedge reset_)
        if (!reset_) begin
            z0 <= 8'd0;
            z1 <= 8'd0;
        end
        else begin
            z0 <= a + b + 1'b0;
            z1 <= a + b + 1'b1;
        end

endmodule


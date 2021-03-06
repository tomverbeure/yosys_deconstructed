/* Generated by Yosys 0.8+576 (git sha1 b5f1bd0, gcc 5.4.0-6ubuntu1~16.04.11 -fPIC -Os) */

(* cells_not_processed =  1  *)
(* src = "test.v:3" *)
module test0(clk, reset_, a, b, z);
  (* src = "test.v:13" *)
  reg _0_;
  (* src = "test.v:19" *)
  wire _1_;
  (* src = "test.v:15" *)
  wire _2_;
  (* src = "test.v:8" *)
  input a;
  (* src = "test.v:9" *)
  input b;
  (* src = "test.v:5" *)
  input clk;
  (* src = "test.v:6" *)
  input reset_;
  (* src = "test.v:11" *)
  output z;
  reg z;
  assign _1_ = a & (* src = "test.v:19" *) b;
  assign _2_ = ! (* src = "test.v:15" *) reset_;
  always @* begin
    _0_ = z;
    casez (_2_)
      1'h1:
          _0_ = 1'h0;
      default:
          _0_ = _1_;
    endcase
  end
  always @(posedge clk) begin
      z <= _0_;
  end
  always @(negedge reset_) begin
      z <= _0_;
  end
endmodule

(* cells_not_processed =  1  *)
(* src = "test.v:26" *)
module test1(clk, reset_, waddr, wdata, raddr, rdata);
  (* src = "test.v:37" *)
  reg [7:0] _0_;
  (* src = "test.v:37" *)
  reg [7:0] _1_;
  (* src = "test.v:37" *)
  reg [7:0] _2_;
  (* src = "test.v:37" *)
  reg [7:0] _3_;
  (* src = "test.v:40" *)
  wire [7:0] _4_;
  (* src = "test.v:39" *)
  reg [7:0] _5_;
  (* src = "test.v:39" *)
  reg [7:0] _6_;
  (* src = "test.v:39" *)
  reg [7:0] _7_;
  (* src = "test.v:28" *)
  input clk;
  (* src = "test.v:31" *)
  input [7:0] raddr;
  (* src = "test.v:33" *)
  output [7:0] rdata;
  reg [7:0] rdata;
  (* src = "test.v:29" *)
  input reset_;
  (* src = "test.v:31" *)
  input [7:0] waddr;
  (* src = "test.v:32" *)
  input [7:0] wdata;
  (* src = "test.v:35" *)
  reg [7:0] mem [255:0];
  (* src = "test.v:40" *)
  \$memrd  #(
    .ABITS(32'd8),
    .CLK_ENABLE(32'd0),
    .CLK_POLARITY(32'd0),
    .MEMID("\\mem"),
    .TRANSPARENT(32'd0),
    .WIDTH(32'd8)
  ) _8_ (
    .ADDR(raddr),
    .CLK(1'hx),
    .DATA(_4_),
    .EN(1'hx)
  );
  (* src = "test.v:39" *)
  \$memwr  #(
    .ABITS(32'd8),
    .CLK_ENABLE(32'd0),
    .CLK_POLARITY(32'd0),
    .MEMID("\\mem"),
    .PRIORITY(32'd10),
    .WIDTH(32'd8)
  ) _9_ (
    .ADDR(_5_),
    .CLK(1'hx),
    .DATA(_6_),
    .EN(_7_)
  );
  always @* begin
    _0_ = waddr;
    _1_ = wdata;
    _2_ = 8'hff;
    _3_ = _4_;
  end
  always @(posedge clk) begin
      _5_ <= _0_;
      rdata <= _3_;
      _6_ <= _1_;
      _7_ <= _2_;
  end
endmodule

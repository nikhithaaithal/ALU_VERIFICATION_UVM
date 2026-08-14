module alu_assertion(
    input bit clk,
    input logic rst,
    input logic err,
    input logic [1:0]inp_valid
);

property p1;
@(posedge clk)disable iff(rst)
(inp_valid == 2'b01)##1 (!(inp_valid inside {2'b10,2'b11}))[*16]|=> err;
endproperty
assert property(p1);


property p2;
@(posedge clk)disable iff(rst)
(inp_valid == 2'b10)##1 (!(inp_valid inside {2'b01,2'b11}))[*16]|=> err;
endproperty
assert property(p2);
endmodule

`include "alu_if.sv"
`include "ALU_DESIGN.sv"
`include "alu_assertion.sv"
`include "test_pkg.sv"

module alu_top();
import uvm_pkg::*;
import test_pkg::*;
bit clk;
alu_if DUV_IF(clk);
initial begin
clk=0;
forever #5 clk = ~clk;
end
ALU_DESIGN DUV(.OPA(DUV_IF.opa),.OPB(DUV_IF.opb),.CLK(clk),.RST(DUV_IF.rst),.CE(DUV_IF.ce),.MODE(DUV_IF.mode),
		.CIN(DUV_IF.cin),.CMD(DUV_IF.cmd),.INP_VALID(DUV_IF.inp_valid),.RES(DUV_IF.res),.COUT(DUV_IF.cout),
		.OFLOW(DUV_IF.oflow),.G(DUV_IF.g),.E(DUV_IF.e),.L(DUV_IF.l),.ERR(DUV_IF.err));

bind ALU_DESIGN alu_assertion alu (
    .clk(CLK),
    .rst(RST),
    .err(ERR),
    .inp_valid(INP_VALID)
);

initial begin
uvm_config_db#(virtual alu_if)::set(null,"uvm_test_top","alu_if",DUV_IF);
$dumpfile("waves.vcd");
$dumpvars;
run_test("alu_test");
end

endmodule


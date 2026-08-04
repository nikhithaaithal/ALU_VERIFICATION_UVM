`include "defines.sv"
interface alu_if(input bit clk);
 
 logic [`DW -1:0]opa;
 logic [`DW -1:0]opb;
 logic [(`DW*2)-1:0]res;
 logic [`CW -1:0]cmd;
 logic [1:0]inp_valid;
 logic rst;
 logic ce,mode,cin,cout,oflow,g,l,e,err;

 clocking inp_drv_cb @(posedge clk);
  default input #1 output #1;
  output rst,opa,opb,cmd,inp_valid,ce,mode,cin;
 endclocking
  
 clocking inp_mon_cb @(posedge clk);
  default input #1 output #1;
  input rst,opa,opb,cmd,inp_valid,ce,mode,cin;
 endclocking
 
 clocking out_mon_cb @(posedge clk);
  default input #1 output #1;
  input rst,opa,opb,cmd,inp_valid,ce,mode,cin;
  input res,cout,oflow,g,e,l,err;
 endclocking

 modport IN_DRV (clocking inp_drv_cb);
 modport IN_MON (clocking inp_mon_cb);
 modport OUT_MON (clocking out_mon_cb);
endinterface






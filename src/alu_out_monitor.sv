class alu_out_monitor extends uvm_monitor;
`uvm_component_utils(alu_out_monitor)
virtual alu_if.OUT_MON viff;
alu_cfg cfg;
uvm_analysis_port #(trans) out_monitor_port;
trans data_out;

function new(string name="alu_out_monitor",uvm_component parent);
 super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 if(!uvm_config_db #(alu_cfg)::get(this, "","alu_cfg",cfg))
   `uvm_fatal(get_type_name(),"output monitor getting failed");
 out_monitor_port = new("out_monitor_port ",this);
endfunction

 
 function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
   viff=cfg.vif;
 endfunction

task run_phase(uvm_phase phase);
 data_out=trans::type_id::create("data_out");
 repeat(2) 
    @(viff.out_mon_cb);
 forever begin
 
  collect_output_monitor();
`uvm_info("OUTPUT_MONITOR",
  $sformatf("rst =%0d opa=%0d opb=%0d ce=%0b mode=%0b cin=%0b inp_valid=%0b cmd=%0d res=%0d cout=%0b oflow=%0b g=%0b e=%0b l=%0b err=%0b",
             data_out.rst,data_out.opa, data_out.opb, data_out.ce, data_out.mode, data_out.cin,
             data_out.inp_valid, data_out.cmd, data_out.res, data_out.cout,
             data_out.oflow, data_out.g, data_out.e, data_out.l, data_out.err), UVM_HIGH)
   end
endtask

virtual task collect_output_monitor();
begin
repeat(2)@(viff.out_mon_cb);
if(viff.out_mon_cb.mode &&
      (viff.out_mon_cb.cmd inside {4'b1001,4'b1010}))
   begin
    repeat(2)
     @(viff.out_mon_cb);
   end
else 
 begin 
   repeat(1)@(viff.out_mon_cb);
  end
  @(viff.out_mon_cb);
  data_out.rst = viff.out_mon_cb.rst;
  data_out.res = viff.out_mon_cb.res;
  data_out.cout = viff.out_mon_cb.cout; 
  data_out.oflow = viff.out_mon_cb.oflow;
  data_out.g= viff.out_mon_cb.g;
  data_out.e = viff.out_mon_cb.e;
  data_out.l = viff.out_mon_cb.l;
  data_out.err = viff.out_mon_cb.err;
  data_out.ce = viff.out_mon_cb.ce;
  data_out.inp_valid = viff.out_mon_cb.inp_valid;
  data_out.opa = viff.out_mon_cb.opa;
  data_out.opb = viff.out_mon_cb.opb;
  data_out.mode = viff.out_mon_cb.mode;
  data_out.cmd = viff.out_mon_cb.cmd;
  data_out.cin = viff.out_mon_cb.cin;
  out_monitor_port.write(data_out);
    
 end
endtask


endclass


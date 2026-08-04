class alu_inp_monitor extends uvm_monitor;
`uvm_component_utils(alu_inp_monitor)
virtual alu_if.IN_MON vif;
alu_cfg cfg;
uvm_analysis_port #(trans) inp_monitor_port;
trans duv2mon;

function new(string name="alu_inp_monitor",uvm_component parent);
 super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 if(!uvm_config_db #(alu_cfg)::get(this, "","alu_cfg",cfg))
   `uvm_fatal(get_type_name(),"Input monitor getting failed");
 inp_monitor_port = new("inp_monitor_port ",this);
endfunction

 
 function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
   vif=cfg.vif;
 endfunction

task run_phase(uvm_phase phase);
 duv2mon=trans::type_id::create("duv2mon");
 repeat(2) 
    @(vif.inp_mon_cb);
 forever begin
  collect_input_monitor();
  //`uvm_info("INPUT_MONITOR",$sformatf("Input MONITOR\n%s",duv2mon.sprint()),UVM_HIGH);
  `uvm_info("INPUT_MONITOR",
  $sformatf("opa=%0d opb=%0d ce=%0b mode=%0b cin=%0b inp_valid=%0b cmd=%0d res=%0d cout=%0b oflow=%0b g=%0b e=%0b l=%0b err=%0b",
             duv2mon.opa, duv2mon.opb, duv2mon.ce, duv2mon.mode, duv2mon.cin,
             duv2mon.inp_valid, duv2mon.cmd, duv2mon.res, duv2mon.cout,
             duv2mon.oflow, duv2mon.g, duv2mon.e, duv2mon.l, duv2mon.err),
  UVM_HIGH)
   end
endtask


task collect_input_monitor();
 begin
    repeat(4) 
     @(vif.inp_mon_cb);
    duv2mon.opa =vif.inp_mon_cb.opa;
    duv2mon.opb =vif.inp_mon_cb.opb;
    duv2mon.ce =vif.inp_mon_cb.ce;
    duv2mon.mode=vif.inp_mon_cb.mode;
    duv2mon.cmd =vif.inp_mon_cb.cmd;
    duv2mon.inp_valid =vif.inp_mon_cb.inp_valid;
    if((duv2mon.mode==1) && ((duv2mon.cmd==4'b0010) || (duv2mon.cmd==4'b0011)))
	    begin
		duv2mon.cin       =   vif.inp_mon_cb.cin;
	     end

    inp_monitor_port.write(duv2mon);

 end
endtask
endclass


class alu_passive_agent  extends uvm_agent;
`uvm_component_utils (alu_passive_agent)
alu_out_monitor mon_out;
alu_cfg cfg;

function new(string name ="alu_passive_agent",uvm_component parent);
 super.new(name, parent);
endfunction

function void build_phase (uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db #(alu_cfg) :: get (this,"", "alu_cfg",cfg))
 `uvm_fatal(get_type_name(),"agent failed");
if(cfg.out_agent_active == UVM_PASSIVE)
 begin
  mon_out = alu_out_monitor::type_id:: create("mon_out",this);
 end
endfunction
endclass

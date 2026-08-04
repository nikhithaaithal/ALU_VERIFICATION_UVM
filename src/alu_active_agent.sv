
class alu_active_agent  extends uvm_agent;
`uvm_component_utils (alu_active_agent)
alu_driver drv;
alu_inp_monitor mon_in;
alu_sequencer seqr;
alu_cfg cfg;

function new(string name ="alu_active_agent",uvm_component parent);
 super.new(name, parent);
endfunction

function void build_phase (uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db #(alu_cfg) :: get (this,"", "alu_cfg",cfg))
 `uvm_fatal(get_type_name(),"agent failed");
 mon_in = alu_inp_monitor::type_id:: create("mon_in",this);
if(cfg.in_agent_active == UVM_ACTIVE)
 begin
 drv =alu_driver:: type_id ::create ("drv",this);
 seqr= alu_sequencer :: type_id::create("seqr",this);
 end
endfunction

function  void connect_phase( uvm_phase phase);
 super.connect_phase(phase);
 if(cfg.in_agent_active == UVM_ACTIVE)
 begin
  drv.seq_item_port.connect(seqr.seq_item_export);
end
endfunction

endclass 



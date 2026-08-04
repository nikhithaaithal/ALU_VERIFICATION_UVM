class alu_test extends uvm_test;
`uvm_component_utils(alu_test)
 alu_cfg cfg;
 alu_env env1;
 function new( string name = "alu_test", uvm_component parent=null);
  super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  cfg=alu_cfg::type_id::create("cfg");
  if(! uvm_config_db #(virtual alu_if)::get(this,"", "alu_if",cfg.vif))
  `uvm_fatal(get_type_name(),"Test Getting Failed");
   cfg.in_agent_active=UVM_ACTIVE;
   cfg.out_agent_active=UVM_PASSIVE;
  uvm_config_db#(alu_cfg) ::set(this,"*","alu_cfg",cfg);
  env1=alu_env::type_id::create("env1",this);
 endfunction
 
 function void end_of_elaboration_phase(uvm_phase phase);
   super.end_of_elaboration_phase(phase);
   uvm_top.print_topology();
 endfunction
endclass


class test1 extends alu_test;
 `uvm_component_utils(test1)
  seq0 s0;
  seq1 s1;

  function new(string name="test1",uvm_component parent=null);
	super.new(name,parent);
 endfunction


 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0=seq0::type_id::create("s0");
  s1=seq1::type_id::create("s1");

    s0.start(env1.inp_agt.seqr);
    
    s1.start(env1.inp_agt.seqr);
 phase.drop_objection(this);
 endtask 
endclass



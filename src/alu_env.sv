class alu_env extends uvm_env;
`uvm_component_utils(alu_env)
alu_active_agent inp_agt;
alu_passive_agent out_agt;
alu_scoreboard scb;
alu_subscriber sub;
alu_cfg cfg;

function new(string name="alu_env",uvm_component parent);
 super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
 super.build_phase(phase);
 if(! uvm_config_db #(alu_cfg)::get(this,"", "alu_cfg",cfg))
  `uvm_fatal(get_type_name(),"Environment Getting Failed");
 inp_agt= alu_active_agent ::type_id::create("inp_agt",this);
 out_agt= alu_passive_agent ::type_id::create("out_agt",this);
 scb= alu_scoreboard::type_id::create("scb",this);
 sub= alu_subscriber::type_id::create("sub",this);
 endfunction

function void connect_phase (uvm_phase phase);
 super.connect_phase(phase);
 inp_agt.mon_in.inp_monitor_port.connect(scb.inp_mon_fifo.analysis_export);
 out_agt.mon_out.out_monitor_port.connect(scb.out_mon_fifo.analysis_export);
 inp_agt.mon_in.inp_monitor_port.connect(sub.analysis_export);
endfunction
endclass

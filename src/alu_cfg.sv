
class alu_cfg extends uvm_object;
 `uvm_object_utils(alu_cfg)
  virtual alu_if vif;
  uvm_active_passive_enum in_agent_active;
  uvm_active_passive_enum out_agent_active;
  function new(string name ="alu_cfg");
    super.new(name);
 endfunction

endclass

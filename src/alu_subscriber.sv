class alu_subscriber extends uvm_subscriber #(trans);
  `uvm_component_utils(alu_subscriber)
  trans tr;

  
  covergroup alu_cg;
  opa_cp:coverpoint tr.opa{ 
          bins low ={[0:85]};
          bins mid ={[86:170]};       
          bins high ={[171:255]};
   }

  opb_cp:coverpoint tr.opb{ 
          bins low ={[0:85]};
          bins mid ={[86:170]};       
          bins high ={[171:255]};
   }
 
   ce_cp:coverpoint tr.ce{ bins ce_1 ={1}; bins ce_0 = {0};}

   mode_cp:coverpoint tr.mode{ bins mode_1 ={1}; bins mode_0 = {0};}

   cin_cp:coverpoint tr.cin{ bins cin_1 ={1}; bins cin_0 = {0};}

   cmd_cp:coverpoint tr.cmd{ bins cmds ={[0:13]};}
   
   inp_valid_cp:coverpoint tr.inp_valid {bins valid[] = {[0:3]};}
   
   mode_cmd_cp: cross mode_cp,cmd_cp{
    ignore_bins ignore_cmd_mode1 = 
    binsof(mode_cp.mode_1) && binsof(cmd_cp) intersect {11,12,13};}
   
   mode_inp_valid:cross mode_cp,inp_valid_cp;

   cmd_ce_cp:cross cmd_cp,ce_cp;
 
   cmd_cin_cp: cross cmd_cp,cin_cp;
  endgroup 
  function new(string name, uvm_component parent);
   super.new(name,parent);
   alu_cg=new();
  endfunction
  function void write(trans t);
     tr=t;
    //`uvm_info("SUBSCRIBER", $sformatf("Received transaction:\n%s", tr.sprint()), UVM_HIGH)
     alu_cg.sample();
endfunction
endclass

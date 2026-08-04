class alu_driver extends uvm_driver #(trans);
 `uvm_component_utils(alu_driver)
  virtual alu_if.IN_DRV viff;
  alu_cfg dcfg;

  function new(string name="alu_driver",uvm_component parent);
  super.new(name,parent);
 endfunction
  
  function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   if(!uvm_config_db #(alu_cfg)::get(this, "","alu_cfg",dcfg))
   `uvm_fatal(get_type_name(),"Driver getting failed");
  endfunction
 
 function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
   viff=dcfg.vif;
 endfunction

 task run_phase(uvm_phase phase);
 begin 
 @(viff.inp_drv_cb);
  viff.inp_drv_cb.rst<=1'b1;
  @(viff.inp_drv_cb);
  viff.inp_drv_cb.rst<=1'b0;
  forever begin
     seq_item_port.get_next_item(req);
     drive(req);
     seq_item_port.item_done();
  end
 end
 endtask

 task drive(trans data2duv);
 begin
 
   // repeat(3)
  @(viff.inp_drv_cb);  
  viff.inp_drv_cb.opa <= data2duv.opa;
  viff.inp_drv_cb.opb <= data2duv.opb;
  viff.inp_drv_cb.ce <= data2duv.ce;
  viff.inp_drv_cb.mode <= data2duv.mode;
  viff.inp_drv_cb.cmd <= data2duv.cmd;
  viff.inp_drv_cb.inp_valid <= data2duv.inp_valid;
  if(data2duv.mode &&(data2duv.cmd == 4'b0010 || data2duv.cmd == 4'b0011))
    viff.inp_drv_cb.cin <= data2duv.cin;
    //`uvm_info("DRIVER",$sformatf("Input DRIVER\n%s",data2duv.sprint()),UVM_LOW);
     `uvm_info("DRIVER",
  $sformatf("opa=%0d opb=%0d ce=%0b mode=%0b cin=%0b inp_valid=%0b cmd=%0d res=%0d cout=%0b oflow=%0b g=%0b e=%0b l=%0b err=%0b",
             data2duv.opa, data2duv.opb, data2duv.ce, data2duv.mode, data2duv.cin,
             data2duv.inp_valid, data2duv.cmd, data2duv.res, data2duv.cout,
             data2duv.oflow, data2duv.g, data2duv.e, data2duv.l, data2duv.err),
  UVM_LOW)
   repeat(3) @(viff.inp_drv_cb); 
 end
 endtask
endclass

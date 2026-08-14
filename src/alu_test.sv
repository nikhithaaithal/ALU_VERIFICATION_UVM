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

class test_rst extends alu_test;
  `uvm_component_utils(test_rst)

  reset s0;

  function new(string name="test_rst", uvm_component parent=null);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    s0 = reset::type_id::create("s0");

    fork
      begin
        s0.start(env1.inp_agt.seqr);
      end

      begin
        #30;                      
        env1.inp_agt.drv.apply_reset();
      end
    join

    phase.drop_objection(this);

  endtask

endclass
class test1 extends alu_test;
 `uvm_component_utils(test1)
  ari s0;
  function new(string name="test1",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0=ari::type_id::create("s0");
    s0.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass

class logical extends alu_test;
 `uvm_component_utils(logical)

  log s1;
  function new(string name="logical",uvm_component parent=null);
	super.new(name,parent);
 endfunction


 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s1=log::type_id::create("s1");
  s1.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass

// Addition of zeros
class add_zeros_test extends alu_test;
  `uvm_component_utils(add_zeros_test)

  seq3 s3;

  function new(string name="add_zeros_test", uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    s3 = seq3::type_id::create("s3");
    s3.start(env1.inp_agt.seqr);
    phase.drop_objection(this);
  endtask
endclass

// Addition of maximum values
class add_max_test extends alu_test;
  `uvm_component_utils(add_max_test)

  seq4 s4;

  function new(string name="add_max_test", uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    s4 = seq4::type_id::create("s4");
    s4.start(env1.inp_agt.seqr);
    phase.drop_objection(this);
  endtask
endclass


// Subtraction resulting in negative value
class sub_negative_test extends alu_test;
  `uvm_component_utils(sub_negative_test)

  seq5 s5;

  function new(string name="sub_negative_test", uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    s5 = seq5::type_id::create("s5");
    s5.start(env1.inp_agt.seqr);
    phase.drop_objection(this);
  endtask
endclass


// Subtraction of zeros
class sub_zeros_test extends alu_test;
  `uvm_component_utils(sub_zeros_test)

  seq6 s6;

  function new(string name="sub_zeros_test", uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    s6 = seq6::type_id::create("s6");
    s6.start(env1.inp_agt.seqr);
    phase.drop_objection(this);
  endtask
endclass


// Subtraction of maximum values
class sub_max_test extends alu_test;
  `uvm_component_utils(sub_max_test)

  seq7 s7;

  function new(string name="sub_max_test", uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    s7 = seq7::type_id::create("s7");
    s7.start(env1.inp_agt.seqr);
    phase.drop_objection(this);
  endtask
endclass

// Add with carry, zero operands
class add_cin_zero_test extends alu_test;
  `uvm_component_utils(add_cin_zero_test)

  seq8 s8;

  function new(string name="add_cin_zero_test", uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    s8 = seq8::type_id::create("s8");
    s8.start(env1.inp_agt.seqr);
    phase.drop_objection(this);
  endtask
endclass


// Add with carry, maximum operands
class add_cin_max_test extends alu_test;
  `uvm_component_utils(add_cin_max_test)

  seq9 s9;

  function new(string name="add_cin_max_test", uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    s9 = seq9::type_id::create("s9");
    s9.start(env1.inp_agt.seqr);
    phase.drop_objection(this);
  endtask
endclass



// Subtract with carry, zero operands
class sub_cin_zero_test extends alu_test;
  `uvm_component_utils(sub_cin_zero_test)

  seq10 s10;

  function new(string name="sub_cin_zero_test", uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    s10 = seq10::type_id::create("s10");
    s10.start(env1.inp_agt.seqr);
    phase.drop_objection(this);
  endtask
endclass




// Subtract with carry, maximum operands
class sub_cin_max_test extends alu_test;
  `uvm_component_utils(sub_cin_max_test)

  seq11 s11;

  function new(string name="sub_cin_max_test", uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    s11 = seq11::type_id::create("s11");
    s11.start(env1.inp_agt.seqr);
    phase.drop_objection(this);
  endtask
endclass



// Increment OPA at maximum value
class inc_opa_max_test extends alu_test;
  `uvm_component_utils(inc_opa_max_test)

  seq12 s12;

  function new(string name="inc_opa_max_test", uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    s12 = seq12::type_id::create("s12");
    s12.start(env1.inp_agt.seqr);
    phase.drop_objection(this);
  endtask
endclass


// Decrement OPA at zero
class dec_opa_zero_test extends alu_test;
  `uvm_component_utils(dec_opa_zero_test)

  seq14 s14;

  function new(string name="dec_opa_zero_test", uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    s14 = seq14::type_id::create("s14");
    s14.start(env1.inp_agt.seqr);
    phase.drop_objection(this);
  endtask
endclass

// Increment OPB at maximum value
class inc_opb_max_test extends alu_test;
  `uvm_component_utils(inc_opb_max_test)

  seq16 s16;

  function new(string name="inc_opb_max_test", uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    s16 = seq16::type_id::create("s16");
    s16.start(env1.inp_agt.seqr);
    phase.drop_objection(this);
  endtask
endclass

// Decrement OPB at zero
class dec_opb_zero_test extends alu_test;
  `uvm_component_utils(dec_opb_zero_test)

  seq18 s18;

  function new(string name="dec_opb_zero_test", uvm_component parent=null);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    s18 = seq18::type_id::create("s18");
    s18.start(env1.inp_agt.seqr);
    phase.drop_objection(this);
  endtask
endclass

class mul_inc extends alu_test;
 `uvm_component_utils(mul_inc)
  ari9 s0;

  function new(string name="mul_inc",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0=ari9::type_id::create("s0");
  s0.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass

class mul_inc_max extends alu_test;
 `uvm_component_utils(mul_inc_max)

  ari9_max s1;
  function new(string name="mul_inc_max",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);

   s1=ari9_max::type_id::create("s1"); 
   s1.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass
class mul_shl extends alu_test;
 `uvm_component_utils(mul_shl)
  ari10 s0; 
  function new(string name="mul_shl",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0=ari10::type_id::create("s0");
  s0.start(env1.inp_agt.seqr);

 phase.drop_objection(this);

 endtask 
endclass

class mul_shl_max extends alu_test;
 `uvm_component_utils(mul_shl_max)

  ari10_max s1; 
  function new(string name="mul_shl_max",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s1=ari10_max::type_id::create("s1");
  s1.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass

class input_valid_m1 extends alu_test;
 `uvm_component_utils(input_valid_m1)
  seq13 s13;
  seq15 s15;
  seq17 s17;
  seq19 s19;

  function new(string name="input_valid_m1",uvm_component parent=null);
	super.new(name,parent);
 endfunction


 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s13 = seq13::type_id::create("s13");
  s15 = seq15::type_id::create("s15");
  s17 = seq17::type_id::create("s17");
  s19 = seq19::type_id::create("s19");

s13.start(env1.inp_agt.seqr);
s15.start(env1.inp_agt.seqr);
s17.start(env1.inp_agt.seqr);
s19.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass




class input_valid_m0  extends alu_test;
 `uvm_component_utils(input_valid_m0)
  seq_valid_inputs_m0 s0;
  
  function new(string name="input_valid_m0",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0=seq_valid_inputs_m0::type_id::create("s0");
  
    s0.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass


class compare_inputs extends alu_test;
 `uvm_component_utils(compare_inputs)
  compare_seq s0;
  
  function new(string name="compare_inputs",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0=compare_seq::type_id::create("s0");
  
    s0.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass


class cmd_inv extends alu_test;
 `uvm_component_utils(cmd_inv)
  cmd_m1_iv  s0;
  cmd_m0_iv  s1;
  function new(string name="cmd_inv",uvm_component parent=null);
	super.new(name,parent);
 endfunction


 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0=cmd_m1_iv ::type_id::create("s0");
  s1=cmd_m0_iv ::type_id::create("s1");
    s0.start(env1.inp_agt.seqr);
    s1.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass


class input_valid_00 extends alu_test;
 `uvm_component_utils(input_valid_00)
  seq_iv_0 s0;
  
  function new(string name="input_valid_00",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0= seq_iv_0 ::type_id::create("s0");
  s0.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass

class ce_zero extends alu_test;
 `uvm_component_utils(ce_zero)
  seq_ce_zero s0;
  
  function new(string name="ce_zero",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0=seq_ce_zero::type_id::create("s0");
  s0.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass

class test_rotate extends alu_test;
  `uvm_component_utils(test_rotate)

  rotate s0;

  function new(string name = "test_rotate",
               uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    s0 = rotate::type_id::create("s0");
    s0.start(env1.inp_agt.seqr);

    phase.drop_objection(this);
  endtask
endclass

class test_wait_16 extends alu_test;
 `uvm_component_utils(test_wait_16)
  wait_16 s0;
  
  function new(string name="test_wait_16",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0=wait_16::type_id::create("s0");
  
    s0.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass

class test_wait2_16 extends alu_test;
 `uvm_component_utils(test_wait2_16)
  wait2_16 s0;
  
  function new(string name="test_wait2_16",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0=wait2_16::type_id::create("s0");
  
    s0.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass


class test_wait_override extends alu_test;
 `uvm_component_utils(test_wait_override)
  wait_override s0;
  
  function new(string name="test_wait_override",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0=wait_override::type_id::create("s0");
  s0.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass

class test_wait2_override extends alu_test;
 `uvm_component_utils(test_wait2_override)
  wait2_override s0;
  
  function new(string name="test_wait2_override",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0=wait2_override::type_id::create("s0");
  s0.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass
class test_wait_16_err extends alu_test;
 `uvm_component_utils(test_wait_16_err)
  wait_err s0;
  
  function new(string name="test_wait_16_err",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0=wait_err::type_id::create("s0");
  
    s0.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass



class test_wait2_16_err extends alu_test;
 `uvm_component_utils(test_wait2_16_err)
  wait2_err s0;
  
  function new(string name="test_wait2_16_err",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0=wait2_err::type_id::create("s0");
  
    s0.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass


class test_wait_16_mul extends alu_test;
 `uvm_component_utils(test_wait_16_mul)
  wait_16_mul s0;
  
  function new(string name="test_wait_16_mul",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0= wait_16_mul::type_id::create("s0");
  
    s0.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass

class test_wait_16_mul_ov extends alu_test;
 `uvm_component_utils(test_wait_16_mul_ov)
  wait_16_mul_ov s0;
  
  function new(string name="test_wait_16_mul_ov",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0= wait_16_mul_ov::type_id::create("s0");
  
    s0.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass


class test_wait_16_mul_err extends alu_test;
 `uvm_component_utils(test_wait_16_mul_err)
  wait_16_mul_err s0;
  
  function new(string name="test_wait_16_mul_err",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0= wait_16_mul_err::type_id::create("s0");
  
    s0.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass

class test_wait_16_iv extends alu_test;
 `uvm_component_utils(test_wait_16_iv)
  wait_16_iv_00 s0;
  
  function new(string name="test_wait_16_iv",uvm_component parent=null);
	super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  s0= wait_16_iv_00::type_id::create("s0");
  
    s0.start(env1.inp_agt.seqr);
 phase.drop_objection(this);

 endtask 
endclass





class regression extends alu_test;
  `uvm_component_utils(regression)

  // Reset
  reset               s_rst;

  // Basic arithmetic / logical
  ari                 s_ari;
  log                 s_log;

  // Add / Sub directed
  seq3                s3;
  seq4                s4;
  seq5                s5;
  seq6                s6;
  seq7                s7;
  seq8                s8;
  seq9                s9;
  seq10               s10;
  seq11               s11;
  seq12               s12;
  seq14               s14;
  seq16               s16;
  seq18               s18;

  // Multiply
  ari9                s_mul_inc;
  ari9_max            s_mul_inc_max;
  ari10               s_mul_shl;
  ari10_max           s_mul_shl_max;

  // Input valid checks
  seq13               s13;
  seq15               s15;
  seq17               s17;
  seq19               s19;
  seq_valid_inputs_m0 s_iv_m0;

  // Compare / cmd invalid / iv0
  compare_seq         s_cmp;
  cmd_m1_iv           s_cmd_m1_iv;
  cmd_m0_iv           s_cmd_m0_iv;
  seq_iv_0            s_iv_00;

  // Misc
  seq_ce_zero         s_ce_zero;
  rotate              s_rotate;

  // Wait / mul-wait directed
  wait_16             s_wait_16;
  wait2_16            s_wait2_16;
  wait_override       s_wait_ovr;
  wait2_override      s_wait2_ovr;
  wait_err            s_wait_err;
  wait2_err           s_wait2_err;
  wait_16_mul         s_wait_16_mul;
  wait_16_mul_ov      s_wait_16_mul_ov;
  wait_16_mul_err     s_wait_16_mul_err;
  wait_16_iv_00       s_wait_16_iv;

  function new(string name = "regression", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    // ---- Reset (parallel apply_reset like test_rst) ----
    s_rst = reset::type_id::create("s_rst");
    fork
      begin
        s_rst.start(env1.inp_agt.seqr);
      end
      begin
        #30;
        env1.inp_agt.drv.apply_reset();
      end
    join

    // ---- Basic arithmetic / logical ----
    s_ari = ari::type_id::create("s_ari");
    s_ari.start(env1.inp_agt.seqr);

    s_log = log::type_id::create("s_log");
    s_log.start(env1.inp_agt.seqr);

    // ---- Add / Sub directed ----
    s3 = seq3::type_id::create("s3");   s3.start(env1.inp_agt.seqr);
    s4 = seq4::type_id::create("s4");   s4.start(env1.inp_agt.seqr);
    s5 = seq5::type_id::create("s5");   s5.start(env1.inp_agt.seqr);
    s6 = seq6::type_id::create("s6");   s6.start(env1.inp_agt.seqr);
    s7 = seq7::type_id::create("s7");   s7.start(env1.inp_agt.seqr);
    s8 = seq8::type_id::create("s8");   s8.start(env1.inp_agt.seqr);
    s9 = seq9::type_id::create("s9");   s9.start(env1.inp_agt.seqr);
    s10 = seq10::type_id::create("s10"); s10.start(env1.inp_agt.seqr);
    s11 = seq11::type_id::create("s11"); s11.start(env1.inp_agt.seqr);
    s12 = seq12::type_id::create("s12"); s12.start(env1.inp_agt.seqr);
    s14 = seq14::type_id::create("s14"); s14.start(env1.inp_agt.seqr);
    s16 = seq16::type_id::create("s16"); s16.start(env1.inp_agt.seqr);
    s18 = seq18::type_id::create("s18"); s18.start(env1.inp_agt.seqr);

    // ---- Multiply ----
    s_mul_inc = ari9::type_id::create("s_mul_inc");
    s_mul_inc.start(env1.inp_agt.seqr);

    s_mul_inc_max = ari9_max::type_id::create("s_mul_inc_max");
    s_mul_inc_max.start(env1.inp_agt.seqr);

    s_mul_shl = ari10::type_id::create("s_mul_shl");
    s_mul_shl.start(env1.inp_agt.seqr);

    s_mul_shl_max = ari10_max::type_id::create("s_mul_shl_max");
    s_mul_shl_max.start(env1.inp_agt.seqr);

    // ---- Input valid checks ----
    s13 = seq13::type_id::create("s13"); s13.start(env1.inp_agt.seqr);
    s15 = seq15::type_id::create("s15"); s15.start(env1.inp_agt.seqr);
    s17 = seq17::type_id::create("s17"); s17.start(env1.inp_agt.seqr);
    s19 = seq19::type_id::create("s19"); s19.start(env1.inp_agt.seqr);

    s_iv_m0 = seq_valid_inputs_m0::type_id::create("s_iv_m0");
    s_iv_m0.start(env1.inp_agt.seqr);

    // ---- Compare / cmd invalid / iv0 ----
    s_cmp = compare_seq::type_id::create("s_cmp");
    s_cmp.start(env1.inp_agt.seqr);

    s_cmd_m1_iv = cmd_m1_iv::type_id::create("s_cmd_m1_iv");
    s_cmd_m1_iv.start(env1.inp_agt.seqr);

    s_cmd_m0_iv = cmd_m0_iv::type_id::create("s_cmd_m0_iv");
    s_cmd_m0_iv.start(env1.inp_agt.seqr);

    s_iv_00 = seq_iv_0::type_id::create("s_iv_00");
    s_iv_00.start(env1.inp_agt.seqr);

    // ---- Misc ----
    s_ce_zero = seq_ce_zero::type_id::create("s_ce_zero");
    s_ce_zero.start(env1.inp_agt.seqr);

    s_rotate = rotate::type_id::create("s_rotate");
    s_rotate.start(env1.inp_agt.seqr);

    // ---- Wait / mul-wait directed ----
    s_wait_16 = wait_16::type_id::create("s_wait_16");
    s_wait_16.start(env1.inp_agt.seqr);

    s_wait2_16 = wait2_16::type_id::create("s_wait2_16");
    s_wait2_16.start(env1.inp_agt.seqr);

    s_wait_ovr = wait_override::type_id::create("s_wait_ovr");
    s_wait_ovr.start(env1.inp_agt.seqr);

    s_wait2_ovr = wait2_override::type_id::create("s_wait2_ovr");
    s_wait2_ovr.start(env1.inp_agt.seqr);

    s_wait_err = wait_err::type_id::create("s_wait_err");
    s_wait_err.start(env1.inp_agt.seqr);

    s_wait2_err = wait2_err::type_id::create("s_wait2_err");
    s_wait2_err.start(env1.inp_agt.seqr);

    s_wait_16_mul = wait_16_mul::type_id::create("s_wait_16_mul");
    s_wait_16_mul.start(env1.inp_agt.seqr);

    s_wait_16_mul_ov = wait_16_mul_ov::type_id::create("s_wait_16_mul_ov");
    s_wait_16_mul_ov.start(env1.inp_agt.seqr);

    s_wait_16_mul_err = wait_16_mul_err::type_id::create("s_wait_16_mul_err");
    s_wait_16_mul_err.start(env1.inp_agt.seqr);

    s_wait_16_iv = wait_16_iv_00::type_id::create("s_wait_16_iv");
    s_wait_16_iv.start(env1.inp_agt.seqr);

    phase.drop_objection(this);
  endtask

endclass

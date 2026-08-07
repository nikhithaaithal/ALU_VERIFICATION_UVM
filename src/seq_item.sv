`include "defines.sv"

class trans extends uvm_sequence_item;
 rand logic [`DW-1:0] opa;
 rand logic [`DW-1:0] opb;
 rand logic ce;
 rand logic mode;
 rand logic cin;
 rand logic [1:0]inp_valid;
 randc logic [`CW-1:0]cmd;
 //rand bit flag;
 logic [(`DW*2)-1:0]res;
 logic cout,oflow,g,e,l,err;
 bit rst;
 constraint c1{ opa inside {[0:255]};}
 constraint c2{ opb inside {[0:255]};}
 constraint c3{ cin dist{1'b1:=10 ,1'b0:=10};}
 constraint c4{ ce dist{1'b1:=90 ,1'b0:=10};}
 constraint c5{ mode dist{1'b1:=10 ,1'b0:=10};}
 constraint c6{ if(mode) soft cmd inside {[0:10]};
                else     soft cmd inside {[0:13]};}
constraint c7 {inp_valid dist{2'b00:=5,2'b01:=5,2'b10:=5,2'b11:=100};}
 /*
constraint c8 {
                if(mode==1 && (cmd ==9 || cmd ==10))flag==1;
                else flag == 0;
	      } */
`uvm_object_utils_begin(trans)
`uvm_field_int(opa,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(opb,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(ce,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(mode,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(cin,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(inp_valid,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(cmd,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(res,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(cout,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(oflow,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(g,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(e,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(l,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(err,UVM_ALL_ON|UVM_DEC)
//`uvm_field_int(flag,UVM_ALL_ON|UVM_DEC)
`uvm_object_utils_end

function new(string name ="trans");
 super.new(name);
endfunction



endclass

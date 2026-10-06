
class alu_scoreboard extends uvm_scoreboard;
 `uvm_component_utils(alu_scoreboard)
 
 uvm_tlm_analysis_fifo #(trans) inp_mon_fifo;
 uvm_tlm_analysis_fifo #(trans) out_mon_fifo;
 
 trans inp;
 trans out;

 bit[7:0]oprd1,oprd2;
 bit[3:0]CMD_tmp;
 bit[7:0]AU_out_tmp1,AU_out_tmp2,OPA_1,OPB_1;
 bit [4:0] wait_state;
 bit iv_1,iv_2;
 bit MODE_tmp;
 
 function new( string name="alu_scoreboard",uvm_component parent);
 super.new(name,parent);
  inp_mon_fifo=new("inp_mon_fifo",this);
  out_mon_fifo= new("out_mon_fifo",this);
 endfunction

 function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  endfunction

 task run_phase(uvm_phase phase);
  forever 
    begin
      inp_mon_fifo.get(inp);
      out_mon_fifo.get(out);
      ref_model(inp);
      `uvm_info("REFERENCE_MODEL",$sformatf("REFERENCE_MODEL\n%s",inp.sprint()),UVM_NONE)
       $display("Wait_count= %d",wait_state);
       check_data(out);
       //validate_output();

    end
 endtask

task check_data(trans ch);
 begin
  if(inp.res == ch.res)

      $display("\n RES IS  MATCHING");
  else 
      $display("\n RES IS NOT MATCHING");

  if(inp.cout == ch.cout)
      $display("\n COUT IS  MATCHING");
  else 
      $display("\n COUT IS NOT MATCHING");

  if(inp.oflow== ch.oflow)
      $display("\n OFLOW IS  MATCHING");
  else 
      $display("\n OFLOW IS NOT MATCHING");

  if(inp.g === ch.g)
      $display("\n GREATER IS  MATCHING");
  else 
      $display("\n GREATER IS NOT MATCHING");
  if(inp.l === ch.l)
      $display("\n LESSER  IS  MATCHING");
  else 
      $display("\n LESSER IS NOT MATCHING");
  if(inp.e === ch.e)
      $display("\n EQUAL IS  MATCHING");
  else 
      $display("\n EQUAL IS NOT MATCHING");
  if(inp.err == ch.err)
      $display("\n ERROR IS  MATCHING");
  else 
      $display("\n ERROR IS NOT MATCHING");

 end
endtask

task clear_operands();
begin
    iv_1       = 0;
    iv_2       = 0;
    oprd1      = 0;
    oprd2      = 0;
    CMD_tmp    = 0;
    MODE_tmp   = 0;
    wait_state = 0;
end
endtask



virtual task ref_model(trans t);
       if(t.rst) begin
        clear_operands();
             t.res    = 0;
             t.cout   = 0;
   	     t.oflow  = 0;
    	     t.g      = 0;
 	     t.e      = 0;
  	     t.l      = 0;
  	     t.err    = 0;
        return;
      end
      else if(t.ce)begin
        if (t.inp_valid==2'b01)  begin
        oprd1=t.opa;
        CMD_tmp=t.cmd;
        MODE_tmp=t.mode;
        iv_1=1;
        if(t.mode && (CMD_tmp == 0 ||CMD_tmp == 1|| CMD_tmp == 2 || CMD_tmp == 3 || CMD_tmp == 8 || CMD_tmp == 9 || CMD_tmp == 10))
         begin
             wait_state ++;
         end
        else if(!t.mode && (CMD_tmp == 0 ||CMD_tmp == 1|| CMD_tmp == 2 || CMD_tmp == 3 || CMD_tmp == 4 || CMD_tmp == 5 || CMD_tmp == 12 || CMD_tmp == 13))
            begin
             wait_state ++;
            end
      end

     else if (t.inp_valid==2'b10)  begin    
        oprd2=t.opb;
        CMD_tmp=t.cmd;
         MODE_tmp=t.mode;
        iv_2=1;
        if(t.mode && (CMD_tmp == 0 ||CMD_tmp == 1|| CMD_tmp == 2 || CMD_tmp == 3 || CMD_tmp == 8 || CMD_tmp == 9 || CMD_tmp == 10))
         begin
             wait_state ++;
         end
        else if(!t.mode && (CMD_tmp == 0 ||CMD_tmp == 1|| CMD_tmp == 2 || CMD_tmp == 3 || CMD_tmp == 4 || CMD_tmp == 5 || CMD_tmp == 12 || CMD_tmp == 13))
            begin
             wait_state ++;
            end

      end
      else if (t.inp_valid==2'b11)  begin    
        oprd1=t.opa;
	oprd2=t.opb;
        CMD_tmp=t.cmd;
        MODE_tmp=t.mode;
        iv_1=1;
        iv_2=1;
      end

      else if(t.inp_valid==2'b00)  begin    
        if(wait_state==0) clear_operands();
        else  wait_state ++;
      end 


/////////////// wait state reset/////////
/*
    if( iv_1 && iv_2)
      wait_state=0;
    else if ( wait_state > 0 && wait_state<16 &&(CMD_tmp != t.cmd || MODE_tmp != t.mode))
     begin 
      wait_state =0;
      //clear_operands();
      end
    else if(wait_state > 16)
       begin
         wait_state=0;
  	 t.err=1;
         clear_operands();
       end
      end
*/


     if(t.ce)                   
        begin
         if(t.rst)                
          begin
            clear_operands();
             t.res    = 0;
             t.cout   = 0;
   	     t.oflow  = 0;
    	     t.g      = 0;
 	     t.e      = 0;
  	     t.l      = 0;
  	     t.err    = 0;
        return;
	  end
 
         else if(t.mode)          
         begin
	 
            t.res=0;
            t.cout=1'b0;
            t.oflow=1'b0;
            t.g=1'b0;
            t.e=1'b0;
            t.l=1'b0;
            t.err=1'b0;
	case(CMD_tmp)             
    4'b0000: begin
              if( iv_1 && iv_2) begin   
              t.res=oprd1+oprd2;
	      t.cout=t.res[8]?1:0;end
            end
     4'b0001 :begin
             if( iv_1 && iv_2) begin 
             t.oflow=(oprd1<oprd2)?1:0;
             t.res=oprd1-oprd2;end
            end
     4'b0010:            
            begin
	     if( iv_1 && iv_2) begin 
             t.res=oprd1+oprd2+t.cin;
             t.cout=t.res[8]?1:0;end
            end
     4'b0011:             
           begin
            if( iv_1 && iv_2) begin 
            t.oflow=(oprd1<oprd2)?1:0;
            t.res=oprd1-oprd2-t.cin;end
           end
     4'b0100:t.res=oprd1+1;     
     4'b0101:t.res=oprd1-1;    
     4'b0110:t.res=oprd2+1;     
     4'b0111:t.res=oprd2-1; 
     4'b1000:              
           begin
           if( iv_1 && iv_2) begin 
            t.res=0;
            if(oprd1==oprd2)
             begin
               t.e=1'b1;
               t.g=1'b0;
               t.l=1'b0;
             end
            else if(oprd1>oprd2)
             begin
               t.e=1'b0;
               t.g=1'b1;
               t.l=1'b0;
             end
            else 
             begin
               t.e=1'b0;
               t.g=1'b0;
               t.l=1'b1;
              end
             end
           end

	4'b1001: begin  
                    if( iv_1 && iv_2) begin  
                    AU_out_tmp1 = oprd1 + 1;
                    AU_out_tmp2 = oprd2 + 1;
                    t.res =AU_out_tmp1 * AU_out_tmp2;end
                  end
	4'b1010: begin   
                    if( iv_1 && iv_2) begin 
                    AU_out_tmp1 = oprd1 << 1;
                    AU_out_tmp2 = oprd2;
                    t.res =AU_out_tmp1 * AU_out_tmp2; end
                  end

	default:   
            begin
            t.res=0;
            t.cout=1'b0;
            t.oflow=1'b0;
            t.g=1'b0;
            t.e=1'b0;
            t.l=1'b0;
            t.err=1'b0;
            wait_state=0;
           end
          endcase
          //clear_operands();
         end

	else          
        begin 
            t.res=0;
            t.cout=1'b0;
            t.oflow=1'b0;
            t.g=1'b0;
            t.e=1'b0;
            t.l=1'b0;
            t.err=1'b0;

	case(CMD_tmp)    
             4'b0000: begin if( iv_1 && iv_2) t.res={1'b0,oprd1&oprd2};   end   
             4'b0001: begin if( iv_1 && iv_2) t.res={1'b0,~(oprd1&oprd2)};end
	     4'b0010: begin if( iv_1 && iv_2) t.res={1'b0,oprd1|oprd2};   end
 	     4'b0011: begin if( iv_1 && iv_2) t.res={1'b0,~(oprd1|oprd2)};end
	     4'b0100: begin if( iv_1 && iv_2) t.res={1'b0,oprd1^oprd2};   end
             4'b0101: begin if( iv_1 && iv_2) t.res={1'b0,~(oprd1^oprd2)};end
 	     4'b0110:t.res={1'b0,~oprd1};       
             4'b0111:t.res={1'b0,~oprd2};        
	     4'b1000:t.res={1'b0,oprd1>>1};       
             4'b1001:t.res={1'b0,oprd1<<1};
	     4'b1010:t.res={1'b0,oprd2>>1};      
             4'b1011:t.res={1'b0,oprd2<<1};      
	     4'b1100:                        
             begin 
              if( iv_1 && iv_2) begin
               if(oprd2[0])
                 OPA_1 = {oprd1[6:0], oprd1[7]};
               else
                 OPA_1 = oprd1;
 
               if(oprd2[1])
                 OPB_1 =  {OPA_1[5:0], OPA_1[7:6]}; 
               else
                 OPB_1= OPA_1;
 
               if(oprd2[2])
                 t.res =  {OPB_1[3:0], OPB_1[7:4]} ;
               else
                 t.res = OPB_1;
 
               if(oprd2[4] | oprd2[5] | oprd2[6] | oprd2[7])
                 t.err=1'b1;

             end
 	    end
	4'b1101:                       
             begin
             if( iv_1 && iv_2) begin
               if(oprd2[0])
                 OPA_1 = {oprd1[0], oprd1[7:1]};
               else
                 OPA_1 = oprd1;
               if(oprd2[1])
                 OPB_1 =  {OPA_1[1:0], OPA_1[7:2]}; 
               else
                 OPB_1= OPA_1;
               if(oprd2[2])
                 t.res =  {OPB_1[3:0], OPB_1[7:4]} ;
               else
                 t.res = OPB_1;
               if(oprd2[4] | oprd2[5] | oprd2[6] | oprd2[7])
                 t.err=1'b1;
             end
             end
             default:    
               begin
              t.res=0;
              t.cout=1'b0;
              t.oflow=1'b0;
              t.g=1'b0;
              t.e=1'b0;
              t.l=1'b0;
              t.err=1'b0;
	      wait_state=0;
               end
          endcase
         //clear_operands();
     end
    end


   if((t.mode && t.cmd >10) || (!t.mode && t.cmd >13) )
    t.err=1;

    if( iv_1 && iv_2)
      wait_state=0;
    else if ( wait_state > 0 && wait_state<16 &&(CMD_tmp != t.cmd || MODE_tmp != t.mode))
     begin 
      wait_state =0;
      
      end
    else if(wait_state > 16)
       begin
         wait_state=0;
  	 t.err=1;
         clear_operands();
       end
      end
endtask 


 

endclass

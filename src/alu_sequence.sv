class reset extends uvm_sequence #(trans);
 `uvm_object_utils(reset)
 function new(string name ="reset");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
   start_item(req);
      assert(req.randomize() with { mode ==1'b0; cmd == 1;opa==12; opb==5; inp_valid == 2'b11; });
    finish_item(req);

   end
 endtask
endclass







//Arithmetic operation
class ari extends uvm_sequence #(trans);
 `uvm_object_utils(ari)
 function new(string name ="ari");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
    for(int i=0;i<=8;i++)begin
    start_item(req);
      assert(req.randomize() with {mode == 1;cmd==i;inp_valid == 2'b11; });
    finish_item(req);end
  end
 endtask
endclass


//Logical operation
class log extends uvm_sequence #(trans);
 `uvm_object_utils(log)
 function new(string name ="log");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
    for(int i=0;i<=13;i++)begin
    start_item(req);
      assert(req.randomize() with {mode ==1'b0;cmd==i; inp_valid == 2'b11;});
    finish_item(req);end
  end
 endtask
endclass





//addition of zeros
class seq3 extends uvm_sequence #(trans);
 `uvm_object_utils(seq3)
 function new(string name ="seq3");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
  begin
    start_item(req);
      assert(req.randomize() with {mode ==1'b1; cmd == 0; opa==0; opb==0;inp_valid == 2'b11;});
    finish_item(req);
  end
 endtask
endclass



//addition of max values
class seq4 extends uvm_sequence #(trans);
 `uvm_object_utils(seq4)
 function new(string name ="seq4");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
  begin
    start_item(req);
      assert(req.randomize() with {mode ==1'b1; cmd == 0; opa==255; opb==255;inp_valid == 2'b11;});
    finish_item(req);
  end
 endtask
endclass



//sub_negative
class seq5 extends uvm_sequence #(trans);
 `uvm_object_utils(seq5)
 function new(string name ="seq5");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with {mode ==1'b1; cmd == 1; opa==10; opb==50;});
    finish_item(req);
  end
 endtask
endclass

//sub zeros
class seq6 extends uvm_sequence #(trans);
 `uvm_object_utils(seq6)
 function new(string name ="seq6");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with {  mode ==1'b1; cmd == 1; opa==0; opb==0; inp_valid == 2'b11; });
    finish_item(req);
   end
 endtask
endclass

//sub max_value
class seq7 extends uvm_sequence #(trans);
 `uvm_object_utils(seq7)
 function new(string name ="seq7");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with {  mode ==1'b1; cmd == 1; opa==255; opb==255;inp_valid == 2'b11; });
    finish_item(req);
   end
 endtask
endclass

//addition cin_inp_zeros
class seq8 extends uvm_sequence #(trans);
 `uvm_object_utils(seq8)
 function new(string name ="seq8");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 2; opa==0; opb==0; cin==1; inp_valid==2'b11;  });
    finish_item(req);
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 2; opa==0; opb==0; cin==0; inp_valid==2'b11;  });
    finish_item(req);
   end
 endtask
endclass

//add_cin_max_value
class seq9 extends uvm_sequence #(trans);
 `uvm_object_utils(seq9)
 function new(string name ="seq9");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 2; opa==255; opb==255; cin==1; inp_valid==2'b11; });
    finish_item(req);
   end
 endtask
endclass

//sub_with_cin_zero
class seq10 extends uvm_sequence #(trans);
 `uvm_object_utils(seq10)
 function new(string name ="seq10");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 3; opa==0; opb==0; cin==1; inp_valid==2'b11; });
    finish_item(req);
   end
 endtask
endclass

//sub_with_cin_max
class seq11 extends uvm_sequence #(trans);
 `uvm_object_utils(seq11)
 function new(string name ="seq11");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 3; opa==255; opb==255; cin==1; inp_valid==2'b11; });
    finish_item(req);
   end
 endtask
endclass

//Inc opa with max
class seq12 extends uvm_sequence #(trans);
 `uvm_object_utils(seq12)
 function new(string name ="seq12");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 4; opa==255; inp_valid==2'b11; });
    finish_item(req);
   end
 endtask
endclass

//inc opa invalid
class seq13 extends uvm_sequence #(trans);
 `uvm_object_utils(seq13)
 function new(string name ="seq13");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 4; opa==10; inp_valid==2'b01; });
    finish_item(req);
   end
 endtask
endclass

//Dec opa with zero input
class seq14 extends uvm_sequence #(trans);
 `uvm_object_utils(seq14)
 function new(string name ="seq14");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 5; opa==0; inp_valid==2'b11; });
    finish_item(req);
   end
 endtask
endclass

class seq15 extends uvm_sequence #(trans);
 `uvm_object_utils(seq15)
 function new(string name ="seq15");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
    begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 5; opa==10; inp_valid==2'b01; });
    finish_item(req);
   end
 endtask
endclass


class seq16 extends uvm_sequence #(trans);
 `uvm_object_utils(seq16)
 function new(string name ="seq16");
   super.new(name);
 endfunction
 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 6; opb==255; inp_valid==2'b11; });
    finish_item(req);
   end
 endtask
endclass

//inc opb with invalid inputs
class seq17 extends uvm_sequence #(trans);
 `uvm_object_utils(seq17)
 function new(string name ="seq17");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 6; opb==10; inp_valid==2'b10; });
    finish_item(req);
   end
 endtask
endclass

class seq18 extends uvm_sequence #(trans);
 `uvm_object_utils(seq18)
 function new(string name ="seq18");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 7; opb==0; inp_valid==2'b11; });
    finish_item(req);
   end
 endtask
endclass

class seq19 extends uvm_sequence #(trans);
 `uvm_object_utils(seq19)
 function new(string name ="seq19");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 7; opb==23; inp_valid==2'b10; });
    finish_item(req);
   end
 endtask
endclass

class compare_seq extends uvm_sequence #(trans);
 `uvm_object_utils(compare_seq)
 function new(string name ="compare_seq");
   super.new(name);
 endfunction
 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 8;opa==12; opb==5; inp_valid == 2'b11; });
    finish_item(req);
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 8;opa==23; opb==23; inp_valid == 2'b11; });
    finish_item(req);
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 8;opa==55; opb==58; inp_valid == 2'b11; });
    finish_item(req);
   end
 endtask
endclass


class seq_valid_inputs_m0 extends uvm_sequence #(trans);
  `uvm_object_utils(seq_valid_inputs_m0)

  function new(string name="seq_valid_inputs_m0");
    super.new(name);
  endfunction

  task body();
    req = trans::type_id::create("req");

   start_item(req);
      assert(req.randomize() with {
        mode == 0;
        cmd ==6;
        inp_valid == 2'b01;
      });
      finish_item(req);

    start_item(req);
      assert(req.randomize() with {
        mode == 0;
        cmd ==7;
        inp_valid == 2'b10;
      });
      finish_item(req);

    for(int i=8;i<10;i++)begin
      start_item(req);
      assert(req.randomize() with {
        mode == 0;
        cmd ==i;
        inp_valid == 2'b01;
        ce ==1;
      });
      finish_item(req);
       end

    for(int i=10;i<=11;i++)begin
      start_item(req);
      assert(req.randomize() with {
        mode      == 0;
        cmd       == i;
        inp_valid == 2'b10;
      });
      finish_item(req);
    end
  endtask
endclass



//Arithmetic 9
class ari9 extends uvm_sequence #(trans);
 `uvm_object_utils(ari9)
 function new(string name ="ari9");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
  begin
  repeat(3)
    begin
      wait_for_grant();
      assert(req.randomize() with {mode ==1'b1; cmd inside {9};inp_valid == 2'b11;});
      send_request(req);
      wait_for_item_done();
    end
  end
 endtask
endclass


//arithmetic 10
class ari10 extends uvm_sequence #(trans);
 `uvm_object_utils(ari10)
 function new(string name ="ari10");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
  begin
  repeat(5)begin
    wait_for_grant();
      assert(req.randomize() with {mode ==1'b1; cmd inside {10};inp_valid == 2'b11;opa==22; opb==8;});
      send_request(req);
      wait_for_item_done();
  end
  end
 endtask
endclass




// Inc_max_inp_values and mul
class ari9_max extends uvm_sequence #(trans);
 `uvm_object_utils(ari9_max)
 function new(string name ="ari9_max");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 9; opa==255; opb==255; inp_valid == 2'b11;});
    finish_item(req);
   end
 endtask
endclass

//  shift_mul max value of Opa
class ari10_max extends uvm_sequence #(trans);
 `uvm_object_utils(ari10_max)
 function new(string name ="ari10_max");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 10; opa==255; opb==255;inp_valid == 2'b11; });
    finish_item(req);
   end
 endtask
endclass

class rotate extends uvm_sequence #(trans);
  `uvm_object_utils(rotate)

  function new(string name = "rotate");
    super.new(name);
  endfunction

  task body();
    req = trans::type_id::create("req");

    begin
      // CMD 12
      wait_for_grant();
      assert(req.randomize() with {
        mode == 1'b0;
        cmd == 4'd12;
        inp_valid == 2'b11;
        opb == 8'b0001_0000;
      });
      send_request(req);
      wait_for_item_done();

      wait_for_grant();
      assert(req.randomize() with {
        mode == 1'b0;
        cmd == 4'd12;
        inp_valid == 2'b11;
        opb == 8'b0010_0000;
      });
      send_request(req);
      wait_for_item_done();

      wait_for_grant();
      assert(req.randomize() with {
        mode == 1'b0;
        cmd == 4'd12;
        inp_valid == 2'b11;
        opb == 8'b0100_0000;
      });
      send_request(req);
      wait_for_item_done();

      wait_for_grant();
      assert(req.randomize() with {
        mode == 1'b0;
        cmd == 4'd12;
        inp_valid == 2'b11;
        opb == 8'b1000_0000;
      });
      send_request(req);
      wait_for_item_done();

      // CMD 13
      wait_for_grant();
      assert(req.randomize() with {
        mode == 1'b0;
        cmd == 4'd13;
        inp_valid == 2'b11;
        opb == 8'b0001_0000;
      });
      send_request(req);
      wait_for_item_done();

      wait_for_grant();
      assert(req.randomize() with {
        mode == 1'b0;
        cmd == 4'd13;
        inp_valid == 2'b11;
        opb == 8'b0010_0000;
      });
      send_request(req);
      wait_for_item_done();

      wait_for_grant();
      assert(req.randomize() with {
        mode == 1'b0;
        cmd == 4'd13;
        inp_valid == 2'b11;
        opb == 8'b0100_0000;
      });
      send_request(req);
      wait_for_item_done();

      wait_for_grant();
      assert(req.randomize() with {
        mode == 1'b0;
        cmd == 4'd13;
        inp_valid == 2'b11;
        opb == 8'b1000_0000;
      });
      send_request(req);
      wait_for_item_done();
    end
  endtask
endclass
////wait states
class wait_16 extends uvm_sequence #(trans);
 `uvm_object_utils(wait_16)
 function new(string name ="wait_16");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
   repeat(10) 
   begin
    start_item(req);
      assert(req.randomize() with {mode == 1;opa == 29; opb ==19;cmd inside {0};inp_valid == 2'b01;ce==1;});
    finish_item(req);
   end

   start_item(req);
      assert(req.randomize() with {mode == 1;opa == 29; opb ==19;cmd inside {0};inp_valid == 2'b10;ce ==1; });
    finish_item(req);
  end
 endtask
endclass

class wait2_16 extends uvm_sequence #(trans);
 `uvm_object_utils(wait2_16)
 function new(string name ="wait2_16");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
   repeat(10) 
   begin
    start_item(req);
      assert(req.randomize() with {mode == 1;opa == 29; opb ==19;cmd inside {0};inp_valid == 2'b10;ce==1; });
    finish_item(req);
   end

   start_item(req);
      assert(req.randomize() with {mode == 1;opa == 29; opb ==19;cmd inside {0};inp_valid == 2'b01;ce ==1; });
    finish_item(req);
  end
 endtask
endclass

class wait_override extends uvm_sequence #(trans);
 `uvm_object_utils(wait_override)
 function new(string name ="wait_override");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
   repeat(10) begin
    start_item(req);
      assert(req.randomize() with {mode == 1;opa == 29; opb ==19;cmd inside {0};inp_valid == 2'b01; ce ==1;});
    finish_item(req);
    end
   start_item(req);
      assert(req.randomize() with {mode == 1;opa == 15; opb ==19;cmd inside {0};inp_valid == 2'b11; ce ==1;});
    finish_item(req);
  end
 endtask
endclass

class wait2_override extends uvm_sequence #(trans);
 `uvm_object_utils(wait2_override)
 function new(string name ="wait2_override");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
   repeat(10) begin
    start_item(req);
      assert(req.randomize() with {mode == 1;opa == 29; opb ==19;cmd inside {0};inp_valid == 2'b10; ce ==1;});
    finish_item(req);
    end
   start_item(req);
      assert(req.randomize() with {mode == 1;opa == 15; opb ==19;cmd inside {0};inp_valid == 2'b11; ce ==1;});
    finish_item(req);
  end
 endtask
endclass
class seq_cmd_change extends uvm_sequence #(trans);
 `uvm_object_utils(seq_cmd_change)
 function new(string name ="seq_cmd_change");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
   repeat(10) begin
    start_item(req);
      assert(req.randomize() with {mode == 1;opa == 29; opb ==19;cmd inside {0};inp_valid == 2'b01; ce ==1;});
    finish_item(req);
    end
   start_item(req);
      assert(req.randomize() with {mode == 1;opa == 29; opb ==19;cmd inside {3};inp_valid == 2'b11; ce ==1;});
    finish_item(req);
  end
 endtask
endclass


class wait_err extends uvm_sequence #(trans);
 `uvm_object_utils(wait_err)
 function new(string name ="wait_err");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
   repeat(18) begin
    start_item(req);
      assert(req.randomize() with {mode == 1;opa == 29; opb ==19;cmd inside {0};inp_valid == 2'b01;ce ==1; });
    finish_item(req);
  end
  end
 endtask
endclass

class wait2_err extends uvm_sequence #(trans);
 `uvm_object_utils(wait2_err)
 function new(string name ="wait2_err");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
   repeat(18) begin
    start_item(req);
      assert(req.randomize() with {mode == 1;opa == 29; opb ==19;cmd inside {0};inp_valid == 2'b10;ce ==1; });
    finish_item(req);
  end
  end
 endtask
endclass
////wait states mul
class wait_16_mul extends uvm_sequence #(trans);
 `uvm_object_utils(wait_16_mul)
 function new(string name ="wait_16_mul");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
   repeat(10) 
   begin
    start_item(req);
      assert(req.randomize() with {mode == 1;opa == 9; opb ==9;cmd inside {9};inp_valid == 2'b01;ce==1; });
    finish_item(req);
   end

   start_item(req);
      assert(req.randomize() with {mode == 1;opa == 9; opb ==9;cmd inside {9};inp_valid == 2'b10;ce ==1; });
    finish_item(req);
  end
 endtask
endclass


class wait_16_mul_ov extends uvm_sequence #(trans);
 `uvm_object_utils(wait_16_mul_ov)
 function new(string name ="wait_16_mul_ov");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
   repeat(10) 
   begin
    start_item(req);
      assert(req.randomize() with {mode == 1;opa == 9; opb ==9;cmd inside {9};inp_valid == 2'b01;ce==1; });
    finish_item(req);
   end

   start_item(req);
      assert(req.randomize() with {mode == 1;opa == 12; opb ==10;cmd inside {9};inp_valid == 2'b10;ce ==1; });
    finish_item(req);
  end
 endtask
endclass

class wait_16_mul_err extends uvm_sequence #(trans);
 `uvm_object_utils(wait_16_mul_err)
 function new(string name ="wait_16_mul_err");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
   repeat(17) 
   begin
    start_item(req);
      assert(req.randomize() with {mode == 1;opa == 9; opb ==9;cmd inside {9};inp_valid == 2'b01;ce==1; });
    finish_item(req);
   end

  end
 endtask
endclass

class wait_16_iv_00 extends uvm_sequence #(trans);
 `uvm_object_utils(wait_16_iv_00)
 function new(string name ="wait_16_iv_00");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
   repeat(5) 
   begin
    start_item(req);
      assert(req.randomize() with {mode == 1;opa == 9; opb ==9;cmd inside {9};inp_valid == 2'b01;ce==1; });
    finish_item(req);
   end
   repeat(5)begin
   start_item(req);
      assert(req.randomize() with {mode == 1;opa == 9; opb ==10;cmd inside {9};inp_valid == 2'b00;ce ==1; });
    finish_item(req);
   end
   start_item(req);
      assert(req.randomize() with {mode == 1;opa == 9; opb ==10;cmd inside {9};inp_valid == 2'b10;ce ==1; });
    finish_item(req);
  end
 endtask
endclass


//input valid is 00
class seq_iv_0 extends uvm_sequence #(trans);
 `uvm_object_utils(seq_iv_0)
 function new(string name ="seq_iv_0");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with {mode == 1;cmd inside {4,5,6,7};inp_valid == 2'b00; });
    finish_item(req);
   start_item(req);
      assert(req.randomize() with {mode == 0;cmd inside {6,7,8,9,10,11};inp_valid == 2'b00; });
    finish_item(req);

  end
 endtask
endclass



class seq_ce_zero extends uvm_sequence #(trans);
 `uvm_object_utils(seq_ce_zero)
 function new(string name ="seq_ce_zero");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with {cmd==2;mode ==1;opa==23;opb==91;cin==1;ce ==0;});
    finish_item(req);
    start_item(req);
      assert(req.randomize() with {ce == 0;});
    finish_item(req);
  end
 endtask
endclass




//cmd invalid
class cmd_m1_iv extends uvm_sequence #(trans);
 `uvm_object_utils(cmd_m1_iv)

 function new(string name ="cmd_m1_iv");
   super.new(name);
 endfunction

 task body();
   req = trans::type_id::create("req");
   begin
       
       start_item(req);
       assert(req.randomize() with {
         mode      == 1'b1;
         cmd inside {13,14,15};   
         inp_valid == 2'b11;
       });
       finish_item(req);

   end
 endtask

endclass


class cmd_m0_iv extends uvm_sequence #(trans);
 `uvm_object_utils(cmd_m0_iv)

 function new(string name ="cmd_m0_iv");
   super.new(name);
 endfunction

 task body();
   req = trans::type_id::create("req");
   begin
       start_item(req);
       assert(req.randomize() with {
         mode      == 1'b0;
         cmd inside {14,15};   
         inp_valid == 2'b11;
       });
       finish_item(req);
   end
 endtask

endclass






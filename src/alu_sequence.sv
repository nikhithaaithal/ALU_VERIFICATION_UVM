
class seq0 extends uvm_sequence #(trans);
 `uvm_object_utils(seq0)
 function new(string name ="seq0");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
    repeat(30)begin
    start_item(req);
      assert(req.randomize() with {mode == 1;cmd inside {[0:8]}; });
    finish_item(req);end
  end
 endtask
endclass



class seq1 extends uvm_sequence #(trans);
 `uvm_object_utils(seq1)
 function new(string name ="seq1");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
    repeat(20)begin
    start_item(req);
      assert(req.randomize() with {mode ==1'b0;});
    finish_item(req);end
  end
 endtask
endclass

/*
class seq2 extends uvm_sequence #(trans);
 `uvm_object_utils(seq2)
 function new(string name ="seq2");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
  begin
    wait_for_grant();
    //start_item(req);
      assert(req.randomize() with {mode ==1'b1; cmd inside {[9:10]};});
      send_request(req);
      wait_for_item_done();
      //get_response(res);
    //finish_item(req);
  end
 endtask
endclass




class seq3 extends uvm_sequence #(trans);
 `uvm_object_utils(seq3)
 function new(string name ="seq3");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
  begin
    start_item(req);
      assert(req.randomize() with {mode ==1'b1;inp_valid inside{[0:2]};});
    finish_item(req);
  end
 endtask
endclass


/*
//increament opa
class seq4 extends uvm_sequence #(trans);
 `uvm_object_utils(seq4)
 function new(string name ="seq4");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
  begin
    start_item(req);
      assert(req.randomize() with {mode ==1'b1; cmd == 4;opa==23; opb==5;inp_valid ==2'b11;});
    finish_item(req);
  end
 endtask
endclass



class seq5 extends uvm_sequence #(trans);
 `uvm_object_utils(seq5)
 function new(string name ="seq5");
   super.new(name);
 endfunction
 
 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with {mode ==1'b1; cmd == 5;opa==70; opb==5;});
    finish_item(req);
  end
 endtask
endclass

//increament opb
class seq6 extends uvm_sequence #(trans);
 `uvm_object_utils(seq6)
 function new(string name ="seq6");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 6; opb==30;inp_valid ==2'b11; });
    finish_item(req);
   end
 endtask
endclass


class seq7 extends uvm_sequence #(trans);
 `uvm_object_utils(seq7)
 function new(string name ="seq7");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 7; opb==10; inp_valid==2'b11; });
    finish_item(req);
   end
 endtask
endclass


class seq8 extends uvm_sequence #(trans);
 `uvm_object_utils(seq8)
 function new(string name ="seq8");
   super.new(name);
 endfunction

 task body();
  req= trans::type_id::create("req");
   begin
    start_item(req);
      assert(req.randomize() with { mode ==1'b1; cmd == 8; opa==50; opb==20; });
    finish_item(req);
   end
 endtask
endclass




*/



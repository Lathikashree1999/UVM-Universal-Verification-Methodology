class my_sequence extends uvm_sequence#(my_seq_item);
  `uvm_object_utils(my_sequence)
  
  my_seq_item pkt;
  
  function new(string name = "my_sequence");
    super.new(name);
    `uvm_info("Sequence","Constructor",UVM_NONE)
  endfunction
  
  task body;
    forever begin
      `uvm_info("Sequence","Starting sequence",UVM_NONE)
      pkt = my_seq_item::type_id::create("pkt");
      `uvm_do(pkt)
    end
  endtask
endclass
  

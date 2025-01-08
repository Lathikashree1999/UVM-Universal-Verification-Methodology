class my_seq_item extends uvm_sequence_item;
  `uvm_object_utils(my_seq_item)
  
  //rand bit rst;
 // bit rst;
  rand bit d;
  bit q;
  
  function new(string name = "my_seq_item");
    super.new(name);
    `uvm_info("Sequence item", "Constructor", UVM_NONE)
  endfunction
  
//   `uvm_object_utils_begin(my_seq_item)
//     `uvm_field_int(rst, UVM_ALL_ON)
//     `uvm_field_int(d, UVM_ALL_ON)
//     `uvm_field_int(q, UVM_ALL_ON)
//   `uvm_object_utils_end

endclass
  
  

class sequence_item extends uvm_sequence_item;
  
  rand bit oper;
  bit rd, wr;
  bit [7:0] din;
  bit full, empty;
  reg [7:0] dout;
  bit rst;
  bit clk;
  
  constraint oper_ctrl{oper dist{1 :/50, 0 :/50};}
  
  function new(string name = "sequence_item");
    super.new(name);
    `uvm_info("INFO", "Constructor of seq_item", UVM_NONE)
  endfunction

  `uvm_object_utils_begin(sequence_item)
    `uvm_field_int(rd, UVM_ALL_ON)
    `uvm_field_int(wr, UVM_ALL_ON)
    `uvm_field_int(din, UVM_ALL_ON)
    `uvm_field_int(full, UVM_ALL_ON)
    `uvm_field_int(dout, UVM_ALL_ON)
    `uvm_field_int(rst, UVM_ALL_ON)
    `uvm_field_int(clk, UVM_ALL_ON)
  `uvm_object_utils_end
  
endclass

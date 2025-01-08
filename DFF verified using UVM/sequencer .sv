class my_sequencer extends uvm_sequencer#(my_seq_item);
  `uvm_component_utils(my_sequencer)
  
  function new(string name = "my_sequencer", uvm_component parent);
    super.new(name,parent);
    `uvm_info("Sequencer","Constructor",UVM_NONE)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
endclass

class sequencer extends uvm_sequencer;
  `uvm_component_utils(sequencer)
  
  function new(string name = "sequencer", uvm_component parent);
    super.new(name,parent);
    `uvm_info("INFO","Constructor of sequencer class", UVM_NONE);
  endfunction
  
endclass
    

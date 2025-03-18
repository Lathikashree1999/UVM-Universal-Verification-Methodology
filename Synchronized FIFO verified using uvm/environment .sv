class environment extends uvm_env;
  `uvm_component_utils(environment)
  
  agent agt;
  
  function new(string name="environment",uvm_component parent);
    super.new(name,parent);
    `uvm_info("INFO","Constructor of environment",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("INFO","build phase of environment",UVM_MEDIUM)
    agt=agent::type_id::create("agt",this);
  endfunction
  
endclass

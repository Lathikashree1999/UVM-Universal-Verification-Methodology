class agent extends uvm_agent;
  `uvm_component_utils(agent)
  
  function new(string name = "agent", uvm_component parent);
    super.new(name, parent);
    `uvm_info("INFO","Constructor of Agent class",UVM_NONE)
  endfunction
  
  //instances
  
  sequencer seqr;
  driver drv;
  monitor mon;
  
  //phases
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("INFO", "Build Phase of Agent class", UVM_NONE)
    sqr = sequencer::type_id::create("sqr", this);
    drv = driver::type_id::create("drv",this);
    mon = monitor::type_id::create("mon",this);
    
  endfunction
  
  //Connect phase: Connect Driver and Sequencer
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("INFO", "Connect_phase of Agent class", UVM_NONE)
    `uvm_info("INFO", "Connecting Driver and Sequencer in agent class", UVM_NONE)
    
    //driv.seq_item_port.connect(seq.seq_item_export);
    
  endfunction
  
endclass
    
    

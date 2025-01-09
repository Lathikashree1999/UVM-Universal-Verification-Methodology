class my_agent extends uvm_agent;
  `uvm_component_utils(my_agent)
  
  my_driver drv;
  my_monitor mon;
  my_sequencer seqr;
  
  function new(string name = "my_agent",uvm_component parent);
    super.new(name,parent);
    `uvm_info("Agent","Constructor",UVM_NONE)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
       seqr = my_sequencer::type_id::create("seqr",this );
 
    drv = my_driver::type_id::create("drv",this);
    
    mon = my_monitor::type_id::create("mon",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("agent Class", "connect phase", UVM_MEDIUM)
     
    drv.seq_item_port.connect(seqr.seq_item_export);

  endfunction
  
endclass
  
   
  

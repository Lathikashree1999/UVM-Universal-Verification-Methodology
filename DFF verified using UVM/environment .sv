class my_environment extends uvm_env;
  `uvm_component_utils(my_environment) 
  
  my_agent agt;
  my_scoreboard scor;
  
  function new(string name ="my_environment", uvm_component parent);
    super.new(name, parent);
    `uvm_info("env Class", "constructor", UVM_MEDIUM)
  endfunction
  

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
 
    agt = my_agent::type_id::create("agt",this);
    scor = my_scoreboard::type_id::create("scor",this)   ;
  endfunction
  

   function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
     `uvm_info("agent Class", "connect phase", UVM_MEDIUM);
     agt.mon.item_collected_port.connect(scor.item_collected_export);

  endfunction
endclass

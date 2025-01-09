class my_scoreboard extends uvm_scoreboard ;
  `uvm_component_utils(my_scoreboard) 
  
  uvm_analysis_imp#(my_seq_item, my_scoreboard) item_collected_export;

  my_seq_item tx_q[$];

  function new(string name ="my_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("scoreboard Class", "constructor", UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export = new("item_collected_export", this);
  endfunction
  
  virtual function void write(my_seq_item pkt);
    //pkt.print();
    tx_q.push_back(pkt);
  endfunction
  
  
endclass

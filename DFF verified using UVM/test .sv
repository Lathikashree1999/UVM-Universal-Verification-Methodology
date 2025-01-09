class my_test extends uvm_test;
  `uvm_component_utils(my_test) 
  
  my_environment env;
  my_sequence seq;
  //dff_data_sequence data_seq;
  
  function new(string name ="my_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info("Test", "constructor", UVM_MEDIUM)
  endfunction
    
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    env = my_environment::type_id::create("env",this);
    seq = my_sequence::type_id::create("seq");
    //data_seq = dff_data_sequence::type_id::create("data_seq", this);

  endfunction
    
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("Test Class", "connect phase", UVM_MEDIUM)
  endfunction
  
  virtual function void end_of_elaboration();
    `uvm_info("Test Class", "elob phase", UVM_MEDIUM)
    print();
  endfunction

  task run_phase(uvm_phase phase);
    `uvm_info("test Class", "run_phase", UVM_MEDIUM)

    phase.raise_objection(this); 
    seq.start(env.agt.seqr); 
    phase.drop_objection(this);
    
  endtask 
  
endclass

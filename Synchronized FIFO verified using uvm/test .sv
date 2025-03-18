class test extends uvm_test;
  `uvm_component_utils(test)
  
  environment env;
  my_sequence seq;
  
  function new(string name = "test", uvm_component parent);
    super.new(name,parent);
    `uvm_info("INFO", "Constructor of Test class", UVM_NONE)
  endfunction
  
  //phases
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("INFO", "Build Phase of Test class", UVM_NONE)
    env = environment::type_id::create("env", this);
    seq=my_sequence::type_id::create("seq",this);
  endfunction
  
  
  function void end_of_elaboration_phase(UVM_NONE);
    super.end_of_elaboration_phase(phase);
    `uvm_info("INFO", "End of Elaboration Phase of Test class", UVM_NONE)
   // `uvm_top.print_topology();
    print();
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("INFO","Run_phase of Test class",UVM_NONE)
    `uvm_info("INFO","Start the Sequence", UVM_NONE)
    phase.raise_objection(this);
    display("%t ////////////////  Starting the sequence ////////////////");
    seq.start(env.agt.sqr);
    display("%t ////////////////  End the sequence ////////////////");
    phase.drop_objection(this);
  endtask 
endclass
    
  

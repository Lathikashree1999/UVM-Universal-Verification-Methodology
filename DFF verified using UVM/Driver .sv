class my_driver extends uvm_driver#(my_seq_item);
  `uvm_component_utils(my_driver)
  
  virtual inter vif;
  my_seq_item pkt;
  
  function new(string name = "my_driver", uvm_component parent);
    super.new(name,parent);
    `uvm_info("Driver","Constructor",UVM_NONE)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual inter)::get(this,"","vif",vif))
      `uvm_fatal(get_type_name(), "Virtual interface not set");
    `uvm_info("Driver","Build phase",UVM_NONE)
  endfunction 
  
  task run_phase(uvm_phase phase);
    forever begin
      pkt = my_seq_item::type_id::create("pkt");
      super.run_phase(phase);
      `uvm_info("Driver","Run phase",UVM_NONE)
      seq_item_port.get_next_item(pkt); //get next item
      
      @(posedge vif.clk); //drive logic
      
      //vif.rst <= pkt.rst;
      $display("time %t : DRIVER : rst = %0b, d=%b",$time, vif.rst, vif.d);
      vif.d <= pkt.d;
      vif.q <= pkt.q;

      seq_item_port.item_done();
    end
  endtask
endclass
      
        

class my_monitor extends uvm_monitor;
  `uvm_component_utils(my_monitor)
  
  virtual inter vintf;
  my_seq_item pkt;
  uvm_analysis_port#(my_seq_item) item_collected_port;
  
  function new(string name = "my_monitor",uvm_component parent);
    super.new(name,parent);
    `uvm_info("Monitor","Constructor",UVM_NONE)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_port = new("item_collected_port", this);
    
    if(!uvm_config_db#(virtual inter)::get(this,"","vif",vintf)) begin
      `uvm_fatal("no vintf in driver","virtual interface failed in config db")
    end
    
    `uvm_info("Monitor","Build phase",UVM_NONE)
  endfunction
  
  task run_phase(uvm_phase phase);
    `uvm_info("Monitor", "Run phase", UVM_NONE)
    forever begin
      pkt = my_seq_item::type_id::create("pkt");
     // wait( vintf.clk)
      
      @(posedge vintf.clk)
          `uvm_info("Monitor", "Run phase", UVM_NONE)

     // pkt.rst = vintf.rst;
      pkt.d <= vintf.d;
      pkt.q <= vintf.q;
      
      $display("time : %tmonitor : vintf.d = %0b vif.q = %0b",$time,vintf.d,vintf.q);

    end
  endtask
endclass
    
      
      

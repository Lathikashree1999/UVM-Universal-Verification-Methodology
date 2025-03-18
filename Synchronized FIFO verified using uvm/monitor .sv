class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  virtual inter vif;
  uvm_analysis_port#(sequence_item) item_collected_port;
  sequence_item pkt;

  function new(string name="monitor",uvm_component parent);
    super.new(name,parent);
    //item_collect_port=new("mon",this);
    //mon=new();
    `uvm_info("INFO","Constructor of monitor",UVM_NONE)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_port=new("item_collected_port",this);
    `uvm_info("INFO", "Build phase of monitor", UVM_NONE)
    //if(!uvm_config_db#(virtual inter)::get(null,"","vif",vif))
    // `uvm_fatal(get_type_name(),"Not set at top level"); 
  endfunction
   
     task run_phase(uvm_phase phase);
       pkt=sequence_item::type_id::create("pkt");
       `uvm_info("MONITOR","run_phase",UVM_NONE)
       pkt.wr = vintf.wr;
       pkt.rd = vintf.rd;
       pkt.din = vintf.din;
       pkt.full = vintf.full;
       pkt.empty = vintf.empty;
       pkt.dout = vintf.dout;
      
       item_collect_port.write(mon);
    endtask                                      
                                         
endclass
  

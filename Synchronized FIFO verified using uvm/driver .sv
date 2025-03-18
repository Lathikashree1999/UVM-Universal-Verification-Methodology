class driver extends uvm_driver;
  virtual inter vintf;
  sequence_item pkt;
  `uvm_component_utils(driver)
  
  function new(string name = "driver", uvm_component parent);
    super.new(name,parent);
    `uvm_info("INFO","Constructor of driver class",UVM_NONE)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual inter)::get(this, "", "vif", vif))
      `uvm_fatal(get_type_name(), "Virtual interface not set");
  endfunction
  
  task run_phase(uvm_phase phase);
    forever begin
      sequence_item_port.get_next_item(pkt);
      //`uvm_info(get_type_name(), $sformatf("reset=%0d", pkt.reset), UVM_NONE);
      driv(pkt);
      sequence_item_port.item_done();
    end
  endtask
  
  task reset();
    vintf.rst <= 1'b1;
    vintf.rd <= 1'b0;
    vintf.wr <= 1'b0;
    vintf.din <= 0;
    
    repeat(5)
      @(posedge vintf.clk);
      vintf.rst <= 1'b0;
    $display("[DRV] : DUT reset done");
    $display("-------------------------");
  endtask
  
  task write();
    @(posedge vintf.clk);
    vintf.rst <= 1'b0;
    vintf.rd <= 1'b0;
    vintf.wr <= 1'b1;
    vintf.din <= $urandom_range(1, 10);
    
    @(posedge vintf.clk);
    vintf.wr <= 1'b0;
    $display("[DRV] : Data write data : %0d",vintf.din);
    @(posedge vintf.clk);
  endtask
  
  task read();
    @(posedge vintf.clk);
    vintf.rst <= 1'b0;
    vintf.rd <= 1'b1;
    vintf.wr <= 1'b0;
    
    @(posedge vintf.clk);
    vintf.rd <= 1'b0;
    $display("[DRV] : Data read");
    @(posedge vintf.clk);
  endtask
  
  task driv();
    forever begin
      mail.get(pkt);
      if(pkt.oper == 1'b1)
        write();
      else
        read();
    end
  endtask
endclass
      
      
      

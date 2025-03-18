`include "uvm_macros.svh"
import uvm_pkg::*;
`include "inter.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module top;
  //environment env;
  inter intf();
  test ts;
  
  fifo dut(.clk(intf.clk), .rst(intf.rst), .wr(intf.wr), .rd(intf.rd), .din(intf.din), .dout(intf.dout), .full(intf.full), .empty(intf.empty));
  
  
  initial begin
    `uvm_info("INFO","-----------------------------------------------",UVM_NONE)
    `uvm_info("INFO","-----------------------------------------------",UVM_NONE)
    
    `uvm_info("INFO", "Testbench top Initial Block, Set Interface in config db",UVM_NONE)
    `uvm_info("INFO", "Call run_test, phases will start execute",UVM_NONE)
    
    run_test("test");
    
  end
  
  initial begin
    intf.clk=1'b0;
    intf.rst=1'b1;
    #10 intf.rst=1'b0;
  end
  
  always #10 intf.clk=~intf.clk;
  
  initial begin
    uvm_config_db#(virtual inter)::set(null, "*", "vif_key", in);
    $monitor("clk = %0d, reset = %0d, din = %0d, dout = %0d", intf.clk, intf.reset, intf.din, intf.dout);
  end
  
endmodule
    

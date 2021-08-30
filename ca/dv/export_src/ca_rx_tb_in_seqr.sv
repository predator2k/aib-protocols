`ifndef _CA_RX_TB_IN_SEQR_
`define _CA_RX_TB_IN_SEQR_

////////////////////////////////////////////////////////////

class ca_rx_tb_in_seqr_c extends uvm_sequencer #(ca_data_pkg::ca_seq_item_c, ca_data_pkg::ca_seq_item_c);

    // UVM Factory Registration Macro
    `uvm_component_utils(ca_rx_tb_in_seqr_c)

    // Standard UVM Methods:
    extern function new(string name="ca_rx_tb_in_seqr", uvm_component parent = null);

endclass: ca_rx_tb_in_seqr_c
////////////////////////////////////////////////////////////
//---------------------------------------
function ca_rx_tb_in_seqr_c::new(string name="ca_rx_tb_in_seqr", uvm_component parent = null);
    super.new(name, parent);
endfunction : new

////////////////////////////////////////////////////////////
`endif

`ifndef _RX_CA_TB_IN_AGENT_
`define _RX_CA_TB_IN_AGENT_

////////////////////////////////////////////////////////////////////////////
class ca_rx_tb_in_agent_c #(int BUS_BIT_WIDTH=80, int NUM_CHANNELS=2) extends uvm_component;
 
    
    // UVM Factory Registration Macro
    //
    `uvm_component_param_utils(ca_rx_tb_in_agent_c #(BUS_BIT_WIDTH, NUM_CHANNELS))
 
    //------------------------------------------
    // Data Members
    //------------------------------------------
    
    //------------------------------------------
    // Component Members
    //------------------------------------------
    uvm_analysis_port #(ca_data_pkg::ca_seq_item_c)     aport;
    string                                              my_name = "";
    ca_rx_tb_in_mon_c                                   #(BUS_BIT_WIDTH, NUM_CHANNELS) mon;
    ca_rx_tb_in_drv_c                                   #(BUS_BIT_WIDTH, NUM_CHANNELS) drv;
    ca_rx_tb_in_cfg_c                                   cfg;
    ca_rx_tb_in_seqr_c                                  seqr;
    //ca_rx_tb_in_cov_mon_c                             fcov_mon;
    
    //------------------------------------------
    // Methods
    //------------------------------------------
 
    // Standard UVM Methods:
    extern function new(string name = "ca_rx_tb_in_agent", uvm_component parent = null);
    extern function void build_phase( uvm_phase phase );
    extern function void connect_phase( uvm_phase phase );
    extern function void set_my_name( string _name );

endclass: ca_rx_tb_in_agent_c

////////////////////////////////////////////////////////////

function ca_rx_tb_in_agent_c::new(string name = "ca_rx_tb_in_agent", uvm_component parent = null);
    
    super.new(name, parent);
    `uvm_info("ca_rx_tb_in_agent_c::new", $sformatf("BUS_BIT_WIDTH == %0d", BUS_BIT_WIDTH), UVM_LOW);
    `uvm_info("ca_rx_tb_in_agent_c::new", $sformatf("NUM_CHANNELS  == %0d", NUM_CHANNELS), UVM_LOW);

endfunction

//------------------------------------------
function void ca_rx_tb_in_agent_c::build_phase( uvm_phase phase );

    // get the interface
    if( !uvm_config_db #( ca_rx_tb_in_cfg_c )::get(this, "" , "ca_rx_tb_in_cfg", cfg) )  
        `uvm_fatal("ca_rx_tb_in_agent::build_phase", "unable to get cfg")

    // analysis port
    aport = new("aport", this);
    
    // Monitor is always present
    mon = ca_rx_tb_in_mon_c #(BUS_BIT_WIDTH, NUM_CHANNELS)::type_id::create("mon", this);
    mon.cfg = cfg;

    // Only build the driver and sequencer if active
    if(cfg.agent_active == UVM_ACTIVE) begin
        drv     = ca_rx_tb_in_drv_c #(BUS_BIT_WIDTH, NUM_CHANNELS)::type_id::create("drv", this);
        drv.cfg = cfg;
        seqr = ca_rx_tb_in_seqr_c::type_id::create("seqr", this);
    end
    
    if(cfg.has_func_cov == 1) begin
        //fcov_mon = ca_rx_tb_in_agent_cov_mon_c::type_id::create("ca_rx_tb_in_agent_cov_mon", this);
    end
endfunction: build_phase

//------------------------------------------
function void ca_rx_tb_in_agent_c::connect_phase( uvm_phase phase );
    
    // connect monitor analysis port
    aport = mon.aport;

    // Only connect the driver and the sequencer if active
    if(cfg.agent_active == UVM_ACTIVE) begin
        drv.seq_item_port.connect(seqr.seq_item_export);
    end

    if(cfg.has_func_cov == 1) begin
        //mon.aport.connect(fcov_mon.fcov_export);
    end

endfunction: connect_phase

//------------------------------------------
function void ca_rx_tb_in_agent_c::set_my_name( string _name );
   my_name      = _name;
   if(cfg.agent_active == UVM_ACTIVE) drv.my_name  = _name;
   mon.my_name  = _name;
endfunction : set_my_name
////////////////////////////////////////////////////////////////////////////////////
`endif
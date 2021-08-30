`ifndef _CA_RX_TB_IN_CFG_
`define _CA_RX_TB_IN_CFG_

////////////////////////////////////////////////////////////
class ca_rx_tb_in_cfg_c extends uvm_object;
 
    //------------------------------------------
    // Data Members
    //------------------------------------------
    // Whether env analysis components are used:
    bit    agent_active  = UVM_ACTIVE;
    bit    has_func_cov  = 0;

    string           my_name = "";
    bit [7:0]        rx_stb_wd_sel    = 'h1;
    bit [39:0]       rx_stb_bit_sel   = 'h1;
    bit              rx_online        = 1;    // default
    bit              rx_stb_en        = 1;    // default
    bit              align_fly        = 1;    // default
    bit [4:0]        fifo_full_val    = 4;    // default
    bit [4:0]        fifo_pfull_val   = 2;
    bit [2:0]        fifo_empty_val   = 0;    // default
    bit [2:0]        fifo_pempty_val  = 2;    // default
    rand bit [2:0]   rden_dly; 
    rand bit [7:0]   rx_stb_intv;
    rand int         bit_shift;
    int              bits_per_channel = 0;

    bit              en_rx_stb_check = 1;

    //------------------------------------------
    // UVM Factory Registration Macro
    //------------------------------------------
    `uvm_object_utils_begin(ca_rx_tb_in_cfg_c)
        `uvm_field_string(my_name,       UVM_DEFAULT);
        `uvm_field_int(agent_active,     UVM_DEFAULT);
        `uvm_field_int(has_func_cov,     UVM_DEFAULT);
        `uvm_field_int(rx_stb_wd_sel,    UVM_DEFAULT);
        `uvm_field_int(rx_stb_bit_sel,   UVM_DEFAULT);
        `uvm_field_int(rx_online,        UVM_DEFAULT);
        `uvm_field_int(rx_stb_en,        UVM_DEFAULT);
        `uvm_field_int(rx_stb_intv,      UVM_DEFAULT);
        `uvm_field_int(align_fly,        UVM_DEFAULT);
        `uvm_field_int(fifo_full_val,    UVM_DEFAULT);
        `uvm_field_int(fifo_pfull_val,   UVM_DEFAULT);
        `uvm_field_int(fifo_empty_val,   UVM_DEFAULT);
        `uvm_field_int(fifo_pempty_val,  UVM_DEFAULT);
        `uvm_field_int(bits_per_channel, UVM_DEFAULT);
        `uvm_field_int(en_rx_stb_check,  UVM_DEFAULT);
    `uvm_object_utils_end
 
    //------------------------------------------
    // constraints 
    //------------------------------------------
    constraint c_bit_shift      { bit_shift  inside {[0:39]}; }
    constraint c_rx_stb_intv    { rx_stb_intv  inside {[4:16]}; } // FIXME - need min/max for distribution
    constraint c_rden_dly       { rden_dly  inside {[4:7]}; } // FIXME - need min/max for distribution

    //------------------------------------------
    // Methods
    //------------------------------------------

    // Standard UVM Methods:
    extern function new(string name = "ca_rx_tb_in_cfg");
    extern function void build_phase( uvm_phase phase );
    extern function void set_bits_per_channel(int _bits_per_channel);
    extern virtual function void configure( );
 
endclass: ca_rx_tb_in_cfg_c
////////////////////////////////////////////////////////////

function ca_rx_tb_in_cfg_c::new(string name = "ca_rx_tb_in_cfg");
    super.new(name);
endfunction
 
//
//------------------------------------------
function void ca_rx_tb_in_cfg_c::build_phase( uvm_phase phase );


endfunction: build_phase

//------------------------------------------
function void ca_rx_tb_in_cfg_c::set_bits_per_channel(int _bits_per_channel);
    bits_per_channel = _bits_per_channel;
    `uvm_info("ca_rx_tb_in_cfg", $sformatf("%s set bits per channel: %0d", my_name, bits_per_channel), UVM_MEDIUM);
endfunction : set_bits_per_channel

//------------------------------------------
function void ca_rx_tb_in_cfg_c::configure( );
   
    int max_wd_sel = 0 ; 
    int wd_shift   = 0 ;

    if(bits_per_channel == 0) `uvm_fatal("configure", $sformatf("bits_per_channel != 0"));
    max_wd_sel = bits_per_channel/40;
    if(max_wd_sel > 1) wd_shift =  $urandom_range((max_wd_sel-1),0);

    rx_stb_bit_sel = rx_stb_bit_sel << bit_shift;
    rx_stb_wd_sel  = rx_stb_wd_sel << wd_shift;
    `uvm_info("ca_rx_tb_in_cfg", $sformatf("%s bit_shift: %0d wd_shift: %0d rx_stb_bit_sel: %0h  rx_stb_wd_sel: %0d", 
        my_name, bit_shift, wd_shift, rx_stb_bit_sel, rx_stb_wd_sel), UVM_MEDIUM);

endfunction: configure 
////////////////////////////////////////////////////////////
`endif
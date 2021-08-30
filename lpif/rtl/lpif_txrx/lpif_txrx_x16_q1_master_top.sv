module lpif_txrx_x16_q1_master_top  (
  input  logic              clk_wr              ,
  input  logic              rst_wr_n            ,

  // Control signals
  input  logic              tx_online           ,
  input  logic              rx_online           ,

  input  logic [7:0]        init_downstream_credit,

  // PHY Interconnect
  output logic [159:  0]    tx_phy0             ,
  input  logic [159:  0]    rx_phy0             ,
  output logic [159:  0]    tx_phy1             ,
  input  logic [159:  0]    rx_phy1             ,
  output logic [159:  0]    tx_phy2             ,
  input  logic [159:  0]    rx_phy2             ,
  output logic [159:  0]    tx_phy3             ,
  input  logic [159:  0]    rx_phy3             ,
  output logic [159:  0]    tx_phy4             ,
  input  logic [159:  0]    rx_phy4             ,
  output logic [159:  0]    tx_phy5             ,
  input  logic [159:  0]    rx_phy5             ,
  output logic [159:  0]    tx_phy6             ,
  input  logic [159:  0]    rx_phy6             ,
  output logic [159:  0]    tx_phy7             ,
  input  logic [159:  0]    rx_phy7             ,
  output logic [159:  0]    tx_phy8             ,
  input  logic [159:  0]    rx_phy8             ,
  output logic [159:  0]    tx_phy9             ,
  input  logic [159:  0]    rx_phy9             ,
  output logic [159:  0]    tx_phy10            ,
  input  logic [159:  0]    rx_phy10            ,
  output logic [159:  0]    tx_phy11            ,
  input  logic [159:  0]    rx_phy11            ,
  output logic [159:  0]    tx_phy12            ,
  input  logic [159:  0]    rx_phy12            ,
  output logic [159:  0]    tx_phy13            ,
  input  logic [159:  0]    rx_phy13            ,
  output logic [159:  0]    tx_phy14            ,
  input  logic [159:  0]    rx_phy14            ,
  output logic [159:  0]    tx_phy15            ,
  input  logic [159:  0]    rx_phy15            ,

  // downstream channel
  input  logic [  3:  0]    dstrm_state         ,
  input  logic [  1:  0]    dstrm_protid        ,
  input  logic [1023:  0]   dstrm_data          ,
  input  logic [  6:  0]    dstrm_bstart        ,
  input  logic [127:  0]    dstrm_bvalid        ,
  input  logic [  0:  0]    dstrm_valid         ,

  // upstream channel
  output logic [  3:  0]    ustrm_state         ,
  output logic [  1:  0]    ustrm_protid        ,
  output logic [1023:  0]   ustrm_data          ,
  output logic [  6:  0]    ustrm_bstart        ,
  output logic [127:  0]    ustrm_bvalid        ,
  output logic [  0:  0]    ustrm_valid         ,

  // Debug Status Outputs
  output logic [31:0]       tx_downstream_debug_status,
  output logic [31:0]       rx_upstream_debug_status,

  // Configuration
  input  logic              m_gen2_mode         ,


  input  logic [7:0]        delay_x_value       , // In single channel, no CA, this is Word Alignment Time. In multie-channel, this is 0 and RX_ONLINE tied to channel_alignment_done
  input  logic [7:0]        delay_xz_value      ,
  input  logic [7:0]        delay_yz_value      

);

////////////////////////////////////////////////////////////
// Interconnect Wires
  logic [1165:  0]                               tx_downstream_data            ;
  logic [1165:  0]                               txfifo_downstream_data        ;
  logic                                          tx_downstream_pop_ovrd        ;

  logic [1165:  0]                               rx_upstream_data              ;
  logic [1165:  0]                               rxfifo_upstream_data          ;
  logic                                          rx_upstream_push_ovrd         ;

  logic [  3:  0]                                tx_auto_mrk_userbit           ;
  logic                                          tx_auto_stb_userbit           ;
  logic                                          tx_online_delay               ;
  logic                                          rx_online_delay               ;

  logic [  3:  0]                                tx_mrk_userbit                ; // No TX User Marker, so tie off
  logic                                          tx_stb_userbit                ; // No TX User Strobe, so tie off
  assign tx_mrk_userbit                   = 1'b0                             ;
  assign tx_stb_userbit                   = 1'b0                             ;

// Interconnect Wires
////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
// Auto Sync

   ll_auto_sync #(.MARKER_WIDTH(4)) ll_auto_sync_i
     (// Outputs
      .tx_online_delay                  (tx_online_delay),
      .tx_auto_mrk_userbit              (tx_auto_mrk_userbit),
      .tx_auto_stb_userbit              (tx_auto_stb_userbit),
      .rx_online_delay                  (rx_online_delay),
      // Inputs
      .clk_wr                           (clk_wr),
      .rst_wr_n                         (rst_wr_n),
      .tx_online                        (tx_online),
      .delay_xz_value                   (delay_xz_value[7:0]),
      .delay_yz_value                   (delay_yz_value[7:0]),
      .tx_mrk_userbit                   (tx_mrk_userbit),
      .tx_stb_userbit                   (tx_stb_userbit),
      .rx_online                        (rx_online),
      .delay_x_value                    (delay_x_value[7:0]));

// Auto Sync
//////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
// Logic Link Instantiation

  // No AXI Valid or Ready, so bypassing main Logic Link FIFO/Credit logic.
  assign tx_downstream_data   [  0 +:1166] = txfifo_downstream_data [  0 +:1166] ;
  assign tx_downstream_debug_status [  0 +: 32] = 32'h0                            ;

  // No AXI Valid or Ready, so bypassing main Logic Link FIFO/Credit logic.
  assign rxfifo_upstream_data [  0 +:1166] = rx_upstream_data     [  0 +:1166] ;
  assign rx_upstream_debug_status [  0 +: 32] = 32'h0                            ;

// Logic Link Instantiation
//////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
// User Interface

      lpif_txrx_x16_q1_master_name lpif_txrx_x16_q1_master_name
      (
         .dstrm_state                      (dstrm_state[3:0]),
         .dstrm_protid                     (dstrm_protid[1:0]),
         .dstrm_data                       (dstrm_data[1023:0]),
         .dstrm_bstart                     (dstrm_bstart[6:0]),
         .dstrm_bvalid                     (dstrm_bvalid[127:0]),
         .dstrm_valid                      (dstrm_valid[0:0]),
         .ustrm_state                      (ustrm_state[3:0]),
         .ustrm_protid                     (ustrm_protid[1:0]),
         .ustrm_data                       (ustrm_data[1023:0]),
         .ustrm_bstart                     (ustrm_bstart[6:0]),
         .ustrm_bvalid                     (ustrm_bvalid[127:0]),
         .ustrm_valid                      (ustrm_valid[0:0]),

         .txfifo_downstream_data           (txfifo_downstream_data[1165:0]),
         .rxfifo_upstream_data             (rxfifo_upstream_data[1165:0]),

         .m_gen2_mode                      (m_gen2_mode)

      );
// User Interface                                                 
//////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
// PHY Interface

      lpif_txrx_x16_q1_master_concat lpif_txrx_x16_q1_master_concat
      (
         .tx_downstream_data               (tx_downstream_data[1165:0]),
         .tx_downstream_pop_ovrd           (tx_downstream_pop_ovrd),
         .rx_upstream_data                 (rx_upstream_data[1165:0]),
         .rx_upstream_push_ovrd            (rx_upstream_push_ovrd),

         .tx_phy0                          (tx_phy0[159:0]),
         .rx_phy0                          (rx_phy0[159:0]),
         .tx_phy1                          (tx_phy1[159:0]),
         .rx_phy1                          (rx_phy1[159:0]),
         .tx_phy2                          (tx_phy2[159:0]),
         .rx_phy2                          (rx_phy2[159:0]),
         .tx_phy3                          (tx_phy3[159:0]),
         .rx_phy3                          (rx_phy3[159:0]),
         .tx_phy4                          (tx_phy4[159:0]),
         .rx_phy4                          (rx_phy4[159:0]),
         .tx_phy5                          (tx_phy5[159:0]),
         .rx_phy5                          (rx_phy5[159:0]),
         .tx_phy6                          (tx_phy6[159:0]),
         .rx_phy6                          (rx_phy6[159:0]),
         .tx_phy7                          (tx_phy7[159:0]),
         .rx_phy7                          (rx_phy7[159:0]),
         .tx_phy8                          (tx_phy8[159:0]),
         .rx_phy8                          (rx_phy8[159:0]),
         .tx_phy9                          (tx_phy9[159:0]),
         .rx_phy9                          (rx_phy9[159:0]),
         .tx_phy10                         (tx_phy10[159:0]),
         .rx_phy10                         (rx_phy10[159:0]),
         .tx_phy11                         (tx_phy11[159:0]),
         .rx_phy11                         (rx_phy11[159:0]),
         .tx_phy12                         (tx_phy12[159:0]),
         .rx_phy12                         (rx_phy12[159:0]),
         .tx_phy13                         (tx_phy13[159:0]),
         .rx_phy13                         (rx_phy13[159:0]),
         .tx_phy14                         (tx_phy14[159:0]),
         .rx_phy14                         (rx_phy14[159:0]),
         .tx_phy15                         (tx_phy15[159:0]),
         .rx_phy15                         (rx_phy15[159:0]),

         .clk_wr                           (clk_wr),
         .clk_rd                           (clk_wr),
         .rst_wr_n                         (rst_wr_n),
         .rst_rd_n                         (rst_wr_n),

         .m_gen2_mode                      (m_gen2_mode),
         .tx_online                        (tx_online_delay),

         .tx_stb_userbit                   (tx_auto_stb_userbit),
         .tx_mrk_userbit                   (tx_auto_mrk_userbit)

      );

// PHY Interface
//////////////////////////////////////////////////////////////////


endmodule

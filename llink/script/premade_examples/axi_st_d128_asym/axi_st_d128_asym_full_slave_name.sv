module axi_st_d128_asym_full_slave_name  (

  // st channel
  output logic [  15:   0]   user_tkeep          ,
  output logic [ 127:   0]   user_tdata          ,
  output logic [   0:   0]   user_tuser          ,
  output logic               user_tvalid         ,
  input  logic               user_tready         ,
  output logic [   0:   0]   user_enable         ,

  // Logic Link Interfaces
  input  logic               user_st_valid       ,
  input  logic [ 145:   0]   rxfifo_st_data      ,
  output logic               user_st_ready       ,

  input  logic               m_gen2_mode         

);

  // Connect Data

  assign user_tvalid                        = user_st_valid                      ;
  assign user_st_ready                      = user_tready                        ;
  assign user_tkeep           [   0 +:  16] = rxfifo_st_data       [   0 +:  16] ;
  assign user_tdata           [   0 +: 128] = rxfifo_st_data       [  16 +: 128] ;
  assign user_tuser           [   0 +:   1] = rxfifo_st_data       [ 144 +:   1] ;
  assign user_enable          [   0 +:   1] = rxfifo_st_data       [ 145 +:   1] ;

endmodule

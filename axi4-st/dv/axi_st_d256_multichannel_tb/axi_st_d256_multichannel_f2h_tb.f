+access+rwc
axi_st_d256_multichannel_f2h_tb.sv
${PROJ_DIR}/llink/dv_simple/phy_to_phy_lite.sv
${PROJ_DIR}/llink/dv_simple/marker_gen.sv
+libverbose
+libext+.v
+define+FOR_SIM_ONLY
-f ${PROJ_DIR}/axi4-st/axi_st_d256_multichannel/axi_st_d256_multichannel_full_master.f
-f ${PROJ_DIR}/axi4-st/axi_st_d256_multichannel/axi_st_d256_multichannel_half_slave.f
-f ${PROJ_DIR}/ca/rtl/ca.f
-y .
-l axi_st_d256_multichannel_f2h_tb.log

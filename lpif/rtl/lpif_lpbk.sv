////////////////////////////////////////////////////////////
// Proprietary Information of Eximius Design
//
//        (C) Copyright 2021 Eximius Design
//                All Rights Reserved
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from Eximius Design
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//Functional Descript: LPIF Adapter IP Loopback
//
//
//
////////////////////////////////////////////////////////////

module lpif_lpbk
  #(
    parameter AIB_VERSION = 2,
    parameter AIB_GENERATION = 2,
    parameter AIB_LANES = 4,
    parameter AIB_BITS_PER_LANE = 80,
    parameter AIB_CLOCK_RATE = 1000,
    parameter LPIF_CLOCK_RATE = 1000,
    parameter LPIF_DATA_WIDTH = 64,
    parameter LPIF_PIPELINE_STAGES = 1,
    parameter MEM_CACHE_STREAM_ID = 3'b001,
    parameter IO_STREAM_ID = 3'b010,
    parameter ARB_MUX_STREAM_ID = 3'b100
    )
  (
   // AIB Interface
   input logic                                      m_wr_clk,
   input logic                                      com_clk,
   input logic                                      rst_n,

   input                                            lpbk_en,
   input logic [(AIB_LANES*AIB_BITS_PER_LANE)-1:0]  data_in_f,

   input logic [(AIB_LANES*AIB_BITS_PER_LANE)-1:0]  dout,
   output logic [(AIB_LANES*AIB_BITS_PER_LANE)-1:0] dout_lpbk
   );

  always_ff @(posedge com_clk or negedge rst_n)
    if (~rst_n)
      dout_lpbk <= {AIB_LANES*AIB_BITS_PER_LANE{1'b0}};
    else
      begin
        if (lpbk_en)
          dout_lpbk <= data_in_f;
        else
          dout_lpbk <= dout;
      end

    endmodule // lpif_lpbk

// Local Variables:
// verilog-library-directories:("." "${PROJ_DIR}/common/rtl")
// verilog-auto-inst-param-value:t
// End:

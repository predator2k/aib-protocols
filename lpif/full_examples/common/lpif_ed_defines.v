// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2021 Intel Corporation.
/////////////////////////////////////////////////////////////////////////////////////////
//--------------------------------------------------------------------------------------
// Description: flits for TB
//
//
// Change log
// 
/////////////////////////////////////////////////////////////////////////////////////////

`define M2S_RWD_FLIT_0  528'hf26700000000000000000000000000000000000000000000000000000000000000004444555566667777444455556666111100000000010000000000170500000000
`define M2S_RWD_FLIT_1  528'h330500000000000000000000000000000000000000000000000000000000000000004444555566667777444455556666222200000000010000004000170500000000
`define M2S_RWD_FLIT_2  528'h150900000000000000000000000000000000000000000000000000000000000000004444555566667777444455556666333300000000010000008000170500000000
`define M2S_RWD_FLIT_3  528'hE9110000000000000000000000000000000000000000000000000000000000000000444455556666777744445555666644440000000001000000c000170500000000
`define M2S_RWD_FLIT_4  528'hAC3300000000000000000000000000000000000000000000000000000000000000004444555566667777444455556666555500000000010000010000170500000000
`define M2S_RWD_FLIT_5  528'h390800000000000000000000000000000000000000000000000000000000000000004444555566667777444455556666666600000000010000014000170500000000
`define M2S_RWD_FLIT_6  528'hB90000000000000000000000000000000000000000000000000000000000000000004444555566667777444455556666777700000000010000018000170500000000
`define M2S_RWD_FLIT_7  528'hFF050000000000000000000000000000000000000000000000000000000000000000444455556666777744445555666688880000000001000001c000170500000000
`define M2S_RWD_FLIT_8  528'hDEFB00000000000000000000000000000000000000000000000000000000000000004444555566667777444455556666999900000000010000020000170500000000
`define M2S_RWD_FLIT_9  528'hF45500000000000000000000000000000000000000000000000000000000000000004444555566667777444455556666AAAA00000000010000024000170500000000
`define M2S_RWD_FLIT_10 528'hFF0300000000000000000000000000000000000000000000000000000000000000004444555566667777444455556666BBBB00000000010000028000170500000000
`define M2S_RWD_FLIT_11 528'h179900000000000000000000000000000000000000000000000000000000000000004444555566667777444455556666CCCC0000000001000002c000170500000000
`define M2S_RWD_FLIT_12 528'h445000000000000000000000000000000000000000000000000000000000000000004444555566667777444455556666DDDD00000000010000030000170500000000
`define M2S_RWD_FLIT_13 528'h322200000000000000000000000000000000000000000000000000000000000000004444555566667777444455556666EEEE00000000010000034000170500000000
`define M2S_RWD_FLIT_14 528'h907700000000000000000000000000000000000000000000000000000000000000004444555566667777444455556666FFFF00000000010000038000170500000000
`define M2S_RWD_FLIT_15 528'h00560000000000000000000000000000000000000000000000000000000000000000444455556666777744445555666600000000000001000003c000170500000000

`define M2S_REQ_FLIT_0  528'h568800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000170500000000
`define M2S_REQ_FLIT_1  528'hA17700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000004000170500000000
`define M2S_REQ_FLIT_2  528'hF8BB00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000008000170500000000
`define M2S_REQ_FLIT_3  528'hCD100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000c000170500000000
`define M2S_REQ_FLIT_4  528'h212500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000010000170500000000
`define M2S_REQ_FLIT_5  528'hDE3200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000014000170500000000
`define M2S_REQ_FLIT_6  528'hFE0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000018000170500000000
`define M2S_REQ_FLIT_7  528'h00340000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000001c000170500000000
`define M2S_REQ_FLIT_8  528'h67BF00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000020000170500000000
`define M2S_REQ_FLIT_9  528'h234400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000024000170500000000
`define M2S_REQ_FLIT_10 528'h9AbA00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000028000170500000000
`define M2S_REQ_FLIT_11 528'h00F50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000002c000170500000000
`define M2S_REQ_FLIT_12 528'h100500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000030000170500000000
`define M2S_REQ_FLIT_13 528'h9A0b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000034000170500000000
`define M2S_REQ_FLIT_14 528'hE02500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000038000170500000000
`define M2S_REQ_FLIT_15 528'h59A00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000003c000170500000000

`define S2M_DRS_FLIT_0  528'hf13100000000000000000000000000000000000000000000000000000000000000001111111111111111111111111111111100000000000171000000000000000000
`define S2M_DRS_FLIT_1  528'h126500000000000000000000000000000000000000000000000000000000000000002222222222222222222222222222222200000000000171000000000000000000
`define S2M_DRS_FLIT_2  528'ha39000000000000000000000000000000000000000000000000000000000000000003333333333333333333333333333333300000000000171000000000000000000
`define S2M_DRS_FLIT_3  528'h390700000000000000000000000000000000000000000000000000000000000000004444444444444444444444444444444400000000000171000000000000000000
`define S2M_DRS_FLIT_4  528'h257d00000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555500000000000171000000000000000000
`define S2M_DRS_FLIT_5  528'h460800000000000000000000000000000000000000000000000000000000000000006666666666666666666666666666666600000000000171000000000000000000
`define S2M_DRS_FLIT_6  528'h547200000000000000000000000000000000000000000000000000000000000000007777777777777777777777777777777700000000000171000000000000000000
`define S2M_DRS_FLIT_7  528'h620a00000000000000000000000000000000000000000000000000000000000000008888888888888888888888888888888800000000000171000000000000000000
`define S2M_DRS_FLIT_8  528'h709700000000000000000000000000000000000000000000000000000000000000009999999999999999999999999999999900000000000171000000000000000000
`define S2M_DRS_FLIT_9  528'h82410000000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa00000000000171000000000000000000
`define S2M_DRS_FLIT_10 528'h90b90000000000000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000000171000000000000000000
`define S2M_DRS_FLIT_11 528'ha2b10000000000000000000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccc00000000000171000000000000000000
`define S2M_DRS_FLIT_12 528'hb0980000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddd00000000000171000000000000000000
`define S2M_DRS_FLIT_13 528'hc3020000000000000000000000000000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000171000000000000000000
`define S2M_DRS_FLIT_14 528'hd9400000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffff00000000000171000000000000000000
`define S2M_DRS_FLIT_15 528'he1020000000000000000000000000000000000000000000000000000000000000000ffffffffffffff00000000000000000000000000000171000000000000000000


`define S2M_NDR_FLIT_0  528'h219000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171000000000000000
`define S2M_NDR_FLIT_1  528'h413200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171000000000000000
`define S2M_NDR_FLIT_2  528'h760900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171000000000000000
`define S2M_NDR_FLIT_3  528'h1a4300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171000000000000000
`define S2M_NDR_FLIT_4  528'h3b7600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171000000000000000
`define S2M_NDR_FLIT_5  528'h640800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171000000000000000
`define S2M_NDR_FLIT_6  528'h579800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171000000000000000
`define S2M_NDR_FLIT_7  528'h96ab00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171000000000000000
`define S2M_NDR_FLIT_8  528'h87ef00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171000000000000000
`define S2M_NDR_FLIT_9  528'hf40900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171000000000000000
`define S2M_NDR_FLIT_10 528'hb47600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171000000000000000
`define S2M_NDR_FLIT_11 528'ha50100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171000000000000000
`define S2M_NDR_FLIT_12 528'hc68400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171000000000000000
`define S2M_NDR_FLIT_13 528'hd14900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171000000000000000
`define S2M_NDR_FLIT_14 528'h743100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171000000000000000
`define S2M_NDR_FLIT_15 528'h297600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171000000000000000






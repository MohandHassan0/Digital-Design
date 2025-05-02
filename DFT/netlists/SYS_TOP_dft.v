/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Wed Oct 23 22:05:44 2024
/////////////////////////////////////////////////////////////


module mux2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_4 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_3 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_2 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;


  AO2B2X2M U1 ( .B0(SEL), .B1(IN_1), .A0(IN_0), .A1N(SEL), .Y(OUT) );
endmodule


module mux2X1_6 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;


  AO2B2X2M U1 ( .B0(SEL), .B1(IN_1), .A0(IN_0), .A1N(SEL), .Y(OUT) );
endmodule


module mux2X1_5 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;


  AO2B2X2M U1 ( .B0(SEL), .B1(IN_1), .A0(IN_0), .A1N(SEL), .Y(OUT) );
endmodule


module RST_Sync_NUM_STAGES2_test_0 ( CLK, RST, SYNC_RST, test_si, test_so, 
        test_se );
  input CLK, RST, test_si, test_se;
  output SYNC_RST, test_so;
  wire   \chain[0] ;
  assign test_so = \chain[0] ;

  SDFFRQX2M SYNC_RST_reg ( .D(\chain[0] ), .SI(test_si), .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
  SDFFRQX2M \chain_reg[0]  ( .D(1'b1), .SI(SYNC_RST), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(\chain[0] ) );
endmodule


module RST_Sync_NUM_STAGES2_test_1 ( CLK, RST, SYNC_RST, test_si, test_so, 
        test_se );
  input CLK, RST, test_si, test_se;
  output SYNC_RST, test_so;
  wire   \chain[0] ;
  assign test_so = \chain[0] ;

  SDFFRQX2M \chain_reg[0]  ( .D(1'b1), .SI(SYNC_RST), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(\chain[0] ) );
  SDFFRQX1M SYNC_RST_reg ( .D(\chain[0] ), .SI(test_si), .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
endmodule


module Data_Sync_NUM_STAGES2_BUS_WIDTH8_test_1 ( bus_enable, CLK, RST, 
        unsync_bus, enable_pulse, sync_bus, test_si, test_se );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input bus_enable, CLK, RST, test_si, test_se;
  output enable_pulse;
  wire   final, n1, n3, n5, n7, n9, n11, n13, n15, n17, n22;
  wire   [1:0] chain;

  SDFFRQX2M final_reg ( .D(chain[1]), .SI(enable_pulse), .SE(test_se), .CK(CLK), .RN(RST), .Q(final) );
  SDFFRQX2M enable_pulse_reg ( .D(n22), .SI(chain[1]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(enable_pulse) );
  SDFFRQX2M \chain_reg[1]  ( .D(chain[0]), .SI(chain[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(chain[1]) );
  SDFFRQX2M \sync_bus_reg[3]  ( .D(n9), .SI(sync_bus[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[3]) );
  SDFFRQX2M \sync_bus_reg[0]  ( .D(n3), .SI(final), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sync_bus[0]) );
  SDFFRQX2M \sync_bus_reg[1]  ( .D(n5), .SI(sync_bus[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[1]) );
  SDFFRQX2M \sync_bus_reg[2]  ( .D(n7), .SI(sync_bus[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[2]) );
  SDFFRQX2M \sync_bus_reg[7]  ( .D(n17), .SI(sync_bus[6]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[7]) );
  SDFFRQX2M \sync_bus_reg[4]  ( .D(n11), .SI(sync_bus[3]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[4]) );
  SDFFRQX2M \sync_bus_reg[5]  ( .D(n13), .SI(sync_bus[4]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[5]) );
  SDFFRQX2M \sync_bus_reg[6]  ( .D(n15), .SI(sync_bus[5]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[6]) );
  SDFFRQX2M \chain_reg[0]  ( .D(bus_enable), .SI(test_si), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(chain[0]) );
  INVX2M U3 ( .A(n1), .Y(n22) );
  NAND2BX2M U4 ( .AN(final), .B(chain[1]), .Y(n1) );
  AO22X1M U5 ( .A0(unsync_bus[0]), .A1(n22), .B0(sync_bus[0]), .B1(n1), .Y(n3)
         );
  AO22X1M U6 ( .A0(unsync_bus[1]), .A1(n22), .B0(sync_bus[1]), .B1(n1), .Y(n5)
         );
  AO22X1M U7 ( .A0(unsync_bus[2]), .A1(n22), .B0(sync_bus[2]), .B1(n1), .Y(n7)
         );
  AO22X1M U8 ( .A0(unsync_bus[3]), .A1(n22), .B0(sync_bus[3]), .B1(n1), .Y(n9)
         );
  AO22X1M U9 ( .A0(unsync_bus[4]), .A1(n22), .B0(sync_bus[4]), .B1(n1), .Y(n11) );
  AO22X1M U10 ( .A0(unsync_bus[5]), .A1(n22), .B0(sync_bus[5]), .B1(n1), .Y(
        n13) );
  AO22X1M U11 ( .A0(unsync_bus[6]), .A1(n22), .B0(sync_bus[6]), .B1(n1), .Y(
        n15) );
  AO22X1M U12 ( .A0(unsync_bus[7]), .A1(n22), .B0(sync_bus[7]), .B1(n1), .Y(
        n17) );
endmodule


module fifo_wptr_full_test_1 ( w_inc, CLK, RST, r_ptr_syncronized, w_address, 
        w_ptr, w_full, test_si, test_se );
  input [3:0] r_ptr_syncronized;
  output [2:0] w_address;
  output [3:0] w_ptr;
  input w_inc, CLK, RST, test_si, test_se;
  output w_full;
  wire   n11, n12, n13, n14, n15, n16, n17, n19, n20, n21, n22, n1, n2, n7, n8
;

  SDFFRQX2M \internal_reg[3]  ( .D(n19), .SI(w_address[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(w_ptr[3]) );
  SDFFRQX2M \internal_reg[2]  ( .D(n20), .SI(w_address[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(w_address[2]) );
  SDFFRQX2M \internal_reg[0]  ( .D(n22), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(w_address[0]) );
  SDFFRQX2M \internal_reg[1]  ( .D(n21), .SI(w_address[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(w_address[1]) );
  NOR2BX2M U7 ( .AN(w_inc), .B(w_full), .Y(n13) );
  CLKXOR2X2M U8 ( .A(n7), .B(n11), .Y(n20) );
  XNOR2X2M U9 ( .A(n8), .B(n1), .Y(n19) );
  NOR2X2M U10 ( .A(n11), .B(n7), .Y(n1) );
  CLKXOR2X2M U11 ( .A(n8), .B(n7), .Y(w_ptr[2]) );
  AND4X2M U12 ( .A(n14), .B(n15), .C(n16), .D(n17), .Y(w_full) );
  CLKXOR2X2M U13 ( .A(w_ptr[3]), .B(r_ptr_syncronized[3]), .Y(n17) );
  XNOR2X2M U14 ( .A(w_ptr[1]), .B(r_ptr_syncronized[1]), .Y(n14) );
  XNOR2X2M U15 ( .A(w_ptr[0]), .B(r_ptr_syncronized[0]), .Y(n15) );
  AND2X2M U16 ( .A(RST), .B(n2), .Y(n16) );
  CLKXOR2X2M U17 ( .A(w_ptr[2]), .B(r_ptr_syncronized[2]), .Y(n2) );
  NAND2X2M U18 ( .A(n12), .B(w_address[1]), .Y(n11) );
  AND2X2M U19 ( .A(n13), .B(w_address[0]), .Y(n12) );
  CLKXOR2X2M U20 ( .A(w_address[1]), .B(n12), .Y(n21) );
  CLKXOR2X2M U21 ( .A(w_address[0]), .B(n13), .Y(n22) );
  INVX2M U22 ( .A(w_address[2]), .Y(n7) );
  INVX2M U23 ( .A(w_ptr[3]), .Y(n8) );
  CLKXOR2X2M U24 ( .A(w_address[1]), .B(w_address[2]), .Y(w_ptr[1]) );
  CLKXOR2X2M U25 ( .A(w_address[0]), .B(w_address[1]), .Y(w_ptr[0]) );
endmodule


module data_sync_fifo_test_1 ( insertion, out, CLK, RST, test_si, test_so, 
        test_se );
  input [3:0] insertion;
  output [3:0] out;
  input CLK, RST, test_si, test_se;
  output test_so;

  wire   [3:0] stage_one;
  assign test_so = stage_one[3];

  SDFFRQX2M \out_reg[1]  ( .D(stage_one[1]), .SI(out[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(out[1]) );
  SDFFRQX2M \out_reg[0]  ( .D(stage_one[0]), .SI(test_si), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(out[0]) );
  SDFFRQX2M \stage_one_reg[3]  ( .D(insertion[3]), .SI(stage_one[2]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(stage_one[3]) );
  SDFFRQX2M \stage_one_reg[2]  ( .D(insertion[2]), .SI(stage_one[1]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(stage_one[2]) );
  SDFFRQX2M \stage_one_reg[1]  ( .D(insertion[1]), .SI(stage_one[0]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(stage_one[1]) );
  SDFFRQX2M \stage_one_reg[0]  ( .D(insertion[0]), .SI(out[3]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(stage_one[0]) );
  SDFFRQX1M \out_reg[3]  ( .D(stage_one[3]), .SI(out[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(out[3]) );
  SDFFRQX1M \out_reg[2]  ( .D(stage_one[2]), .SI(out[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(out[2]) );
endmodule


module fifo_rptr_empty_test_1 ( r_inc, CLK, RST, w_ptr_syncronized, r_address, 
        r_ptr, r_empty, test_si, test_se );
  input [3:0] w_ptr_syncronized;
  output [2:0] r_address;
  output [3:0] r_ptr;
  input r_inc, CLK, RST, test_si, test_se;
  output r_empty;
  wire   n7, n9, n10, n11, n12, n13, n14, n15, n16, n17, n19, n20, n21, n22,
         n2;

  SDFFRQX2M \internal_reg[3]  ( .D(n19), .SI(r_address[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(r_ptr[3]) );
  SDFFRQX2M \internal_reg[2]  ( .D(n20), .SI(r_address[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(r_address[2]) );
  SDFFRQX2M \internal_reg[1]  ( .D(n21), .SI(n7), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(r_address[1]) );
  SDFFRX1M \internal_reg[0]  ( .D(n22), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(r_address[0]), .QN(n7) );
  INVX2M U8 ( .A(n9), .Y(r_empty) );
  NOR2X2M U9 ( .A(n13), .B(n7), .Y(n12) );
  NAND4X2M U10 ( .A(n14), .B(n15), .C(n16), .D(n17), .Y(n9) );
  XNOR2X2M U11 ( .A(r_ptr[0]), .B(w_ptr_syncronized[0]), .Y(n15) );
  XNOR2X2M U12 ( .A(r_ptr[2]), .B(w_ptr_syncronized[2]), .Y(n17) );
  XNOR2X2M U13 ( .A(r_ptr[1]), .B(w_ptr_syncronized[1]), .Y(n14) );
  NAND2X2M U14 ( .A(n12), .B(r_address[1]), .Y(n11) );
  AND2X2M U15 ( .A(RST), .B(n2), .Y(n16) );
  XNOR2X2M U16 ( .A(w_ptr_syncronized[3]), .B(r_ptr[3]), .Y(n2) );
  CLKXOR2X2M U17 ( .A(r_ptr[3]), .B(n10), .Y(n19) );
  NOR2BX2M U18 ( .AN(r_address[2]), .B(n11), .Y(n10) );
  NAND2X2M U19 ( .A(r_inc), .B(n9), .Y(n13) );
  XNOR2X2M U20 ( .A(r_address[2]), .B(n11), .Y(n20) );
  CLKXOR2X2M U21 ( .A(r_address[1]), .B(n12), .Y(n21) );
  CLKXOR2X2M U22 ( .A(n7), .B(n13), .Y(n22) );
  XNOR2X2M U23 ( .A(n7), .B(r_address[1]), .Y(r_ptr[0]) );
  CLKXOR2X2M U24 ( .A(r_address[1]), .B(r_address[2]), .Y(r_ptr[1]) );
  CLKXOR2X2M U25 ( .A(r_ptr[3]), .B(r_address[2]), .Y(r_ptr[2]) );
endmodule


module data_sync_fifo_test_0 ( insertion, out, CLK, RST, test_si, test_so, 
        test_se );
  input [3:0] insertion;
  output [3:0] out;
  input CLK, RST, test_si, test_se;
  output test_so;

  wire   [3:0] stage_one;
  assign test_so = stage_one[3];

  SDFFRQX2M \out_reg[1]  ( .D(stage_one[1]), .SI(out[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(out[1]) );
  SDFFRQX2M \out_reg[0]  ( .D(stage_one[0]), .SI(test_si), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(out[0]) );
  SDFFRQX2M \stage_one_reg[3]  ( .D(insertion[3]), .SI(stage_one[2]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(stage_one[3]) );
  SDFFRQX2M \stage_one_reg[2]  ( .D(insertion[2]), .SI(stage_one[1]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(stage_one[2]) );
  SDFFRQX2M \stage_one_reg[1]  ( .D(insertion[1]), .SI(stage_one[0]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(stage_one[1]) );
  SDFFRQX2M \stage_one_reg[0]  ( .D(insertion[0]), .SI(out[3]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(stage_one[0]) );
  SDFFRQX1M \out_reg[3]  ( .D(stage_one[3]), .SI(out[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(out[3]) );
  SDFFRQX1M \out_reg[2]  ( .D(stage_one[2]), .SI(out[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(out[2]) );
endmodule


module fifo_memory_data_width8_test_1 ( w_data, full, w_inc, CLK, RST, 
        w_address, r_address, r_data, test_si2, test_si1, test_so2, test_so1, 
        test_se );
  input [7:0] w_data;
  input [2:0] w_address;
  input [2:0] r_address;
  output [7:0] r_data;
  input full, w_inc, CLK, RST, test_si2, test_si1, test_se;
  output test_so2, test_so1;
  wire   N10, N11, N12, \Memory[7][7] , \Memory[7][6] , \Memory[7][5] ,
         \Memory[7][4] , \Memory[7][3] , \Memory[7][2] , \Memory[7][1] ,
         \Memory[7][0] , \Memory[6][7] , \Memory[6][6] , \Memory[6][5] ,
         \Memory[6][4] , \Memory[6][3] , \Memory[6][2] , \Memory[6][1] ,
         \Memory[6][0] , \Memory[5][7] , \Memory[5][6] , \Memory[5][5] ,
         \Memory[5][4] , \Memory[5][3] , \Memory[5][2] , \Memory[5][1] ,
         \Memory[5][0] , \Memory[4][7] , \Memory[4][6] , \Memory[4][5] ,
         \Memory[4][4] , \Memory[4][3] , \Memory[4][2] , \Memory[4][1] ,
         \Memory[4][0] , \Memory[3][7] , \Memory[3][6] , \Memory[3][5] ,
         \Memory[3][4] , \Memory[3][3] , \Memory[3][2] , \Memory[3][1] ,
         \Memory[3][0] , \Memory[2][7] , \Memory[2][6] , \Memory[2][5] ,
         \Memory[2][4] , \Memory[2][3] , \Memory[2][2] , \Memory[2][1] ,
         \Memory[2][0] , \Memory[1][7] , \Memory[1][6] , \Memory[1][5] ,
         \Memory[1][4] , \Memory[1][3] , \Memory[1][2] , \Memory[1][1] ,
         \Memory[1][0] , \Memory[0][7] , \Memory[0][6] , \Memory[0][5] ,
         \Memory[0][4] , \Memory[0][3] , \Memory[0][2] , \Memory[0][1] ,
         \Memory[0][0] , n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178;
  assign N10 = r_address[0];
  assign N11 = r_address[1];
  assign N12 = r_address[2];
  assign test_so2 = \Memory[7][7] ;
  assign test_so1 = \Memory[3][2] ;

  SDFFRQX2M \Memory_reg[5][7]  ( .D(n133), .SI(\Memory[5][6] ), .SE(test_se), 
        .CK(CLK), .RN(n164), .Q(\Memory[5][7] ) );
  SDFFRQX2M \Memory_reg[5][6]  ( .D(n132), .SI(\Memory[5][5] ), .SE(test_se), 
        .CK(CLK), .RN(n164), .Q(\Memory[5][6] ) );
  SDFFRQX2M \Memory_reg[5][5]  ( .D(n131), .SI(\Memory[5][4] ), .SE(test_se), 
        .CK(CLK), .RN(n164), .Q(\Memory[5][5] ) );
  SDFFRQX2M \Memory_reg[5][4]  ( .D(n130), .SI(\Memory[5][3] ), .SE(test_se), 
        .CK(CLK), .RN(n164), .Q(\Memory[5][4] ) );
  SDFFRQX2M \Memory_reg[5][3]  ( .D(n129), .SI(\Memory[5][2] ), .SE(test_se), 
        .CK(CLK), .RN(n164), .Q(\Memory[5][3] ) );
  SDFFRQX2M \Memory_reg[5][2]  ( .D(n128), .SI(\Memory[5][1] ), .SE(test_se), 
        .CK(CLK), .RN(n164), .Q(\Memory[5][2] ) );
  SDFFRQX2M \Memory_reg[5][1]  ( .D(n127), .SI(\Memory[5][0] ), .SE(test_se), 
        .CK(CLK), .RN(n164), .Q(\Memory[5][1] ) );
  SDFFRQX2M \Memory_reg[5][0]  ( .D(n126), .SI(\Memory[4][7] ), .SE(test_se), 
        .CK(CLK), .RN(n164), .Q(\Memory[5][0] ) );
  SDFFRQX2M \Memory_reg[1][7]  ( .D(n101), .SI(\Memory[1][6] ), .SE(test_se), 
        .CK(CLK), .RN(n167), .Q(\Memory[1][7] ) );
  SDFFRQX2M \Memory_reg[1][6]  ( .D(n100), .SI(\Memory[1][5] ), .SE(test_se), 
        .CK(CLK), .RN(n167), .Q(\Memory[1][6] ) );
  SDFFRQX2M \Memory_reg[1][5]  ( .D(n99), .SI(\Memory[1][4] ), .SE(test_se), 
        .CK(CLK), .RN(n167), .Q(\Memory[1][5] ) );
  SDFFRQX2M \Memory_reg[1][4]  ( .D(n98), .SI(\Memory[1][3] ), .SE(test_se), 
        .CK(CLK), .RN(n167), .Q(\Memory[1][4] ) );
  SDFFRQX2M \Memory_reg[1][3]  ( .D(n97), .SI(\Memory[1][2] ), .SE(test_se), 
        .CK(CLK), .RN(n167), .Q(\Memory[1][3] ) );
  SDFFRQX2M \Memory_reg[1][2]  ( .D(n96), .SI(\Memory[1][1] ), .SE(test_se), 
        .CK(CLK), .RN(n167), .Q(\Memory[1][2] ) );
  SDFFRQX2M \Memory_reg[1][1]  ( .D(n95), .SI(\Memory[1][0] ), .SE(test_se), 
        .CK(CLK), .RN(n167), .Q(\Memory[1][1] ) );
  SDFFRQX2M \Memory_reg[1][0]  ( .D(n94), .SI(\Memory[0][7] ), .SE(test_se), 
        .CK(CLK), .RN(n167), .Q(\Memory[1][0] ) );
  SDFFRQX2M \Memory_reg[7][7]  ( .D(n149), .SI(\Memory[7][6] ), .SE(test_se), 
        .CK(CLK), .RN(n163), .Q(\Memory[7][7] ) );
  SDFFRQX2M \Memory_reg[7][6]  ( .D(n148), .SI(\Memory[7][5] ), .SE(test_se), 
        .CK(CLK), .RN(n163), .Q(\Memory[7][6] ) );
  SDFFRQX2M \Memory_reg[7][5]  ( .D(n147), .SI(\Memory[7][4] ), .SE(test_se), 
        .CK(CLK), .RN(n163), .Q(\Memory[7][5] ) );
  SDFFRQX2M \Memory_reg[7][4]  ( .D(n146), .SI(\Memory[7][3] ), .SE(test_se), 
        .CK(CLK), .RN(n163), .Q(\Memory[7][4] ) );
  SDFFRQX2M \Memory_reg[7][3]  ( .D(n145), .SI(\Memory[7][2] ), .SE(test_se), 
        .CK(CLK), .RN(n163), .Q(\Memory[7][3] ) );
  SDFFRQX2M \Memory_reg[7][2]  ( .D(n144), .SI(\Memory[7][1] ), .SE(test_se), 
        .CK(CLK), .RN(n163), .Q(\Memory[7][2] ) );
  SDFFRQX2M \Memory_reg[7][1]  ( .D(n143), .SI(\Memory[7][0] ), .SE(test_se), 
        .CK(CLK), .RN(n163), .Q(\Memory[7][1] ) );
  SDFFRQX2M \Memory_reg[7][0]  ( .D(n142), .SI(\Memory[6][7] ), .SE(test_se), 
        .CK(CLK), .RN(n163), .Q(\Memory[7][0] ) );
  SDFFRQX2M \Memory_reg[3][7]  ( .D(n117), .SI(\Memory[3][6] ), .SE(test_se), 
        .CK(CLK), .RN(n165), .Q(\Memory[3][7] ) );
  SDFFRQX2M \Memory_reg[3][6]  ( .D(n116), .SI(\Memory[3][5] ), .SE(test_se), 
        .CK(CLK), .RN(n165), .Q(\Memory[3][6] ) );
  SDFFRQX2M \Memory_reg[3][5]  ( .D(n115), .SI(\Memory[3][4] ), .SE(test_se), 
        .CK(CLK), .RN(n165), .Q(\Memory[3][5] ) );
  SDFFRQX2M \Memory_reg[3][4]  ( .D(n114), .SI(\Memory[3][3] ), .SE(test_se), 
        .CK(CLK), .RN(n165), .Q(\Memory[3][4] ) );
  SDFFRQX2M \Memory_reg[3][3]  ( .D(n113), .SI(test_si2), .SE(test_se), .CK(
        CLK), .RN(n166), .Q(\Memory[3][3] ) );
  SDFFRQX2M \Memory_reg[3][2]  ( .D(n112), .SI(\Memory[3][1] ), .SE(test_se), 
        .CK(CLK), .RN(n166), .Q(\Memory[3][2] ) );
  SDFFRQX2M \Memory_reg[3][1]  ( .D(n111), .SI(\Memory[3][0] ), .SE(test_se), 
        .CK(CLK), .RN(n166), .Q(\Memory[3][1] ) );
  SDFFRQX2M \Memory_reg[3][0]  ( .D(n110), .SI(\Memory[2][7] ), .SE(test_se), 
        .CK(CLK), .RN(n166), .Q(\Memory[3][0] ) );
  SDFFRQX2M \Memory_reg[6][7]  ( .D(n141), .SI(\Memory[6][6] ), .SE(test_se), 
        .CK(CLK), .RN(n163), .Q(\Memory[6][7] ) );
  SDFFRQX2M \Memory_reg[6][6]  ( .D(n140), .SI(\Memory[6][5] ), .SE(test_se), 
        .CK(CLK), .RN(n163), .Q(\Memory[6][6] ) );
  SDFFRQX2M \Memory_reg[6][5]  ( .D(n139), .SI(\Memory[6][4] ), .SE(test_se), 
        .CK(CLK), .RN(n163), .Q(\Memory[6][5] ) );
  SDFFRQX2M \Memory_reg[6][4]  ( .D(n138), .SI(\Memory[6][3] ), .SE(test_se), 
        .CK(CLK), .RN(n163), .Q(\Memory[6][4] ) );
  SDFFRQX2M \Memory_reg[6][3]  ( .D(n137), .SI(\Memory[6][2] ), .SE(test_se), 
        .CK(CLK), .RN(n164), .Q(\Memory[6][3] ) );
  SDFFRQX2M \Memory_reg[6][2]  ( .D(n136), .SI(\Memory[6][1] ), .SE(test_se), 
        .CK(CLK), .RN(n164), .Q(\Memory[6][2] ) );
  SDFFRQX2M \Memory_reg[6][1]  ( .D(n135), .SI(\Memory[6][0] ), .SE(test_se), 
        .CK(CLK), .RN(n164), .Q(\Memory[6][1] ) );
  SDFFRQX2M \Memory_reg[6][0]  ( .D(n134), .SI(\Memory[5][7] ), .SE(test_se), 
        .CK(CLK), .RN(n164), .Q(\Memory[6][0] ) );
  SDFFRQX2M \Memory_reg[2][7]  ( .D(n109), .SI(\Memory[2][6] ), .SE(test_se), 
        .CK(CLK), .RN(n166), .Q(\Memory[2][7] ) );
  SDFFRQX2M \Memory_reg[2][6]  ( .D(n108), .SI(\Memory[2][5] ), .SE(test_se), 
        .CK(CLK), .RN(n166), .Q(\Memory[2][6] ) );
  SDFFRQX2M \Memory_reg[2][5]  ( .D(n107), .SI(\Memory[2][4] ), .SE(test_se), 
        .CK(CLK), .RN(n166), .Q(\Memory[2][5] ) );
  SDFFRQX2M \Memory_reg[2][4]  ( .D(n106), .SI(\Memory[2][3] ), .SE(test_se), 
        .CK(CLK), .RN(n166), .Q(\Memory[2][4] ) );
  SDFFRQX2M \Memory_reg[2][3]  ( .D(n105), .SI(\Memory[2][2] ), .SE(test_se), 
        .CK(CLK), .RN(n166), .Q(\Memory[2][3] ) );
  SDFFRQX2M \Memory_reg[2][2]  ( .D(n104), .SI(\Memory[2][1] ), .SE(test_se), 
        .CK(CLK), .RN(n166), .Q(\Memory[2][2] ) );
  SDFFRQX2M \Memory_reg[2][1]  ( .D(n103), .SI(\Memory[2][0] ), .SE(test_se), 
        .CK(CLK), .RN(n166), .Q(\Memory[2][1] ) );
  SDFFRQX2M \Memory_reg[2][0]  ( .D(n102), .SI(\Memory[1][7] ), .SE(test_se), 
        .CK(CLK), .RN(n166), .Q(\Memory[2][0] ) );
  SDFFRQX2M \Memory_reg[4][7]  ( .D(n125), .SI(\Memory[4][6] ), .SE(test_se), 
        .CK(CLK), .RN(n165), .Q(\Memory[4][7] ) );
  SDFFRQX2M \Memory_reg[4][6]  ( .D(n124), .SI(\Memory[4][5] ), .SE(test_se), 
        .CK(CLK), .RN(n165), .Q(\Memory[4][6] ) );
  SDFFRQX2M \Memory_reg[4][5]  ( .D(n123), .SI(\Memory[4][4] ), .SE(test_se), 
        .CK(CLK), .RN(n165), .Q(\Memory[4][5] ) );
  SDFFRQX2M \Memory_reg[4][4]  ( .D(n122), .SI(\Memory[4][3] ), .SE(test_se), 
        .CK(CLK), .RN(n165), .Q(\Memory[4][4] ) );
  SDFFRQX2M \Memory_reg[4][3]  ( .D(n121), .SI(\Memory[4][2] ), .SE(test_se), 
        .CK(CLK), .RN(n165), .Q(\Memory[4][3] ) );
  SDFFRQX2M \Memory_reg[4][2]  ( .D(n120), .SI(\Memory[4][1] ), .SE(test_se), 
        .CK(CLK), .RN(n165), .Q(\Memory[4][2] ) );
  SDFFRQX2M \Memory_reg[4][1]  ( .D(n119), .SI(\Memory[4][0] ), .SE(test_se), 
        .CK(CLK), .RN(n165), .Q(\Memory[4][1] ) );
  SDFFRQX2M \Memory_reg[4][0]  ( .D(n118), .SI(\Memory[3][7] ), .SE(test_se), 
        .CK(CLK), .RN(n165), .Q(\Memory[4][0] ) );
  SDFFRQX2M \Memory_reg[0][7]  ( .D(n93), .SI(\Memory[0][6] ), .SE(test_se), 
        .CK(CLK), .RN(n167), .Q(\Memory[0][7] ) );
  SDFFRQX2M \Memory_reg[0][6]  ( .D(n92), .SI(\Memory[0][5] ), .SE(test_se), 
        .CK(CLK), .RN(n167), .Q(\Memory[0][6] ) );
  SDFFRQX2M \Memory_reg[0][5]  ( .D(n91), .SI(\Memory[0][4] ), .SE(test_se), 
        .CK(CLK), .RN(n167), .Q(\Memory[0][5] ) );
  SDFFRQX2M \Memory_reg[0][4]  ( .D(n90), .SI(\Memory[0][3] ), .SE(test_se), 
        .CK(CLK), .RN(n167), .Q(\Memory[0][4] ) );
  SDFFRQX2M \Memory_reg[0][3]  ( .D(n89), .SI(\Memory[0][2] ), .SE(test_se), 
        .CK(CLK), .RN(n168), .Q(\Memory[0][3] ) );
  SDFFRQX2M \Memory_reg[0][2]  ( .D(n88), .SI(\Memory[0][1] ), .SE(test_se), 
        .CK(CLK), .RN(n168), .Q(\Memory[0][2] ) );
  SDFFRQX2M \Memory_reg[0][1]  ( .D(n87), .SI(\Memory[0][0] ), .SE(test_se), 
        .CK(CLK), .RN(n168), .Q(\Memory[0][1] ) );
  SDFFRQX2M \Memory_reg[0][0]  ( .D(n86), .SI(test_si1), .SE(test_se), .CK(CLK), .RN(n168), .Q(\Memory[0][0] ) );
  BUFX2M U66 ( .A(n83), .Y(n159) );
  BUFX2M U67 ( .A(n84), .Y(n158) );
  BUFX2M U68 ( .A(n85), .Y(n157) );
  BUFX2M U69 ( .A(n78), .Y(n160) );
  BUFX2M U70 ( .A(n162), .Y(n167) );
  BUFX2M U71 ( .A(n162), .Y(n166) );
  BUFX2M U72 ( .A(n161), .Y(n165) );
  BUFX2M U73 ( .A(n161), .Y(n164) );
  BUFX2M U74 ( .A(n161), .Y(n163) );
  BUFX2M U75 ( .A(n162), .Y(n168) );
  BUFX2M U76 ( .A(RST), .Y(n162) );
  BUFX2M U77 ( .A(RST), .Y(n161) );
  NAND3X2M U78 ( .A(n177), .B(n178), .C(n76), .Y(n75) );
  NOR2BX2M U79 ( .AN(w_inc), .B(full), .Y(n80) );
  NAND3X2M U80 ( .A(n177), .B(n178), .C(n82), .Y(n81) );
  NAND3X2M U81 ( .A(w_address[0]), .B(n76), .C(w_address[1]), .Y(n79) );
  NAND3X2M U82 ( .A(n76), .B(n178), .C(w_address[0]), .Y(n77) );
  NOR2BX2M U83 ( .AN(n80), .B(w_address[2]), .Y(n76) );
  OAI2BB2X1M U84 ( .B0(n75), .B1(n169), .A0N(\Memory[0][0] ), .A1N(n75), .Y(
        n86) );
  OAI2BB2X1M U85 ( .B0(n75), .B1(n170), .A0N(\Memory[0][1] ), .A1N(n75), .Y(
        n87) );
  OAI2BB2X1M U86 ( .B0(n75), .B1(n171), .A0N(\Memory[0][2] ), .A1N(n75), .Y(
        n88) );
  OAI2BB2X1M U87 ( .B0(n75), .B1(n172), .A0N(\Memory[0][3] ), .A1N(n75), .Y(
        n89) );
  OAI2BB2X1M U88 ( .B0(n75), .B1(n173), .A0N(\Memory[0][4] ), .A1N(n75), .Y(
        n90) );
  OAI2BB2X1M U89 ( .B0(n75), .B1(n174), .A0N(\Memory[0][5] ), .A1N(n75), .Y(
        n91) );
  OAI2BB2X1M U90 ( .B0(n75), .B1(n175), .A0N(\Memory[0][6] ), .A1N(n75), .Y(
        n92) );
  OAI2BB2X1M U91 ( .B0(n75), .B1(n176), .A0N(\Memory[0][7] ), .A1N(n75), .Y(
        n93) );
  OAI2BB2X1M U92 ( .B0(n169), .B1(n79), .A0N(\Memory[3][0] ), .A1N(n79), .Y(
        n110) );
  OAI2BB2X1M U93 ( .B0(n170), .B1(n79), .A0N(\Memory[3][1] ), .A1N(n79), .Y(
        n111) );
  OAI2BB2X1M U94 ( .B0(n171), .B1(n79), .A0N(\Memory[3][2] ), .A1N(n79), .Y(
        n112) );
  OAI2BB2X1M U95 ( .B0(n172), .B1(n79), .A0N(\Memory[3][3] ), .A1N(n79), .Y(
        n113) );
  OAI2BB2X1M U96 ( .B0(n173), .B1(n79), .A0N(\Memory[3][4] ), .A1N(n79), .Y(
        n114) );
  OAI2BB2X1M U97 ( .B0(n174), .B1(n79), .A0N(\Memory[3][5] ), .A1N(n79), .Y(
        n115) );
  OAI2BB2X1M U98 ( .B0(n175), .B1(n79), .A0N(\Memory[3][6] ), .A1N(n79), .Y(
        n116) );
  OAI2BB2X1M U99 ( .B0(n176), .B1(n79), .A0N(\Memory[3][7] ), .A1N(n79), .Y(
        n117) );
  OAI2BB2X1M U100 ( .B0(n169), .B1(n77), .A0N(\Memory[1][0] ), .A1N(n77), .Y(
        n94) );
  OAI2BB2X1M U101 ( .B0(n170), .B1(n77), .A0N(\Memory[1][1] ), .A1N(n77), .Y(
        n95) );
  OAI2BB2X1M U102 ( .B0(n171), .B1(n77), .A0N(\Memory[1][2] ), .A1N(n77), .Y(
        n96) );
  OAI2BB2X1M U103 ( .B0(n172), .B1(n77), .A0N(\Memory[1][3] ), .A1N(n77), .Y(
        n97) );
  OAI2BB2X1M U104 ( .B0(n173), .B1(n77), .A0N(\Memory[1][4] ), .A1N(n77), .Y(
        n98) );
  OAI2BB2X1M U105 ( .B0(n174), .B1(n77), .A0N(\Memory[1][5] ), .A1N(n77), .Y(
        n99) );
  OAI2BB2X1M U106 ( .B0(n175), .B1(n77), .A0N(\Memory[1][6] ), .A1N(n77), .Y(
        n100) );
  OAI2BB2X1M U107 ( .B0(n176), .B1(n77), .A0N(\Memory[1][7] ), .A1N(n77), .Y(
        n101) );
  OAI2BB2X1M U108 ( .B0(n169), .B1(n81), .A0N(\Memory[4][0] ), .A1N(n81), .Y(
        n118) );
  OAI2BB2X1M U109 ( .B0(n170), .B1(n81), .A0N(\Memory[4][1] ), .A1N(n81), .Y(
        n119) );
  OAI2BB2X1M U110 ( .B0(n171), .B1(n81), .A0N(\Memory[4][2] ), .A1N(n81), .Y(
        n120) );
  OAI2BB2X1M U111 ( .B0(n172), .B1(n81), .A0N(\Memory[4][3] ), .A1N(n81), .Y(
        n121) );
  OAI2BB2X1M U112 ( .B0(n173), .B1(n81), .A0N(\Memory[4][4] ), .A1N(n81), .Y(
        n122) );
  OAI2BB2X1M U113 ( .B0(n174), .B1(n81), .A0N(\Memory[4][5] ), .A1N(n81), .Y(
        n123) );
  OAI2BB2X1M U114 ( .B0(n175), .B1(n81), .A0N(\Memory[4][6] ), .A1N(n81), .Y(
        n124) );
  OAI2BB2X1M U115 ( .B0(n176), .B1(n81), .A0N(\Memory[4][7] ), .A1N(n81), .Y(
        n125) );
  INVX2M U116 ( .A(w_data[0]), .Y(n169) );
  INVX2M U117 ( .A(w_data[1]), .Y(n170) );
  INVX2M U118 ( .A(w_data[2]), .Y(n171) );
  INVX2M U119 ( .A(w_data[3]), .Y(n172) );
  INVX2M U120 ( .A(w_data[4]), .Y(n173) );
  INVX2M U121 ( .A(w_data[5]), .Y(n174) );
  INVX2M U122 ( .A(w_data[6]), .Y(n175) );
  INVX2M U123 ( .A(w_data[7]), .Y(n176) );
  OAI2BB2X1M U124 ( .B0(n169), .B1(n160), .A0N(\Memory[2][0] ), .A1N(n160), 
        .Y(n102) );
  OAI2BB2X1M U125 ( .B0(n170), .B1(n160), .A0N(\Memory[2][1] ), .A1N(n160), 
        .Y(n103) );
  OAI2BB2X1M U126 ( .B0(n171), .B1(n160), .A0N(\Memory[2][2] ), .A1N(n160), 
        .Y(n104) );
  OAI2BB2X1M U127 ( .B0(n172), .B1(n160), .A0N(\Memory[2][3] ), .A1N(n160), 
        .Y(n105) );
  OAI2BB2X1M U128 ( .B0(n173), .B1(n160), .A0N(\Memory[2][4] ), .A1N(n160), 
        .Y(n106) );
  OAI2BB2X1M U129 ( .B0(n174), .B1(n160), .A0N(\Memory[2][5] ), .A1N(n160), 
        .Y(n107) );
  OAI2BB2X1M U130 ( .B0(n175), .B1(n160), .A0N(\Memory[2][6] ), .A1N(n160), 
        .Y(n108) );
  OAI2BB2X1M U131 ( .B0(n176), .B1(n160), .A0N(\Memory[2][7] ), .A1N(n160), 
        .Y(n109) );
  OAI2BB2X1M U132 ( .B0(n169), .B1(n159), .A0N(\Memory[5][0] ), .A1N(n159), 
        .Y(n126) );
  OAI2BB2X1M U133 ( .B0(n170), .B1(n159), .A0N(\Memory[5][1] ), .A1N(n159), 
        .Y(n127) );
  OAI2BB2X1M U134 ( .B0(n171), .B1(n159), .A0N(\Memory[5][2] ), .A1N(n159), 
        .Y(n128) );
  OAI2BB2X1M U135 ( .B0(n172), .B1(n159), .A0N(\Memory[5][3] ), .A1N(n159), 
        .Y(n129) );
  OAI2BB2X1M U136 ( .B0(n173), .B1(n159), .A0N(\Memory[5][4] ), .A1N(n159), 
        .Y(n130) );
  OAI2BB2X1M U137 ( .B0(n174), .B1(n159), .A0N(\Memory[5][5] ), .A1N(n159), 
        .Y(n131) );
  OAI2BB2X1M U138 ( .B0(n175), .B1(n159), .A0N(\Memory[5][6] ), .A1N(n159), 
        .Y(n132) );
  OAI2BB2X1M U139 ( .B0(n176), .B1(n159), .A0N(\Memory[5][7] ), .A1N(n159), 
        .Y(n133) );
  OAI2BB2X1M U140 ( .B0(n169), .B1(n158), .A0N(\Memory[6][0] ), .A1N(n158), 
        .Y(n134) );
  OAI2BB2X1M U141 ( .B0(n170), .B1(n158), .A0N(\Memory[6][1] ), .A1N(n158), 
        .Y(n135) );
  OAI2BB2X1M U142 ( .B0(n171), .B1(n158), .A0N(\Memory[6][2] ), .A1N(n158), 
        .Y(n136) );
  OAI2BB2X1M U143 ( .B0(n172), .B1(n158), .A0N(\Memory[6][3] ), .A1N(n158), 
        .Y(n137) );
  OAI2BB2X1M U144 ( .B0(n173), .B1(n158), .A0N(\Memory[6][4] ), .A1N(n158), 
        .Y(n138) );
  OAI2BB2X1M U145 ( .B0(n174), .B1(n158), .A0N(\Memory[6][5] ), .A1N(n158), 
        .Y(n139) );
  OAI2BB2X1M U146 ( .B0(n175), .B1(n158), .A0N(\Memory[6][6] ), .A1N(n158), 
        .Y(n140) );
  OAI2BB2X1M U147 ( .B0(n176), .B1(n158), .A0N(\Memory[6][7] ), .A1N(n158), 
        .Y(n141) );
  OAI2BB2X1M U148 ( .B0(n169), .B1(n157), .A0N(\Memory[7][0] ), .A1N(n157), 
        .Y(n142) );
  OAI2BB2X1M U149 ( .B0(n170), .B1(n157), .A0N(\Memory[7][1] ), .A1N(n157), 
        .Y(n143) );
  OAI2BB2X1M U150 ( .B0(n171), .B1(n157), .A0N(\Memory[7][2] ), .A1N(n157), 
        .Y(n144) );
  OAI2BB2X1M U151 ( .B0(n172), .B1(n157), .A0N(\Memory[7][3] ), .A1N(n157), 
        .Y(n145) );
  OAI2BB2X1M U152 ( .B0(n173), .B1(n157), .A0N(\Memory[7][4] ), .A1N(n157), 
        .Y(n146) );
  OAI2BB2X1M U153 ( .B0(n174), .B1(n157), .A0N(\Memory[7][5] ), .A1N(n157), 
        .Y(n147) );
  OAI2BB2X1M U154 ( .B0(n175), .B1(n157), .A0N(\Memory[7][6] ), .A1N(n157), 
        .Y(n148) );
  OAI2BB2X1M U155 ( .B0(n176), .B1(n157), .A0N(\Memory[7][7] ), .A1N(n157), 
        .Y(n149) );
  AND2X2M U156 ( .A(w_address[2]), .B(n80), .Y(n82) );
  NAND3X2M U157 ( .A(n76), .B(n177), .C(w_address[1]), .Y(n78) );
  NAND3X2M U158 ( .A(w_address[1]), .B(w_address[0]), .C(n82), .Y(n85) );
  NAND3X2M U159 ( .A(w_address[0]), .B(n178), .C(n82), .Y(n83) );
  NAND3X2M U160 ( .A(w_address[1]), .B(n177), .C(n82), .Y(n84) );
  BUFX4M U161 ( .A(N10), .Y(n156) );
  MX2X2M U162 ( .A(n155), .B(n154), .S0(N12), .Y(r_data[7]) );
  MX4X1M U163 ( .A(\Memory[0][7] ), .B(\Memory[1][7] ), .C(\Memory[2][7] ), 
        .D(\Memory[3][7] ), .S0(n156), .S1(N11), .Y(n155) );
  MX4X1M U164 ( .A(\Memory[4][7] ), .B(\Memory[5][7] ), .C(\Memory[6][7] ), 
        .D(\Memory[7][7] ), .S0(n156), .S1(N11), .Y(n154) );
  MX2X2M U165 ( .A(n153), .B(n152), .S0(N12), .Y(r_data[6]) );
  MX4X1M U166 ( .A(\Memory[0][6] ), .B(\Memory[1][6] ), .C(\Memory[2][6] ), 
        .D(\Memory[3][6] ), .S0(n156), .S1(N11), .Y(n153) );
  MX4X1M U167 ( .A(\Memory[4][6] ), .B(\Memory[5][6] ), .C(\Memory[6][6] ), 
        .D(\Memory[7][6] ), .S0(n156), .S1(N11), .Y(n152) );
  MX2X2M U168 ( .A(n70), .B(n69), .S0(N12), .Y(r_data[2]) );
  MX4X1M U169 ( .A(\Memory[0][2] ), .B(\Memory[1][2] ), .C(\Memory[2][2] ), 
        .D(\Memory[3][2] ), .S0(n156), .S1(N11), .Y(n70) );
  MX4X1M U170 ( .A(\Memory[4][2] ), .B(\Memory[5][2] ), .C(\Memory[6][2] ), 
        .D(\Memory[7][2] ), .S0(n156), .S1(N11), .Y(n69) );
  MX2X2M U171 ( .A(n66), .B(n65), .S0(N12), .Y(r_data[0]) );
  MX4X1M U172 ( .A(\Memory[0][0] ), .B(\Memory[1][0] ), .C(\Memory[2][0] ), 
        .D(\Memory[3][0] ), .S0(n156), .S1(N11), .Y(n66) );
  MX4X1M U173 ( .A(\Memory[4][0] ), .B(\Memory[5][0] ), .C(\Memory[6][0] ), 
        .D(\Memory[7][0] ), .S0(n156), .S1(N11), .Y(n65) );
  MX2X2M U174 ( .A(n72), .B(n71), .S0(N12), .Y(r_data[3]) );
  MX4X1M U175 ( .A(\Memory[0][3] ), .B(\Memory[1][3] ), .C(\Memory[2][3] ), 
        .D(\Memory[3][3] ), .S0(n156), .S1(N11), .Y(n72) );
  MX4X1M U176 ( .A(\Memory[4][3] ), .B(\Memory[5][3] ), .C(\Memory[6][3] ), 
        .D(\Memory[7][3] ), .S0(n156), .S1(N11), .Y(n71) );
  MX2X2M U177 ( .A(n74), .B(n73), .S0(N12), .Y(r_data[4]) );
  MX4X1M U178 ( .A(\Memory[0][4] ), .B(\Memory[1][4] ), .C(\Memory[2][4] ), 
        .D(\Memory[3][4] ), .S0(n156), .S1(N11), .Y(n74) );
  MX4X1M U179 ( .A(\Memory[4][4] ), .B(\Memory[5][4] ), .C(\Memory[6][4] ), 
        .D(\Memory[7][4] ), .S0(n156), .S1(N11), .Y(n73) );
  MX2X2M U180 ( .A(n151), .B(n150), .S0(N12), .Y(r_data[5]) );
  MX4X1M U181 ( .A(\Memory[0][5] ), .B(\Memory[1][5] ), .C(\Memory[2][5] ), 
        .D(\Memory[3][5] ), .S0(n156), .S1(N11), .Y(n151) );
  MX4X1M U182 ( .A(\Memory[4][5] ), .B(\Memory[5][5] ), .C(\Memory[6][5] ), 
        .D(\Memory[7][5] ), .S0(n156), .S1(N11), .Y(n150) );
  MX2X2M U183 ( .A(n68), .B(n67), .S0(N12), .Y(r_data[1]) );
  MX4X1M U184 ( .A(\Memory[0][1] ), .B(\Memory[1][1] ), .C(\Memory[2][1] ), 
        .D(\Memory[3][1] ), .S0(n156), .S1(N11), .Y(n68) );
  MX4X1M U185 ( .A(\Memory[4][1] ), .B(\Memory[5][1] ), .C(\Memory[6][1] ), 
        .D(\Memory[7][1] ), .S0(n156), .S1(N11), .Y(n67) );
  INVX2M U186 ( .A(w_address[1]), .Y(n178) );
  INVX2M U187 ( .A(w_address[0]), .Y(n177) );
endmodule


module fifo_top_width8_test_1 ( W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC, 
        WR_DATA, RD_DATA, FULL, EMPTY, test_si2, test_si1, test_so2, test_so1, 
        test_se );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC, test_si2, test_si1, test_se;
  output FULL, EMPTY, test_so2, test_so1;
  wire   n1, n2, n3, n4, n5, n7, n8;
  wire   [3:0] rptr_s;
  wire   [2:0] w_address;
  wire   [3:0] wptr;
  wire   [3:0] rptr;
  wire   [3:0] wptr_s;
  wire   [2:0] r_address;
  assign test_so2 = wptr[3];

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(W_RST), .Y(n2) );
  INVX2M U3 ( .A(n4), .Y(n3) );
  INVX2M U4 ( .A(R_RST), .Y(n4) );
  fifo_wptr_full_test_1 Write_Full ( .w_inc(W_INC), .CLK(W_CLK), .RST(n1), 
        .r_ptr_syncronized(rptr_s), .w_address(w_address), .w_ptr(wptr), 
        .w_full(FULL), .test_si(rptr[3]), .test_se(test_se) );
  data_sync_fifo_test_1 Data_Sync_Write_Block ( .insertion(rptr), .out(rptr_s), 
        .CLK(W_CLK), .RST(n1), .test_si(n8), .test_so(n7), .test_se(test_se)
         );
  fifo_rptr_empty_test_1 Read_Empty ( .r_inc(R_INC), .CLK(R_CLK), .RST(n3), 
        .w_ptr_syncronized(wptr_s), .r_address(r_address), .r_ptr(rptr), 
        .r_empty(EMPTY), .test_si(n5), .test_se(test_se) );
  data_sync_fifo_test_0 Data_Sync_Read_Block ( .insertion(wptr), .out(wptr_s), 
        .CLK(R_CLK), .RST(n3), .test_si(test_si1), .test_so(n8), .test_se(
        test_se) );
  fifo_memory_data_width8_test_1 Memory ( .w_data(WR_DATA), .full(FULL), 
        .w_inc(W_INC), .CLK(W_CLK), .RST(n1), .w_address(w_address), 
        .r_address(r_address), .r_data(RD_DATA), .test_si2(test_si2), 
        .test_si1(n7), .test_so2(n5), .test_so1(test_so1), .test_se(test_se)
         );
endmodule


module PULSE_GEN_test_1 ( clk, rst, lvl_sig, pulse_sig, test_si, test_so, 
        test_se );
  input clk, rst, lvl_sig, test_si, test_se;
  output pulse_sig, test_so;
  wire   pls_flop, rcv_flop;
  assign test_so = rcv_flop;

  SDFFRQX2M rcv_flop_reg ( .D(lvl_sig), .SI(pls_flop), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(rcv_flop) );
  SDFFRQX1M pls_flop_reg ( .D(rcv_flop), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(pls_flop) );
  NOR2BX2M U6 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
endmodule


module ClkDiv_0_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_test_1 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk, 
        test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n3, n4, n5, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;
  assign test_so = odd_edge_tog;

  SDFFRQX2M \count_reg[6]  ( .D(n28), .SI(count[5]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[6]) );
  SDFFRQX2M \count_reg[0]  ( .D(n34), .SI(test_si), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[0]) );
  SDFFRQX2M \count_reg[5]  ( .D(n29), .SI(count[4]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[5]) );
  SDFFRQX2M \count_reg[4]  ( .D(n30), .SI(count[3]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[4]) );
  SDFFRQX2M \count_reg[3]  ( .D(n31), .SI(count[2]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[3]) );
  SDFFRQX2M \count_reg[2]  ( .D(n32), .SI(count[1]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[2]) );
  SDFFRQX2M \count_reg[1]  ( .D(n33), .SI(count[0]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[1]) );
  SDFFSQX1M odd_edge_tog_reg ( .D(n26), .SI(div_clk), .SE(test_se), .CK(
        i_ref_clk), .SN(i_rst), .Q(odd_edge_tog) );
  SDFFRQX1M div_clk_reg ( .D(n27), .SI(count[6]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst), .Q(div_clk) );
  OR2X2M U11 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n3) );
  NAND2BX2M U15 ( .AN(n52), .B(i_clk_en), .Y(n18) );
  INVX2M U16 ( .A(i_div_ratio[5]), .Y(n17) );
  MX2X2M U17 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  CLKINVX1M U18 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U19 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n3), .Y(
        edge_flip_half[1]) );
  OR2X1M U20 ( .A(n3), .B(i_div_ratio[3]), .Y(n4) );
  OAI2BB1X1M U21 ( .A0N(n3), .A1N(i_div_ratio[3]), .B0(n4), .Y(
        edge_flip_half[2]) );
  NOR2X1M U22 ( .A(n4), .B(i_div_ratio[4]), .Y(n5) );
  AO21XLM U23 ( .A0(n4), .A1(i_div_ratio[4]), .B0(n5), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U24 ( .A(n5), .B(n17), .Y(n15) );
  OAI21X1M U25 ( .A0(n5), .A1(n17), .B0(n15), .Y(edge_flip_half[4]) );
  XNOR2X1M U26 ( .A(i_div_ratio[6]), .B(n15), .Y(edge_flip_half[5]) );
  NOR2X1M U27 ( .A(i_div_ratio[6]), .B(n15), .Y(n16) );
  CLKXOR2X2M U28 ( .A(i_div_ratio[7]), .B(n16), .Y(edge_flip_half[6]) );
  AO22X1M U29 ( .A0(n18), .A1(count[0]), .B0(N16), .B1(n19), .Y(n34) );
  AO22X1M U30 ( .A0(n18), .A1(count[1]), .B0(N17), .B1(n19), .Y(n33) );
  AO22X1M U31 ( .A0(n18), .A1(count[2]), .B0(N18), .B1(n19), .Y(n32) );
  AO22X1M U32 ( .A0(n18), .A1(count[3]), .B0(N19), .B1(n19), .Y(n31) );
  AO22X1M U33 ( .A0(n18), .A1(count[4]), .B0(N20), .B1(n19), .Y(n30) );
  AO22X1M U34 ( .A0(n18), .A1(count[5]), .B0(N21), .B1(n19), .Y(n29) );
  AO22X1M U35 ( .A0(n18), .A1(count[6]), .B0(N22), .B1(n19), .Y(n28) );
  AND3X1M U36 ( .A(n20), .B(n21), .C(N2), .Y(n19) );
  CLKXOR2X2M U37 ( .A(div_clk), .B(n22), .Y(n27) );
  AOI21X1M U38 ( .A0(n21), .A1(n20), .B0(n18), .Y(n22) );
  OR2X1M U39 ( .A(n23), .B(i_div_ratio[0]), .Y(n20) );
  XNOR2X1M U40 ( .A(odd_edge_tog), .B(n24), .Y(n26) );
  OR2X1M U41 ( .A(n21), .B(n18), .Y(n24) );
  CLKNAND2X2M U42 ( .A(n25), .B(i_div_ratio[0]), .Y(n21) );
  MXI2X1M U43 ( .A(n35), .B(n23), .S0(odd_edge_tog), .Y(n25) );
  NAND4X1M U44 ( .A(n36), .B(n37), .C(n38), .D(n39), .Y(n23) );
  NOR4X1M U45 ( .A(n40), .B(n41), .C(n42), .D(n43), .Y(n39) );
  CLKXOR2X2M U46 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n43) );
  CLKXOR2X2M U47 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n42) );
  CLKXOR2X2M U48 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n41) );
  CLKXOR2X2M U49 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n40) );
  XNOR2X1M U50 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n38) );
  XNOR2X1M U51 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n37) );
  XNOR2X1M U52 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n36) );
  NAND4X1M U53 ( .A(n44), .B(n45), .C(n46), .D(n47), .Y(n35) );
  NOR4X1M U54 ( .A(n48), .B(n49), .C(n50), .D(n51), .Y(n47) );
  CLKXOR2X2M U55 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n51) );
  CLKXOR2X2M U56 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n50) );
  CLKXOR2X2M U57 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n49) );
  CLKXOR2X2M U58 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n48) );
  XNOR2X1M U59 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n46) );
  XNOR2X1M U60 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n45) );
  XNOR2X1M U61 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n44) );
  CLKINVX1M U62 ( .A(n18), .Y(N2) );
  NOR4BX1M U63 ( .AN(n53), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n52) );
  NOR4X1M U64 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n53) );
  ClkDiv_0_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  INVX2M U11 ( .A(IN[2]), .Y(n15) );
  NAND4BX1M U12 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n16), .Y(n6) );
  NAND4BX1M U13 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n16), .Y(n7) );
  INVX2M U14 ( .A(IN[1]), .Y(n14) );
  NOR3X2M U15 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NOR3X2M U16 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  INVX2M U17 ( .A(IN[5]), .Y(n16) );
  NOR4X1M U18 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U19 ( .A(n17), .B(n14), .C(IN[2]), .Y(n5) );
  INVX2M U20 ( .A(IN[0]), .Y(n17) );
  OAI211X2M U21 ( .A0(n8), .A1(n9), .B0(n17), .C0(n14), .Y(OUT[0]) );
  NOR4X1M U22 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  NAND2X2M U23 ( .A(n7), .B(n6), .Y(n9) );
  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
endmodule


module ClkDiv_1_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_test_0 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk, 
        test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n2, n3,
         n4, n5, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;
  assign test_so = odd_edge_tog;

  SDFFRQX2M div_clk_reg ( .D(n60), .SI(count[6]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst), .Q(div_clk) );
  SDFFRQX2M \count_reg[6]  ( .D(n59), .SI(count[5]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[6]) );
  SDFFRQX2M \count_reg[0]  ( .D(n53), .SI(test_si), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[0]) );
  SDFFRQX2M \count_reg[5]  ( .D(n58), .SI(count[4]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[5]) );
  SDFFRQX2M \count_reg[4]  ( .D(n57), .SI(count[3]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[4]) );
  SDFFRQX2M \count_reg[3]  ( .D(n56), .SI(count[2]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[3]) );
  SDFFRQX2M \count_reg[2]  ( .D(n55), .SI(count[1]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[2]) );
  SDFFRQX2M \count_reg[1]  ( .D(n54), .SI(count[0]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[1]) );
  SDFFSQX1M odd_edge_tog_reg ( .D(n61), .SI(div_clk), .SE(test_se), .CK(
        i_ref_clk), .SN(i_rst), .Q(odd_edge_tog) );
  OR2X2M U6 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n2) );
  NAND2BX2M U11 ( .AN(n51), .B(i_clk_en), .Y(n17) );
  INVX2M U15 ( .A(i_div_ratio[5]), .Y(n16) );
  MX2X2M U16 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  CLKINVX1M U17 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U18 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n2), .Y(
        edge_flip_half[1]) );
  OR2X1M U19 ( .A(n2), .B(i_div_ratio[3]), .Y(n3) );
  OAI2BB1X1M U20 ( .A0N(n2), .A1N(i_div_ratio[3]), .B0(n3), .Y(
        edge_flip_half[2]) );
  NOR2X1M U21 ( .A(n3), .B(i_div_ratio[4]), .Y(n4) );
  AO21XLM U22 ( .A0(n3), .A1(i_div_ratio[4]), .B0(n4), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U23 ( .A(n4), .B(n16), .Y(n5) );
  OAI21X1M U24 ( .A0(n4), .A1(n16), .B0(n5), .Y(edge_flip_half[4]) );
  XNOR2X1M U25 ( .A(i_div_ratio[6]), .B(n5), .Y(edge_flip_half[5]) );
  NOR2X1M U26 ( .A(i_div_ratio[6]), .B(n5), .Y(n15) );
  CLKXOR2X2M U27 ( .A(i_div_ratio[7]), .B(n15), .Y(edge_flip_half[6]) );
  AO22X1M U28 ( .A0(n17), .A1(count[0]), .B0(N16), .B1(n18), .Y(n53) );
  AO22X1M U29 ( .A0(n17), .A1(count[1]), .B0(N17), .B1(n18), .Y(n54) );
  AO22X1M U30 ( .A0(n17), .A1(count[2]), .B0(N18), .B1(n18), .Y(n55) );
  AO22X1M U31 ( .A0(n17), .A1(count[3]), .B0(N19), .B1(n18), .Y(n56) );
  AO22X1M U32 ( .A0(n17), .A1(count[4]), .B0(N20), .B1(n18), .Y(n57) );
  AO22X1M U33 ( .A0(n17), .A1(count[5]), .B0(N21), .B1(n18), .Y(n58) );
  AO22X1M U34 ( .A0(n17), .A1(count[6]), .B0(N22), .B1(n18), .Y(n59) );
  AND3X1M U35 ( .A(n19), .B(n20), .C(N2), .Y(n18) );
  CLKXOR2X2M U36 ( .A(div_clk), .B(n21), .Y(n60) );
  AOI21X1M U37 ( .A0(n20), .A1(n19), .B0(n17), .Y(n21) );
  OR2X1M U38 ( .A(n22), .B(i_div_ratio[0]), .Y(n19) );
  XNOR2X1M U39 ( .A(odd_edge_tog), .B(n23), .Y(n61) );
  OR2X1M U40 ( .A(n20), .B(n17), .Y(n23) );
  CLKNAND2X2M U41 ( .A(n24), .B(i_div_ratio[0]), .Y(n20) );
  MXI2X1M U42 ( .A(n25), .B(n22), .S0(odd_edge_tog), .Y(n24) );
  NAND4X1M U43 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n22) );
  NOR4X1M U44 ( .A(n39), .B(n40), .C(n41), .D(n42), .Y(n38) );
  CLKXOR2X2M U45 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n42) );
  CLKXOR2X2M U46 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n41) );
  CLKXOR2X2M U47 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n40) );
  CLKXOR2X2M U48 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n39) );
  XNOR2X1M U49 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n37) );
  XNOR2X1M U50 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n36) );
  XNOR2X1M U51 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n35) );
  NAND4X1M U52 ( .A(n43), .B(n44), .C(n45), .D(n46), .Y(n25) );
  NOR4X1M U53 ( .A(n47), .B(n48), .C(n49), .D(n50), .Y(n46) );
  CLKXOR2X2M U54 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n50) );
  CLKXOR2X2M U55 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n49) );
  CLKXOR2X2M U56 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n48) );
  CLKXOR2X2M U57 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n47) );
  XNOR2X1M U58 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n45) );
  XNOR2X1M U59 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n44) );
  XNOR2X1M U60 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n43) );
  CLKINVX1M U61 ( .A(n17), .Y(N2) );
  NOR4BX1M U62 ( .AN(n52), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n51) );
  NOR4X1M U63 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n52) );
  ClkDiv_1_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
endmodule


module start_check_test_1 ( start_check_en, CLK, RST, rst_all, start_bit, 
        start_glitch, test_si, test_se );
  input start_check_en, CLK, RST, rst_all, start_bit, test_si, test_se;
  output start_glitch;
  wire   n3, n4, n2;

  SDFFRQX2M start_glitch_reg ( .D(n4), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(start_glitch) );
  NOR2BX2M U4 ( .AN(rst_all), .B(n3), .Y(n4) );
  AOI22X1M U5 ( .A0(start_check_en), .A1(start_bit), .B0(start_glitch), .B1(n2), .Y(n3) );
  INVX2M U6 ( .A(start_check_en), .Y(n2) );
endmodule


module stop_check_test_1 ( stop_check_en, CLK, RST, rst_all, stop_bit, 
        stop_error, test_si, test_se );
  input stop_check_en, CLK, RST, rst_all, stop_bit, test_si, test_se;
  output stop_error;
  wire   n3, n4, n5;

  NOR2BX2M U4 ( .AN(rst_all), .B(n3), .Y(n4) );
  AOI2BB2XLM U5 ( .B0(stop_error), .B1(n5), .A0N(stop_bit), .A1N(n5), .Y(n3)
         );
  INVX2M U6 ( .A(stop_check_en), .Y(n5) );
  SDFFRHQX8M stop_error_reg ( .D(n4), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(stop_error) );
endmodule


module FSM_RX_test_1 ( RX_IN, CLK, RST, PAR_EN, par_error, strt_glitch, 
        stp_error, bit_count, edge_count, prescale, data_sample_en, par_chk_en, 
        strt_chk_en, stp_chk_en, data_valid, deser_en, enable, rst_all, 
        test_so, test_se );
  input [3:0] bit_count;
  input [4:0] edge_count;
  input [5:0] prescale;
  input RX_IN, CLK, RST, PAR_EN, par_error, strt_glitch, stp_error, test_se;
  output data_sample_en, par_chk_en, strt_chk_en, stp_chk_en, data_valid,
         deser_en, enable, rst_all, test_so;
  wire   N51, N52, N53, N55, N56, N57, N62, N63, N69, N70, N71, N72, N73, N75,
         N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87, N88, N178,
         N179, N180, N181, N182, N183, N193, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, \r175/A[5] , \r173/carry[2] , \r173/carry[3] ,
         \r173/carry[4] , \r171/carry[4] , \r171/carry[3] , \r169/carry[4] ,
         \r169/carry[3] , \add_169/carry[4] , \add_169/carry[3] ,
         \add_169/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120;
  wire   [5:0] PRE_SCALE;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign PRE_SCALE[4] = prescale[4];
  assign PRE_SCALE[3] = prescale[3];
  assign PRE_SCALE[2] = prescale[2];
  assign PRE_SCALE[0] = prescale[0];
  assign N57 = prescale[1];
  assign test_so = n118;

  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(n115), .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(edge_count[4]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[0]) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(n119), .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[2]) );
  NOR4X1M U6 ( .A(PRE_SCALE[0]), .B(N57), .C(PRE_SCALE[2]), .D(PRE_SCALE[4]), 
        .Y(n102) );
  NOR3X2M U7 ( .A(current_state[1]), .B(current_state[2]), .C(n115), .Y(n73)
         );
  INVX2M U8 ( .A(N52), .Y(n21) );
  ADDHX1M U9 ( .A(PRE_SCALE[2]), .B(N57), .CO(\add_169/carry[2] ), .S(N178) );
  XNOR2X2M U10 ( .A(PRE_SCALE[4]), .B(\r169/carry[3] ), .Y(n1) );
  XNOR2X2M U11 ( .A(PRE_SCALE[3]), .B(PRE_SCALE[2]), .Y(n2) );
  ADDHX1M U12 ( .A(PRE_SCALE[4]), .B(\add_169/carry[3] ), .CO(
        \add_169/carry[4] ), .S(N180) );
  ADDHX1M U13 ( .A(PRE_SCALE[3]), .B(\add_169/carry[2] ), .CO(
        \add_169/carry[3] ), .S(N179) );
  INVX2M U14 ( .A(N57), .Y(n7) );
  INVX2M U15 ( .A(PRE_SCALE[2]), .Y(n8) );
  NAND2X2M U16 ( .A(n110), .B(n112), .Y(n77) );
  NOR2X2M U17 ( .A(N55), .B(n4), .Y(n3) );
  OA21X2M U18 ( .A0(PRE_SCALE[4]), .A1(n10), .B0(\r175/A[5] ), .Y(n4) );
  ADDHX1M U19 ( .A(\r175/A[5] ), .B(\add_169/carry[4] ), .CO(N182), .S(N181)
         );
  XNOR2X2M U20 ( .A(\r175/A[5] ), .B(\r169/carry[4] ), .Y(n5) );
  INVX2M U21 ( .A(n75), .Y(enable) );
  INVX2M U22 ( .A(n76), .Y(n116) );
  NOR3BX2M U23 ( .AN(n89), .B(n72), .C(n84), .Y(deser_en) );
  INVX2M U24 ( .A(N80), .Y(n72) );
  INVX2M U25 ( .A(n103), .Y(\r175/A[5] ) );
  NAND2X2M U26 ( .A(N88), .B(N183), .Y(n91) );
  INVX2M U27 ( .A(N88), .Y(n112) );
  NOR2X2M U28 ( .A(n85), .B(N56), .Y(n89) );
  AOI21X2M U29 ( .A0(n105), .A1(n106), .B0(N56), .Y(data_sample_en) );
  OAI2BB1X2M U30 ( .A0N(n79), .A1N(n94), .B0(n85), .Y(n106) );
  OAI21X2M U31 ( .A0(N193), .A1(n91), .B0(n116), .Y(n105) );
  OAI21X2M U32 ( .A0(n90), .A1(n74), .B0(n100), .Y(n96) );
  NAND4XLM U33 ( .A(N88), .B(n117), .C(n89), .D(n72), .Y(n100) );
  INVX2M U34 ( .A(edge_count[1]), .Y(n6) );
  NAND3X2M U35 ( .A(n117), .B(n89), .C(N80), .Y(n74) );
  INVX2M U36 ( .A(N56), .Y(n110) );
  INVX2M U37 ( .A(N183), .Y(n111) );
  NAND2BX2M U38 ( .AN(N73), .B(N63), .Y(n85) );
  NOR4X1M U39 ( .A(n116), .B(n104), .C(n117), .D(n73), .Y(n75) );
  NAND2X2M U40 ( .A(n75), .B(n118), .Y(rst_all) );
  NAND2X2M U41 ( .A(n102), .B(n103), .Y(n90) );
  NAND2X2M U42 ( .A(n108), .B(n118), .Y(n76) );
  INVX2M U43 ( .A(n79), .Y(n117) );
  NOR2X2M U44 ( .A(n90), .B(n114), .Y(n82) );
  NOR2X2M U45 ( .A(n73), .B(n113), .Y(n94) );
  INVX2M U46 ( .A(n84), .Y(n113) );
  NOR3X2M U47 ( .A(n119), .B(n115), .C(n118), .Y(data_valid) );
  NOR4BX1M U48 ( .AN(N193), .B(n76), .C(n77), .D(n111), .Y(par_chk_en) );
  AOI2B1X1M U49 ( .A1N(PRE_SCALE[3]), .A0(n102), .B0(prescale[5]), .Y(n103) );
  INVX2M U50 ( .A(n74), .Y(stp_chk_en) );
  AND4X2M U51 ( .A(n110), .B(n73), .C(N63), .D(N73), .Y(strt_chk_en) );
  INVX2M U52 ( .A(N53), .Y(n22) );
  INVX2M U53 ( .A(edge_count[3]), .Y(n23) );
  OAI2B2X1M U54 ( .A1N(n73), .A0(n98), .B0(RX_IN), .B1(n99), .Y(n97) );
  AOI31X2M U55 ( .A0(n119), .A1(n118), .A2(n115), .B0(data_valid), .Y(n99) );
  NOR2BX2M U56 ( .AN(strt_glitch), .B(n72), .Y(n98) );
  OAI221X1M U57 ( .A0(n93), .A1(n84), .B0(n89), .B1(n94), .C0(n95), .Y(
        next_state[0]) );
  AOI2B1XLM U58 ( .A1N(n82), .A0(N80), .B0(n101), .Y(n93) );
  AOI2B1X1M U59 ( .A1N(stp_error), .A0(n96), .B0(n97), .Y(n95) );
  AOI21XLM U60 ( .A0(N88), .A1(bit_count[3]), .B0(N80), .Y(n101) );
  OAI211X2M U61 ( .A0(n78), .A1(n79), .B0(n86), .C0(n87), .Y(next_state[1]) );
  AOI31X2M U62 ( .A0(n73), .A1(n88), .A2(n89), .B0(n113), .Y(n87) );
  OAI31XLM U63 ( .A0(n109), .A1(N56), .A2(n91), .B0(n116), .Y(n86) );
  OAI32XLM U64 ( .A0(n90), .A1(strt_glitch), .A2(n72), .B0(N80), .B1(n112), 
        .Y(n88) );
  OAI21X2M U65 ( .A0(n78), .A1(n79), .B0(n80), .Y(next_state[2]) );
  AOI33XLM U66 ( .A0(n81), .A1(n110), .A2(N88), .B0(n82), .B1(n120), .B2(
        deser_en), .Y(n80) );
  OAI33X2M U67 ( .A0(n111), .A1(par_error), .A2(n76), .B0(n83), .B1(n114), 
        .B2(n84), .Y(n81) );
  NAND3BX2M U68 ( .AN(n85), .B(n72), .C(n120), .Y(n83) );
  AND3X2M U69 ( .A(stp_error), .B(n89), .C(n92), .Y(n78) );
  AOI22XLM U70 ( .A0(N80), .A1(n90), .B0(n72), .B1(n112), .Y(n92) );
  OR2X2M U71 ( .A(N57), .B(PRE_SCALE[0]), .Y(n11) );
  INVX2M U72 ( .A(edge_count[4]), .Y(n33) );
  INVX2M U73 ( .A(N179), .Y(n30) );
  INVX2M U74 ( .A(N180), .Y(n31) );
  INVX2M U75 ( .A(edge_count[2]), .Y(n32) );
  NOR3X2M U76 ( .A(n115), .B(current_state[2]), .C(n119), .Y(n104) );
  NOR2X2M U77 ( .A(n119), .B(current_state[0]), .Y(n108) );
  NAND2X2M U78 ( .A(n104), .B(n107), .Y(n84) );
  OAI31X1M U79 ( .A0(bit_count[0]), .A1(bit_count[2]), .A2(bit_count[1]), .B0(
        bit_count[3]), .Y(n107) );
  INVX2M U80 ( .A(par_error), .Y(n109) );
  NAND2X2M U81 ( .A(current_state[2]), .B(n108), .Y(n79) );
  INVX2M U82 ( .A(current_state[2]), .Y(n118) );
  INVX2M U83 ( .A(current_state[1]), .Y(n119) );
  INVX2M U84 ( .A(current_state[0]), .Y(n115) );
  INVX2M U85 ( .A(bit_count[3]), .Y(n114) );
  INVX2M U86 ( .A(PAR_EN), .Y(n120) );
  AND2X1M U87 ( .A(\r173/carry[4] ), .B(\r175/A[5] ), .Y(N79) );
  CLKXOR2X2M U88 ( .A(\r175/A[5] ), .B(\r173/carry[4] ), .Y(N78) );
  AND2X1M U89 ( .A(\r173/carry[3] ), .B(PRE_SCALE[4]), .Y(\r173/carry[4] ) );
  CLKXOR2X2M U90 ( .A(PRE_SCALE[4]), .B(\r173/carry[3] ), .Y(N77) );
  AND2X1M U91 ( .A(\r173/carry[2] ), .B(PRE_SCALE[3]), .Y(\r173/carry[3] ) );
  CLKXOR2X2M U92 ( .A(PRE_SCALE[3]), .B(\r173/carry[2] ), .Y(N76) );
  OR2X1M U93 ( .A(PRE_SCALE[2]), .B(N57), .Y(\r173/carry[2] ) );
  XNOR2X1M U94 ( .A(N57), .B(PRE_SCALE[2]), .Y(N75) );
  AND2X1M U95 ( .A(\r171/carry[4] ), .B(\r175/A[5] ), .Y(N72) );
  CLKXOR2X2M U96 ( .A(\r175/A[5] ), .B(\r171/carry[4] ), .Y(N71) );
  AND2X1M U97 ( .A(\r171/carry[3] ), .B(PRE_SCALE[4]), .Y(\r171/carry[4] ) );
  CLKXOR2X2M U98 ( .A(PRE_SCALE[4]), .B(\r171/carry[3] ), .Y(N70) );
  AND2X1M U99 ( .A(PRE_SCALE[2]), .B(PRE_SCALE[3]), .Y(\r171/carry[3] ) );
  CLKXOR2X2M U100 ( .A(PRE_SCALE[3]), .B(PRE_SCALE[2]), .Y(N69) );
  AND2X1M U101 ( .A(\r169/carry[4] ), .B(\r175/A[5] ), .Y(N62) );
  AND2X1M U102 ( .A(\r169/carry[3] ), .B(PRE_SCALE[4]), .Y(\r169/carry[4] ) );
  AND2X1M U103 ( .A(PRE_SCALE[2]), .B(PRE_SCALE[3]), .Y(\r169/carry[3] ) );
  NAND2BX1M U104 ( .AN(PRE_SCALE[2]), .B(n7), .Y(n9) );
  OAI2BB1X1M U105 ( .A0N(N57), .A1N(PRE_SCALE[2]), .B0(n9), .Y(N51) );
  OR2X1M U106 ( .A(n9), .B(PRE_SCALE[3]), .Y(n10) );
  OAI2BB1X1M U107 ( .A0N(n9), .A1N(PRE_SCALE[3]), .B0(n10), .Y(N52) );
  XNOR2X1M U108 ( .A(PRE_SCALE[4]), .B(n10), .Y(N53) );
  NOR3X1M U109 ( .A(PRE_SCALE[4]), .B(\r175/A[5] ), .C(n10), .Y(N55) );
  CLKINVX1M U110 ( .A(PRE_SCALE[0]), .Y(N81) );
  OAI2BB1X1M U111 ( .A0N(PRE_SCALE[0]), .A1N(N57), .B0(n11), .Y(N82) );
  OR2X1M U112 ( .A(n11), .B(PRE_SCALE[2]), .Y(n12) );
  OAI2BB1X1M U113 ( .A0N(n11), .A1N(PRE_SCALE[2]), .B0(n12), .Y(N83) );
  OR2X1M U114 ( .A(n12), .B(PRE_SCALE[3]), .Y(n13) );
  OAI2BB1X1M U115 ( .A0N(n12), .A1N(PRE_SCALE[3]), .B0(n13), .Y(N84) );
  OR2X1M U116 ( .A(n13), .B(PRE_SCALE[4]), .Y(n14) );
  OAI2BB1X1M U117 ( .A0N(n13), .A1N(PRE_SCALE[4]), .B0(n14), .Y(N85) );
  NOR2X1M U118 ( .A(n14), .B(\r175/A[5] ), .Y(N87) );
  AO21XLM U119 ( .A0(n14), .A1(\r175/A[5] ), .B0(N87), .Y(N86) );
  NAND2BX1M U120 ( .AN(edge_count[0]), .B(n7), .Y(n16) );
  AOI2BB1X1M U121 ( .A0N(n16), .A1N(edge_count[1]), .B0(N51), .Y(n15) );
  AOI221XLM U122 ( .A0(edge_count[2]), .A1(n21), .B0(edge_count[1]), .B1(n16), 
        .C0(n15), .Y(n17) );
  AOI221XLM U123 ( .A0(N53), .A1(n23), .B0(N52), .B1(n32), .C0(n17), .Y(n18)
         );
  AOI221XLM U124 ( .A0(edge_count[4]), .A1(n3), .B0(edge_count[3]), .B1(n22), 
        .C0(n18), .Y(n19) );
  NOR2X1M U125 ( .A(N55), .B(n19), .Y(n20) );
  OAI21X1M U126 ( .A0(edge_count[4]), .A1(n3), .B0(n20), .Y(N56) );
  NAND2BX1M U127 ( .AN(n7), .B(edge_count[0]), .Y(n25) );
  AOI2BB1X1M U128 ( .A0N(n25), .A1N(N178), .B0(edge_count[1]), .Y(n24) );
  AOI221XLM U129 ( .A0(N179), .A1(n32), .B0(N178), .B1(n25), .C0(n24), .Y(n26)
         );
  AOI221XLM U130 ( .A0(edge_count[3]), .A1(n31), .B0(edge_count[2]), .B1(n30), 
        .C0(n26), .Y(n27) );
  AOI221XLM U131 ( .A0(N181), .A1(n33), .B0(N180), .B1(n23), .C0(n27), .Y(n28)
         );
  AOI2B1X1M U132 ( .A1N(N181), .A0(edge_count[4]), .B0(n28), .Y(n29) );
  NOR2X1M U133 ( .A(N182), .B(n29), .Y(N183) );
  CLKNAND2X2M U134 ( .A(edge_count[4]), .B(n5), .Y(n43) );
  CLKNAND2X2M U135 ( .A(edge_count[3]), .B(n1), .Y(n41) );
  NOR2BX1M U136 ( .AN(N57), .B(edge_count[0]), .Y(n35) );
  AO21XLM U137 ( .A0(n6), .A1(n35), .B0(n8), .Y(n34) );
  CLKNAND2X2M U138 ( .A(edge_count[2]), .B(n2), .Y(n42) );
  OAI211X1M U139 ( .A0(n35), .A1(n6), .B0(n34), .C0(n42), .Y(n36) );
  OAI221X1M U140 ( .A0(edge_count[2]), .A1(n2), .B0(edge_count[3]), .B1(n1), 
        .C0(n36), .Y(n37) );
  AOI31X1M U141 ( .A0(n43), .A1(n41), .A2(n37), .B0(N62), .Y(n38) );
  OA21X1M U142 ( .A0(edge_count[4]), .A1(n5), .B0(n38), .Y(N63) );
  NOR2BX1M U143 ( .AN(edge_count[0]), .B(N57), .Y(n39) );
  OAI2B2X1M U144 ( .A1N(n8), .A0(n39), .B0(edge_count[1]), .B1(n39), .Y(n40)
         );
  AND2X1M U145 ( .A(N63), .B(n40), .Y(n44) );
  AND4X1M U146 ( .A(n44), .B(n43), .C(n42), .D(n41), .Y(N193) );
  NOR2BX1M U147 ( .AN(N57), .B(edge_count[0]), .Y(n45) );
  OAI2B2X1M U148 ( .A1N(edge_count[1]), .A0(n45), .B0(n8), .B1(n45), .Y(n48)
         );
  NOR2BX1M U149 ( .AN(edge_count[0]), .B(N57), .Y(n46) );
  OAI2B2X1M U150 ( .A1N(n8), .A0(n46), .B0(edge_count[1]), .B1(n46), .Y(n47)
         );
  NAND3BX1M U151 ( .AN(N72), .B(n48), .C(n47), .Y(n52) );
  CLKXOR2X2M U152 ( .A(N71), .B(edge_count[4]), .Y(n51) );
  CLKXOR2X2M U153 ( .A(N69), .B(edge_count[2]), .Y(n50) );
  CLKXOR2X2M U154 ( .A(N70), .B(edge_count[3]), .Y(n49) );
  NOR4X1M U155 ( .A(n52), .B(n51), .C(n50), .D(n49), .Y(N73) );
  NOR2BX1M U156 ( .AN(n7), .B(edge_count[0]), .Y(n53) );
  OAI2B2X1M U157 ( .A1N(edge_count[1]), .A0(n53), .B0(N75), .B1(n53), .Y(n59)
         );
  NOR2BX1M U158 ( .AN(edge_count[0]), .B(n7), .Y(n54) );
  OAI2B2X1M U159 ( .A1N(N75), .A0(n54), .B0(edge_count[1]), .B1(n54), .Y(n55)
         );
  NAND3BX1M U160 ( .AN(N79), .B(n59), .C(n55), .Y(n63) );
  CLKXOR2X2M U161 ( .A(N78), .B(edge_count[4]), .Y(n62) );
  CLKXOR2X2M U162 ( .A(N76), .B(edge_count[2]), .Y(n61) );
  CLKXOR2X2M U163 ( .A(N77), .B(edge_count[3]), .Y(n60) );
  NOR4X1M U164 ( .A(n63), .B(n62), .C(n61), .D(n60), .Y(N80) );
  NOR2BX1M U165 ( .AN(edge_count[0]), .B(N81), .Y(n64) );
  OAI2B2X1M U166 ( .A1N(N82), .A0(n64), .B0(edge_count[1]), .B1(n64), .Y(n67)
         );
  NOR2BX1M U167 ( .AN(N81), .B(edge_count[0]), .Y(n65) );
  OAI2B2X1M U168 ( .A1N(edge_count[1]), .A0(n65), .B0(N82), .B1(n65), .Y(n66)
         );
  NAND4BBX1M U169 ( .AN(N87), .BN(N86), .C(n67), .D(n66), .Y(n71) );
  CLKXOR2X2M U170 ( .A(N85), .B(edge_count[4]), .Y(n70) );
  CLKXOR2X2M U171 ( .A(N83), .B(edge_count[2]), .Y(n69) );
  CLKXOR2X2M U172 ( .A(N84), .B(edge_count[3]), .Y(n68) );
  NOR4X1M U173 ( .A(n71), .B(n70), .C(n69), .D(n68), .Y(N88) );
endmodule


module edge_bit_counter_test_1 ( enable, RST, CLK, rst_all, prescale, 
        bit_count, edge_count, test_si, test_se );
  input [5:0] prescale;
  output [3:0] bit_count;
  output [4:0] edge_count;
  input enable, RST, CLK, rst_all, test_si, test_se;
  wire   N8, N9, N10, N11, N13, N14, N15, N18, N19, N20, N21, N35, N36, N37,
         N38, N39, N40, N41, N42, N43, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, \add_29/carry[4] , \add_29/carry[3] , \add_29/carry[2] , n2, n3,
         n4, n14, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;

  SDFFRQX2M \bit_count_reg[0]  ( .D(N35), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(bit_count[0]) );
  SDFFRQX2M \bit_count_reg[1]  ( .D(N36), .SI(bit_count[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(bit_count[1]) );
  SDFFRQX2M \bit_count_reg[2]  ( .D(N37), .SI(bit_count[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(bit_count[2]) );
  SDFFRQX2M \bit_count_reg[3]  ( .D(N38), .SI(bit_count[2]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(bit_count[3]) );
  SDFFRQX2M \edge_count_reg[0]  ( .D(N39), .SI(bit_count[3]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(edge_count[0]) );
  SDFFRQX2M \edge_count_reg[1]  ( .D(N40), .SI(edge_count[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(edge_count[1]) );
  SDFFRQX2M \edge_count_reg[2]  ( .D(N41), .SI(edge_count[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(edge_count[2]) );
  INVX2M U7 ( .A(N11), .Y(n32) );
  INVX2M U14 ( .A(n16), .Y(n35) );
  AOI21BX2M U15 ( .A0(n14), .A1(prescale[4]), .B0N(n24), .Y(n2) );
  INVX2M U16 ( .A(N10), .Y(n31) );
  NAND2X2M U17 ( .A(rst_all), .B(enable), .Y(n16) );
  NAND2X2M U18 ( .A(N15), .B(n35), .Y(n15) );
  NOR2BX2M U19 ( .AN(N18), .B(n15), .Y(N40) );
  NOR2BX2M U20 ( .AN(N19), .B(n15), .Y(N41) );
  NOR2BX2M U21 ( .AN(N20), .B(n15), .Y(N42) );
  INVX2M U23 ( .A(edge_count[2]), .Y(n33) );
  NOR2BX2M U24 ( .AN(bit_count[0]), .B(N15), .Y(n21) );
  OR2X2M U25 ( .A(prescale[1]), .B(prescale[0]), .Y(n3) );
  NOR2X2M U26 ( .A(edge_count[0]), .B(n15), .Y(N39) );
  NAND2X2M U27 ( .A(bit_count[1]), .B(n21), .Y(n19) );
  NOR2X2M U28 ( .A(n16), .B(n23), .Y(N35) );
  CLKXOR2X2M U29 ( .A(bit_count[0]), .B(N15), .Y(n23) );
  NOR2X2M U30 ( .A(n17), .B(n16), .Y(N38) );
  CLKXOR2X2M U31 ( .A(n18), .B(bit_count[3]), .Y(n17) );
  NAND2BX2M U32 ( .AN(n19), .B(bit_count[2]), .Y(n18) );
  NOR2X2M U33 ( .A(n20), .B(n16), .Y(N37) );
  CLKXOR2X2M U34 ( .A(n19), .B(bit_count[2]), .Y(n20) );
  NOR2X2M U35 ( .A(n22), .B(n16), .Y(N36) );
  XNOR2X2M U36 ( .A(n21), .B(bit_count[1]), .Y(n22) );
  AND3X2M U37 ( .A(N21), .B(N15), .C(n35), .Y(N43) );
  ADDHX1M U38 ( .A(edge_count[2]), .B(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(N19) );
  ADDHX1M U39 ( .A(edge_count[1]), .B(edge_count[0]), .CO(\add_29/carry[2] ), 
        .S(N18) );
  ADDHX1M U40 ( .A(edge_count[3]), .B(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(N20) );
  CLKINVX1M U41 ( .A(prescale[0]), .Y(N8) );
  OAI2BB1X1M U42 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n3), .Y(N9) );
  OR2X1M U43 ( .A(n3), .B(prescale[2]), .Y(n4) );
  OAI2BB1X1M U44 ( .A0N(n3), .A1N(prescale[2]), .B0(n4), .Y(N10) );
  OR2X1M U45 ( .A(n4), .B(prescale[3]), .Y(n14) );
  OAI2BB1X1M U46 ( .A0N(n4), .A1N(prescale[3]), .B0(n14), .Y(N11) );
  OR2X1M U47 ( .A(n14), .B(prescale[4]), .Y(n24) );
  NOR2X1M U48 ( .A(n24), .B(prescale[5]), .Y(N14) );
  AO21XLM U49 ( .A0(n24), .A1(prescale[5]), .B0(N14), .Y(N13) );
  CLKXOR2X2M U50 ( .A(\add_29/carry[4] ), .B(edge_count[4]), .Y(N21) );
  NAND2BX1M U51 ( .AN(edge_count[0]), .B(N8), .Y(n26) );
  AOI2BB1X1M U52 ( .A0N(n26), .A1N(edge_count[1]), .B0(N9), .Y(n25) );
  AOI221XLM U53 ( .A0(edge_count[2]), .A1(n31), .B0(edge_count[1]), .B1(n26), 
        .C0(n25), .Y(n27) );
  AOI221XLM U54 ( .A0(N11), .A1(n34), .B0(N10), .B1(n33), .C0(n27), .Y(n28) );
  AOI221XLM U55 ( .A0(edge_count[4]), .A1(n2), .B0(edge_count[3]), .B1(n32), 
        .C0(n28), .Y(n30) );
  NOR2X1M U56 ( .A(edge_count[4]), .B(n2), .Y(n29) );
  OR4X1M U57 ( .A(n30), .B(n29), .C(N14), .D(N13), .Y(N15) );
  SDFFRQX1M \edge_count_reg[4]  ( .D(N43), .SI(n34), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(edge_count[4]) );
  SDFFRX1M \edge_count_reg[3]  ( .D(N42), .SI(n33), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(edge_count[3]), .QN(n34) );
endmodule


module data_sampling_test_1 ( edge_count, data_sample_en, RX_IN, CLK, RST, 
        rst_all, prescale, sampled_bit, test_si, test_so, test_se );
  input [4:0] edge_count;
  input [5:0] prescale;
  input data_sample_en, RX_IN, CLK, RST, rst_all, test_si, test_se;
  output sampled_bit, test_so;
  wire   N14, N15, N16, N17, N18, N19, N20, N22, N23, N24, N25, N26, N27, N47,
         N49, N50, N51, N52, N53, N55, N56, N57, N58, N59, N60, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, \add_51_2/carry[2] ,
         \add_51_2/carry[3] , \add_51_2/carry[4] , \add_51/carry[4] ,
         \add_51/carry[3] , \add_31/carry[4] , \add_31/carry[3] ,
         \add_31/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n22, n23, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62;
  wire   [2:0] sampled;
  assign test_so = sampled[2];
  assign N47 = prescale[1];

  SDFFRQX2M \sampled_reg[2]  ( .D(n35), .SI(sampled[1]), .SE(test_se), .CK(CLK), .RN(RST), .Q(sampled[2]) );
  SDFFRQX2M \sampled_reg[1]  ( .D(n34), .SI(sampled[0]), .SE(test_se), .CK(CLK), .RN(RST), .Q(sampled[1]) );
  SDFFRQX2M \sampled_reg[0]  ( .D(n33), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sampled[0]) );
  ADDHX1M U4 ( .A(prescale[2]), .B(N47), .CO(\add_31/carry[2] ), .S(N22) );
  INVX2M U5 ( .A(RST), .Y(n3) );
  ADDHX1M U6 ( .A(prescale[3]), .B(\add_31/carry[2] ), .CO(\add_31/carry[3] ), 
        .S(N23) );
  ADDHX1M U7 ( .A(prescale[4]), .B(\add_31/carry[3] ), .CO(\add_31/carry[4] ), 
        .S(N24) );
  INVX2M U8 ( .A(N47), .Y(n1) );
  INVX2M U9 ( .A(prescale[2]), .Y(n2) );
  AND2X2M U10 ( .A(rst_all), .B(data_sample_en), .Y(n29) );
  INVX2M U11 ( .A(N19), .Y(n62) );
  AOI211X2M U12 ( .A0(n24), .A1(n25), .B0(n26), .C0(n3), .Y(sampled_bit) );
  NAND2X2M U15 ( .A(sampled[1]), .B(sampled[0]), .Y(n24) );
  OAI21X2M U16 ( .A0(sampled[0]), .A1(sampled[1]), .B0(sampled[2]), .Y(n25) );
  NOR2X2M U17 ( .A(N53), .B(N60), .Y(n26) );
  NAND2X2M U18 ( .A(RX_IN), .B(n29), .Y(n28) );
  OAI2BB2X1M U19 ( .B0(n27), .B1(n28), .A0N(sampled[0]), .A1N(n27), .Y(n33) );
  NOR2BX2M U20 ( .AN(n29), .B(N19), .Y(n27) );
  OAI2BB2X1M U21 ( .B0(n30), .B1(n28), .A0N(sampled[1]), .A1N(n30), .Y(n34) );
  AOI21BX2M U22 ( .A0(n62), .A1(N20), .B0N(n29), .Y(n30) );
  OAI2BB2X1M U23 ( .B0(n31), .B1(n28), .A0N(sampled[2]), .A1N(n31), .Y(n35) );
  AND2X2M U24 ( .A(n29), .B(n32), .Y(n31) );
  NAND3BX2M U25 ( .AN(N20), .B(n62), .C(N27), .Y(n32) );
  ADDHX1M U26 ( .A(prescale[5]), .B(\add_31/carry[4] ), .CO(N26), .S(N25) );
  AND2X1M U27 ( .A(\add_51_2/carry[4] ), .B(prescale[5]), .Y(N59) );
  CLKXOR2X2M U28 ( .A(prescale[5]), .B(\add_51_2/carry[4] ), .Y(N58) );
  AND2X1M U29 ( .A(\add_51_2/carry[3] ), .B(prescale[4]), .Y(
        \add_51_2/carry[4] ) );
  CLKXOR2X2M U30 ( .A(prescale[4]), .B(\add_51_2/carry[3] ), .Y(N57) );
  AND2X1M U31 ( .A(\add_51_2/carry[2] ), .B(prescale[3]), .Y(
        \add_51_2/carry[3] ) );
  CLKXOR2X2M U32 ( .A(prescale[3]), .B(\add_51_2/carry[2] ), .Y(N56) );
  OR2X1M U33 ( .A(prescale[2]), .B(N47), .Y(\add_51_2/carry[2] ) );
  XNOR2X1M U34 ( .A(N47), .B(prescale[2]), .Y(N55) );
  AND2X1M U35 ( .A(\add_51/carry[4] ), .B(prescale[5]), .Y(N52) );
  CLKXOR2X2M U36 ( .A(prescale[5]), .B(\add_51/carry[4] ), .Y(N51) );
  AND2X1M U37 ( .A(\add_51/carry[3] ), .B(prescale[4]), .Y(\add_51/carry[4] )
         );
  CLKXOR2X2M U38 ( .A(prescale[4]), .B(\add_51/carry[3] ), .Y(N50) );
  AND2X1M U39 ( .A(prescale[2]), .B(prescale[3]), .Y(\add_51/carry[3] ) );
  CLKXOR2X2M U40 ( .A(prescale[3]), .B(prescale[2]), .Y(N49) );
  NAND2BX1M U41 ( .AN(prescale[2]), .B(n1), .Y(n4) );
  OAI2BB1X1M U42 ( .A0N(N47), .A1N(prescale[2]), .B0(n4), .Y(N14) );
  OR2X1M U43 ( .A(n4), .B(prescale[3]), .Y(n5) );
  OAI2BB1X1M U44 ( .A0N(n4), .A1N(prescale[3]), .B0(n5), .Y(N15) );
  XNOR2X1M U45 ( .A(prescale[4]), .B(n5), .Y(N16) );
  NOR3X1M U46 ( .A(prescale[4]), .B(prescale[5]), .C(n5), .Y(N18) );
  OAI21X1M U47 ( .A0(prescale[4]), .A1(n5), .B0(prescale[5]), .Y(n6) );
  NAND2BX1M U48 ( .AN(N18), .B(n6), .Y(N17) );
  NOR2BX1M U49 ( .AN(n1), .B(edge_count[0]), .Y(n7) );
  OAI2B2X1M U50 ( .A1N(edge_count[1]), .A0(n7), .B0(N14), .B1(n7), .Y(n10) );
  NOR2BX1M U51 ( .AN(edge_count[0]), .B(n1), .Y(n8) );
  OAI2B2X1M U52 ( .A1N(N14), .A0(n8), .B0(edge_count[1]), .B1(n8), .Y(n9) );
  NAND3BX1M U53 ( .AN(N18), .B(n10), .C(n9), .Y(n14) );
  CLKXOR2X2M U54 ( .A(N17), .B(edge_count[4]), .Y(n13) );
  CLKXOR2X2M U55 ( .A(N15), .B(edge_count[2]), .Y(n12) );
  CLKXOR2X2M U56 ( .A(N16), .B(edge_count[3]), .Y(n11) );
  NOR4X1M U57 ( .A(n14), .B(n13), .C(n12), .D(n11), .Y(N19) );
  CLKXOR2X2M U58 ( .A(prescale[3]), .B(edge_count[2]), .Y(n37) );
  NOR2BX1M U59 ( .AN(N47), .B(edge_count[0]), .Y(n15) );
  OAI2B2X1M U60 ( .A1N(edge_count[1]), .A0(n15), .B0(prescale[2]), .B1(n15), 
        .Y(n18) );
  NOR2BX1M U61 ( .AN(edge_count[0]), .B(N47), .Y(n16) );
  OAI2B2X1M U62 ( .A1N(prescale[2]), .A0(n16), .B0(edge_count[1]), .B1(n16), 
        .Y(n17) );
  CLKNAND2X2M U63 ( .A(n18), .B(n17), .Y(n36) );
  CLKXOR2X2M U64 ( .A(prescale[4]), .B(edge_count[3]), .Y(n23) );
  CLKXOR2X2M U65 ( .A(prescale[5]), .B(edge_count[4]), .Y(n22) );
  NOR4X1M U66 ( .A(n37), .B(n36), .C(n23), .D(n22), .Y(N20) );
  NOR2BX1M U67 ( .AN(n1), .B(edge_count[0]), .Y(n38) );
  OAI2B2X1M U68 ( .A1N(edge_count[1]), .A0(n38), .B0(N22), .B1(n38), .Y(n41)
         );
  NOR2BX1M U69 ( .AN(edge_count[0]), .B(n1), .Y(n39) );
  OAI2B2X1M U70 ( .A1N(N22), .A0(n39), .B0(edge_count[1]), .B1(n39), .Y(n40)
         );
  NAND3BX1M U71 ( .AN(N26), .B(n41), .C(n40), .Y(n45) );
  CLKXOR2X2M U72 ( .A(N25), .B(edge_count[4]), .Y(n44) );
  CLKXOR2X2M U73 ( .A(N23), .B(edge_count[2]), .Y(n43) );
  CLKXOR2X2M U74 ( .A(N24), .B(edge_count[3]), .Y(n42) );
  NOR4X1M U75 ( .A(n45), .B(n44), .C(n43), .D(n42), .Y(N27) );
  NOR2BX1M U76 ( .AN(N47), .B(edge_count[0]), .Y(n46) );
  OAI2B2X1M U77 ( .A1N(edge_count[1]), .A0(n46), .B0(n2), .B1(n46), .Y(n49) );
  NOR2BX1M U78 ( .AN(edge_count[0]), .B(N47), .Y(n47) );
  OAI2B2X1M U79 ( .A1N(n2), .A0(n47), .B0(edge_count[1]), .B1(n47), .Y(n48) );
  NAND3BX1M U80 ( .AN(N52), .B(n49), .C(n48), .Y(n53) );
  CLKXOR2X2M U81 ( .A(N51), .B(edge_count[4]), .Y(n52) );
  CLKXOR2X2M U82 ( .A(N49), .B(edge_count[2]), .Y(n51) );
  CLKXOR2X2M U83 ( .A(N50), .B(edge_count[3]), .Y(n50) );
  NOR4X1M U84 ( .A(n53), .B(n52), .C(n51), .D(n50), .Y(N53) );
  NOR2BX1M U85 ( .AN(n1), .B(edge_count[0]), .Y(n54) );
  OAI2B2X1M U86 ( .A1N(edge_count[1]), .A0(n54), .B0(N55), .B1(n54), .Y(n57)
         );
  NOR2BX1M U87 ( .AN(edge_count[0]), .B(n1), .Y(n55) );
  OAI2B2X1M U88 ( .A1N(N55), .A0(n55), .B0(edge_count[1]), .B1(n55), .Y(n56)
         );
  NAND3BX1M U89 ( .AN(N59), .B(n57), .C(n56), .Y(n61) );
  CLKXOR2X2M U90 ( .A(N58), .B(edge_count[4]), .Y(n60) );
  CLKXOR2X2M U91 ( .A(N56), .B(edge_count[2]), .Y(n59) );
  CLKXOR2X2M U92 ( .A(N57), .B(edge_count[3]), .Y(n58) );
  NOR4X1M U93 ( .A(n61), .B(n60), .C(n59), .D(n58), .Y(N60) );
endmodule


module deserializer_test_1 ( sampled_bit, CLK, RST, rst_all, deser_en, P_DATA, 
        test_si, test_so, test_se );
  output [7:0] P_DATA;
  input sampled_bit, CLK, RST, rst_all, deser_en, test_si, test_se;
  output test_so;
  wire   n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n12, n13, n14, n15, n16, n17, n18, n19;
  wire   [2:0] bit;
  assign test_so = n18;

  SDFFRQX2M \P_DATA_reg[1]  ( .D(n41), .SI(P_DATA[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[1]) );
  SDFFRQX2M \P_DATA_reg[4]  ( .D(n44), .SI(P_DATA[3]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[4]) );
  SDFFRQX2M \P_DATA_reg[0]  ( .D(n40), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[0]) );
  SDFFRQX2M \P_DATA_reg[3]  ( .D(n43), .SI(P_DATA[2]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[3]) );
  SDFFRQX2M \P_DATA_reg[6]  ( .D(n46), .SI(P_DATA[5]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[6]) );
  SDFFRQX2M \P_DATA_reg[2]  ( .D(n42), .SI(P_DATA[1]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[2]) );
  SDFFRQX2M \bit_reg[2]  ( .D(n48), .SI(n17), .SE(test_se), .CK(CLK), .RN(RST), 
        .Q(bit[2]) );
  SDFFRQX2M \P_DATA_reg[7]  ( .D(n47), .SI(P_DATA[6]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[7]) );
  SDFFRQX2M \bit_reg[0]  ( .D(n50), .SI(P_DATA[7]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(bit[0]) );
  SDFFRQX2M \bit_reg[1]  ( .D(n49), .SI(n16), .SE(test_se), .CK(CLK), .RN(RST), 
        .Q(bit[1]) );
  SDFFRQX2M \P_DATA_reg[5]  ( .D(n45), .SI(P_DATA[4]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[5]) );
  INVX2M U14 ( .A(n26), .Y(n12) );
  NOR2X2M U15 ( .A(n19), .B(n13), .Y(n26) );
  INVX2M U16 ( .A(deser_en), .Y(n13) );
  NAND2X2M U17 ( .A(rst_all), .B(n12), .Y(n39) );
  AOI31X2M U18 ( .A0(deser_en), .A1(n22), .A2(n21), .B0(n19), .Y(n36) );
  INVX2M U19 ( .A(rst_all), .Y(n19) );
  NAND2X2M U20 ( .A(sampled_bit), .B(n26), .Y(n20) );
  OAI221X1M U21 ( .A0(n16), .A1(n28), .B0(n38), .B1(n18), .C0(n31), .Y(n48) );
  NOR2BX2M U22 ( .AN(n39), .B(n34), .Y(n38) );
  OAI2BB2X1M U23 ( .B0(n38), .B1(n17), .A0N(n26), .A1N(n25), .Y(n49) );
  OAI21BX1M U24 ( .A0(n16), .A1(n39), .B0N(n34), .Y(n50) );
  OAI22X1M U25 ( .A0(n17), .A1(n16), .B0(n37), .B1(n18), .Y(n22) );
  CLKXOR2X2M U26 ( .A(n37), .B(n18), .Y(n21) );
  OAI32X1M U27 ( .A0(n20), .A1(n21), .A2(n22), .B0(n19), .B1(n23), .Y(n40) );
  OAI31X1M U28 ( .A0(n13), .A1(n21), .A2(n22), .B0(P_DATA[0]), .Y(n23) );
  OAI31X1M U29 ( .A0(n15), .A1(n14), .A2(n20), .B0(n35), .Y(n47) );
  INVX2M U30 ( .A(n21), .Y(n15) );
  INVX2M U31 ( .A(n22), .Y(n14) );
  NAND2X2M U32 ( .A(n36), .B(P_DATA[7]), .Y(n35) );
  NOR2X2M U33 ( .A(n12), .B(bit[0]), .Y(n34) );
  OAI2BB2X1M U34 ( .B0(n24), .B1(n20), .A0N(P_DATA[1]), .A1N(n24), .Y(n41) );
  AOI31X2M U35 ( .A0(n25), .A1(n18), .A2(n26), .B0(n19), .Y(n24) );
  OAI2BB2X1M U36 ( .B0(n27), .B1(n20), .A0N(P_DATA[2]), .A1N(n27), .Y(n42) );
  AOI2BB1X2M U37 ( .A0N(n28), .A1N(bit[0]), .B0(n19), .Y(n27) );
  OAI2BB2X1M U38 ( .B0(n29), .B1(n20), .A0N(P_DATA[3]), .A1N(n29), .Y(n43) );
  AOI2BB1X2M U39 ( .A0N(n28), .A1N(n16), .B0(n19), .Y(n29) );
  OAI2BB2X1M U40 ( .B0(n30), .B1(n20), .A0N(P_DATA[4]), .A1N(n30), .Y(n44) );
  AOI2BB1X2M U41 ( .A0N(n31), .A1N(bit[0]), .B0(n19), .Y(n30) );
  OAI2BB2X1M U42 ( .B0(n32), .B1(n20), .A0N(P_DATA[5]), .A1N(n32), .Y(n45) );
  AOI2BB1X2M U43 ( .A0N(n31), .A1N(n16), .B0(n19), .Y(n32) );
  OAI2BB2X1M U44 ( .B0(n33), .B1(n20), .A0N(P_DATA[6]), .A1N(n33), .Y(n46) );
  AOI31X2M U45 ( .A0(n34), .A1(bit[1]), .A2(bit[2]), .B0(n19), .Y(n33) );
  NAND3X2M U46 ( .A(bit[1]), .B(n18), .C(n26), .Y(n28) );
  NAND3X2M U47 ( .A(bit[2]), .B(n17), .C(n26), .Y(n31) );
  AOI21X2M U48 ( .A0(n16), .A1(bit[1]), .B0(n25), .Y(n37) );
  NOR2X2M U49 ( .A(n16), .B(bit[1]), .Y(n25) );
  INVX2M U50 ( .A(bit[0]), .Y(n16) );
  INVX2M U51 ( .A(bit[1]), .Y(n17) );
  INVX2M U52 ( .A(bit[2]), .Y(n18) );
endmodule


module parity_check_test_1 ( Data, CLK, RST, rst_all, par_check_en, par_type, 
        sampled, par_error, test_si, test_se );
  input [7:0] Data;
  input CLK, RST, rst_all, par_check_en, par_type, sampled, test_si, test_se;
  output par_error;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11;

  XNOR2X2M U5 ( .A(sampled), .B(Data[6]), .Y(n9) );
  XOR3XLM U6 ( .A(n5), .B(n6), .C(n7), .Y(n4) );
  XOR3XLM U7 ( .A(Data[1]), .B(Data[0]), .C(n8), .Y(n7) );
  CLKXOR2X2M U8 ( .A(par_type), .B(Data[7]), .Y(n5) );
  XOR3XLM U9 ( .A(Data[5]), .B(Data[4]), .C(n9), .Y(n6) );
  NOR2BX2M U10 ( .AN(rst_all), .B(n3), .Y(n10) );
  AOI22X1M U11 ( .A0(par_check_en), .A1(n4), .B0(par_error), .B1(n11), .Y(n3)
         );
  INVX2M U12 ( .A(par_check_en), .Y(n11) );
  XNOR2X2M U13 ( .A(Data[3]), .B(Data[2]), .Y(n8) );
  SDFFRHQX8M par_error_reg ( .D(n10), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(par_error) );
endmodule


module UART_RX_test_1 ( RX_IN, CLK, RST, PAR_EN, PAR_TYPE, prescale, 
        DATA_VALID, P_DATA, STOP_ERROR, PARITY_ERROR, START_GLITCH, test_si2, 
        test_si1, test_se );
  input [5:0] prescale;
  output [7:0] P_DATA;
  input RX_IN, CLK, RST, PAR_EN, PAR_TYPE, test_si2, test_si1, test_se;
  output DATA_VALID, STOP_ERROR, PARITY_ERROR, START_GLITCH;
  wire   start_check_en, rst_all, sampled_bit, stop_check_en, data_sample_en,
         par_chk_en, deser_en, enable, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15;
  wire   [3:0] bit_count;
  wire   [4:0] edge_count;

  INVX2M U1 ( .A(n12), .Y(n11) );
  INVX2M U2 ( .A(RST), .Y(n12) );
  INVX2M U3 ( .A(n6), .Y(n5) );
  INVX2M U4 ( .A(prescale[2]), .Y(n6) );
  INVX2M U5 ( .A(n10), .Y(n9) );
  INVX2M U6 ( .A(prescale[4]), .Y(n10) );
  INVX2M U7 ( .A(n4), .Y(n3) );
  INVX2M U8 ( .A(prescale[1]), .Y(n4) );
  INVX2M U9 ( .A(n8), .Y(n7) );
  INVX2M U10 ( .A(prescale[3]), .Y(n8) );
  INVX2M U11 ( .A(n2), .Y(n1) );
  INVX2M U12 ( .A(edge_count[1]), .Y(n2) );
  start_check_test_1 Sr ( .start_check_en(start_check_en), .CLK(CLK), .RST(n11), .rst_all(rst_all), .start_bit(sampled_bit), .start_glitch(START_GLITCH), 
        .test_si(PARITY_ERROR), .test_se(test_se) );
  stop_check_test_1 Sp ( .stop_check_en(stop_check_en), .CLK(CLK), .RST(n11), 
        .rst_all(rst_all), .stop_bit(sampled_bit), .stop_error(STOP_ERROR), 
        .test_si(test_si2), .test_se(test_se) );
  FSM_RX_test_1 F ( .RX_IN(RX_IN), .CLK(CLK), .RST(n11), .PAR_EN(PAR_EN), 
        .par_error(PARITY_ERROR), .strt_glitch(START_GLITCH), .stp_error(
        STOP_ERROR), .bit_count(bit_count), .edge_count({edge_count[4:2], n1, 
        edge_count[0]}), .prescale({prescale[5], n9, n7, n5, n3, prescale[0]}), 
        .data_sample_en(data_sample_en), .par_chk_en(par_chk_en), 
        .strt_chk_en(start_check_en), .stp_chk_en(stop_check_en), .data_valid(
        DATA_VALID), .deser_en(deser_en), .enable(enable), .rst_all(rst_all), 
        .test_so(n13), .test_se(test_se) );
  edge_bit_counter_test_1 EBC ( .enable(enable), .RST(n11), .CLK(CLK), 
        .rst_all(rst_all), .prescale({prescale[5], n9, n7, n5, n3, prescale[0]}), .bit_count(bit_count), .edge_count(edge_count), .test_si(n14), .test_se(
        test_se) );
  data_sampling_test_1 DS ( .edge_count({edge_count[4:2], n1, edge_count[0]}), 
        .data_sample_en(data_sample_en), .RX_IN(RX_IN), .CLK(CLK), .RST(n11), 
        .rst_all(rst_all), .prescale({prescale[5], n9, n7, n5, n3, prescale[0]}), .sampled_bit(sampled_bit), .test_si(test_si1), .test_so(n15), .test_se(
        test_se) );
  deserializer_test_1 DZ ( .sampled_bit(sampled_bit), .CLK(CLK), .RST(n11), 
        .rst_all(rst_all), .deser_en(deser_en), .P_DATA(P_DATA), .test_si(n15), 
        .test_so(n14), .test_se(test_se) );
  parity_check_test_1 P ( .Data(P_DATA), .CLK(CLK), .RST(n11), .rst_all(
        rst_all), .par_check_en(par_chk_en), .par_type(PAR_TYPE), .sampled(
        sampled_bit), .par_error(PARITY_ERROR), .test_si(n13), .test_se(
        test_se) );
endmodule


module FSM_test_1 ( Data_valid, Par_en, Ser_done, CLK, RST, mux, busy, capture, 
        Ser_en, test_si, test_so, test_se );
  output [1:0] mux;
  input Data_valid, Par_en, Ser_done, CLK, RST, test_si, test_se;
  output busy, capture, Ser_en, test_so;
  wire   n9, n10, n11, n12, n4, n5, n6, n7;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign test_so = n6;

  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(n7), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(current_state[0]) );
  NAND2BX2M U6 ( .AN(Ser_en), .B(n11), .Y(next_state[0]) );
  NAND3X2M U7 ( .A(n7), .B(n6), .C(Data_valid), .Y(n11) );
  NAND2X2M U8 ( .A(n9), .B(n10), .Y(mux[1]) );
  NOR3X2M U9 ( .A(current_state[1]), .B(current_state[2]), .C(n5), .Y(capture)
         );
  OAI21BX1M U10 ( .A0(Ser_done), .A1(n9), .B0N(capture), .Y(Ser_en) );
  NAND3X2M U11 ( .A(current_state[0]), .B(n6), .C(current_state[1]), .Y(n9) );
  INVX2M U12 ( .A(current_state[2]), .Y(n6) );
  INVX2M U13 ( .A(current_state[0]), .Y(n5) );
  OAI31X1M U14 ( .A0(n4), .A1(Par_en), .A2(n9), .B0(n10), .Y(next_state[2]) );
  INVX2M U15 ( .A(Ser_done), .Y(n4) );
  NAND3X2M U16 ( .A(n5), .B(n6), .C(current_state[1]), .Y(n10) );
  AOI21X2M U17 ( .A0(n5), .A1(n7), .B0(current_state[2]), .Y(next_state[1]) );
  NAND2X2M U18 ( .A(current_state[0]), .B(n6), .Y(mux[0]) );
  INVX2M U20 ( .A(n12), .Y(busy) );
  AOI211X2M U21 ( .A0(n5), .A1(current_state[1]), .B0(capture), .C0(mux[1]), 
        .Y(n12) );
  SDFFRX1M \current_state_reg[1]  ( .D(next_state[1]), .SI(n5), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[1]), .QN(n7) );
endmodule


module Serializer_test_1 ( Data, Ser_en, CLK, RST, capture, Ser_done, Ser_data, 
        test_si, test_so, test_se );
  input [7:0] Data;
  input Ser_en, CLK, RST, capture, test_si, test_se;
  output Ser_done, Ser_data, test_so;
  wire   N3, N4, N5, N6, N25, N26, N27, N37, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n2, n16, n17, n18, n33, n34, n35;
  wire   [7:0] internal;
  assign test_so = internal[7];

  SDFFRQX2M \internal_reg[5]  ( .D(n27), .SI(internal[4]), .SE(test_se), .CK(
        CLK), .RN(n2), .Q(internal[5]) );
  SDFFRQX2M \internal_reg[1]  ( .D(n31), .SI(internal[0]), .SE(test_se), .CK(
        CLK), .RN(n2), .Q(internal[1]) );
  SDFFRQX2M \internal_reg[0]  ( .D(n32), .SI(N5), .SE(test_se), .CK(CLK), .RN(
        n2), .Q(internal[0]) );
  SDFFRQX2M \internal_reg[7]  ( .D(n25), .SI(internal[6]), .SE(test_se), .CK(
        CLK), .RN(n2), .Q(internal[7]) );
  SDFFRQX2M \internal_reg[3]  ( .D(n29), .SI(internal[2]), .SE(test_se), .CK(
        CLK), .RN(n2), .Q(internal[3]) );
  SDFFRQX2M \internal_reg[6]  ( .D(n26), .SI(internal[5]), .SE(test_se), .CK(
        CLK), .RN(n2), .Q(internal[6]) );
  SDFFRQX2M \internal_reg[2]  ( .D(n30), .SI(internal[1]), .SE(test_se), .CK(
        CLK), .RN(n2), .Q(internal[2]) );
  SDFFRQX2M \internal_reg[4]  ( .D(n28), .SI(internal[3]), .SE(test_se), .CK(
        CLK), .RN(n2), .Q(internal[4]) );
  SDFFRQX2M \counter_reg[2]  ( .D(N27), .SI(N4), .SE(test_se), .CK(CLK), .RN(
        n2), .Q(N5) );
  SDFFRQX2M Ser_done_reg ( .D(N37), .SI(n35), .SE(test_se), .CK(CLK), .RN(n2), 
        .Q(Ser_done) );
  SDFFRQX2M \counter_reg[1]  ( .D(N26), .SI(N3), .SE(test_se), .CK(CLK), .RN(
        n2), .Q(N4) );
  SDFFRQX2M \counter_reg[0]  ( .D(N25), .SI(Ser_done), .SE(test_se), .CK(CLK), 
        .RN(n2), .Q(N3) );
  SEDFFX1M Ser_data_reg ( .D(n18), .SI(test_si), .E(RST), .SE(test_se), .CK(
        CLK), .Q(Ser_data), .QN(n35) );
  NOR2X2M U17 ( .A(n34), .B(n19), .Y(n20) );
  INVX2M U18 ( .A(n19), .Y(n33) );
  BUFX2M U19 ( .A(RST), .Y(n2) );
  NOR2X2M U20 ( .A(n34), .B(capture), .Y(n19) );
  INVX2M U21 ( .A(Ser_en), .Y(n34) );
  OAI2BB2X1M U22 ( .B0(N3), .B1(n33), .A0N(Ser_en), .A1N(capture), .Y(N25) );
  MX4X1M U23 ( .A(internal[4]), .B(internal[5]), .C(internal[6]), .D(
        internal[7]), .S0(N3), .S1(N4), .Y(n16) );
  NOR2X2M U24 ( .A(n21), .B(n33), .Y(N27) );
  CLKXOR2X2M U25 ( .A(n22), .B(N5), .Y(n21) );
  NAND2X2M U26 ( .A(N4), .B(N3), .Y(n22) );
  NOR2X2M U27 ( .A(n23), .B(n33), .Y(N26) );
  XNOR2X2M U28 ( .A(N3), .B(N4), .Y(n23) );
  INVX2M U29 ( .A(n24), .Y(n18) );
  AOI32X1M U30 ( .A0(capture), .A1(Ser_en), .A2(Data[0]), .B0(n19), .B1(N6), 
        .Y(n24) );
  MX2X2M U31 ( .A(n17), .B(n16), .S0(N5), .Y(N6) );
  MX4X1M U32 ( .A(internal[0]), .B(internal[1]), .C(internal[2]), .D(
        internal[3]), .S0(N3), .S1(N4), .Y(n17) );
  AO22X1M U33 ( .A0(n20), .A1(Data[0]), .B0(internal[0]), .B1(n19), .Y(n32) );
  AO22X1M U34 ( .A0(internal[1]), .A1(n19), .B0(Data[1]), .B1(n20), .Y(n31) );
  AO22X1M U35 ( .A0(internal[2]), .A1(n19), .B0(Data[2]), .B1(n20), .Y(n30) );
  AO22X1M U36 ( .A0(internal[3]), .A1(n19), .B0(Data[3]), .B1(n20), .Y(n29) );
  AO22X1M U37 ( .A0(internal[4]), .A1(n19), .B0(Data[4]), .B1(n20), .Y(n28) );
  AO22X1M U38 ( .A0(internal[5]), .A1(n19), .B0(Data[5]), .B1(n20), .Y(n27) );
  AO22X1M U39 ( .A0(internal[6]), .A1(n19), .B0(Data[6]), .B1(n20), .Y(n26) );
  AO22X1M U40 ( .A0(internal[7]), .A1(n19), .B0(Data[7]), .B1(n20), .Y(n25) );
  AND4X2M U41 ( .A(n19), .B(N3), .C(N4), .D(N5), .Y(N37) );
endmodule


module parity_checker_test_1 ( P_DATA, PAR_TYPE, CLK, RST, capture, parity, 
        test_si, test_se );
  input [7:0] P_DATA;
  input PAR_TYPE, CLK, RST, capture, test_si, test_se;
  output parity;
  wire   n1, n3, n4, n5, n6, n8, n2;

  SDFFRQX2M parity_reg ( .D(n8), .SI(test_si), .SE(test_se), .CK(CLK), .RN(RST), .Q(parity) );
  XNOR2X2M U2 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n5) );
  XOR3XLM U3 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U4 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  OAI2BB2X1M U5 ( .B0(n1), .B1(n2), .A0N(parity), .A1N(n2), .Y(n8) );
  INVX2M U6 ( .A(capture), .Y(n2) );
  XOR3XLM U7 ( .A(n3), .B(PAR_TYPE), .C(n4), .Y(n1) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n5), .Y(n4) );
endmodule


module MUX_test_1 ( mux_sel, ser_data, parity, CLK, RST, TX_OUT, test_si, 
        test_se );
  input [1:0] mux_sel;
  input ser_data, parity, CLK, RST, test_si, test_se;
  output TX_OUT;
  wire   out, n3, n4, n5, n7, n1;

  OAI21X2M U7 ( .A0(n3), .A1(n7), .B0(n4), .Y(out) );
  NAND3X2M U8 ( .A(mux_sel[1]), .B(n7), .C(ser_data), .Y(n4) );
  NOR2BX2M U9 ( .AN(mux_sel[1]), .B(parity), .Y(n3) );
  INVX2M U10 ( .A(mux_sel[0]), .Y(n7) );
  SDFFSQX2M TX_OUT_reg ( .D(out), .SI(test_si), .SE(test_se), .CK(CLK), .SN(
        RST), .Q(n5) );
  INVXLM U3 ( .A(n5), .Y(n1) );
  INVX8M U4 ( .A(n1), .Y(TX_OUT) );
endmodule


module UART_TX_test_1 ( Data, valid, par_en, par_type, CLK, RST, Tx_out, busy, 
        test_si, test_so, test_se );
  input [7:0] Data;
  input valid, par_en, par_type, CLK, RST, test_si, test_se;
  output Tx_out, busy, test_so;
  wire   ser_done, capture, ser_en, ser_data, parity, n2;
  wire   [1:0] mux;

  FSM_test_1 F1 ( .Data_valid(valid), .Par_en(par_en), .Ser_done(ser_done), 
        .CLK(CLK), .RST(RST), .mux(mux), .busy(busy), .capture(capture), 
        .Ser_en(ser_en), .test_si(test_si), .test_so(n2), .test_se(test_se) );
  Serializer_test_1 S1 ( .Data(Data), .Ser_en(ser_en), .CLK(CLK), .RST(RST), 
        .capture(capture), .Ser_done(ser_done), .Ser_data(ser_data), .test_si(
        parity), .test_so(test_so), .test_se(test_se) );
  parity_checker_test_1 P1 ( .P_DATA(Data), .PAR_TYPE(par_type), .CLK(CLK), 
        .RST(RST), .capture(capture), .parity(parity), .test_si(Tx_out), 
        .test_se(test_se) );
  MUX_test_1 M1 ( .mux_sel(mux), .ser_data(ser_data), .parity(parity), .CLK(
        CLK), .RST(RST), .TX_OUT(Tx_out), .test_si(n2), .test_se(test_se) );
endmodule


module UART_TOP_test_1 ( TX_CLK, RX_CLK, RST, PAR_TYP, PAR_EN, Prescale, 
        TX_IN_P, TX_IN_V, RX_IN_S, TX_OUT_S, TX_OUT_V, RX_OUT_P, RX_OUT_V, 
        STOP_ERROR, PARITY_ERROR, START_GLITCH, test_si, test_se );
  input [5:0] Prescale;
  input [7:0] TX_IN_P;
  output [7:0] RX_OUT_P;
  input TX_CLK, RX_CLK, RST, PAR_TYP, PAR_EN, TX_IN_V, RX_IN_S, test_si,
         test_se;
  output TX_OUT_S, TX_OUT_V, RX_OUT_V, STOP_ERROR, PARITY_ERROR, START_GLITCH;
  wire   n1, n2, n3, n4, n5, n6, n7;

  INVX2M U1 ( .A(n6), .Y(n5) );
  INVX2M U2 ( .A(RST), .Y(n6) );
  BUFX2M U3 ( .A(Prescale[2]), .Y(n2) );
  BUFX2M U4 ( .A(Prescale[4]), .Y(n4) );
  BUFX2M U5 ( .A(Prescale[1]), .Y(n1) );
  BUFX2M U6 ( .A(Prescale[3]), .Y(n3) );
  UART_RX_test_1 RX ( .RX_IN(RX_IN_S), .CLK(RX_CLK), .RST(n5), .PAR_EN(PAR_EN), 
        .PAR_TYPE(PAR_TYP), .prescale({Prescale[5], n4, n3, n2, n1, 
        Prescale[0]}), .DATA_VALID(RX_OUT_V), .P_DATA(RX_OUT_P), .STOP_ERROR(
        STOP_ERROR), .PARITY_ERROR(PARITY_ERROR), .START_GLITCH(START_GLITCH), 
        .test_si2(n7), .test_si1(test_si), .test_se(test_se) );
  UART_TX_test_1 TX ( .Data(TX_IN_P), .valid(TX_IN_V), .par_en(PAR_EN), 
        .par_type(PAR_TYP), .CLK(TX_CLK), .RST(n5), .Tx_out(TX_OUT_S), .busy(
        TX_OUT_V), .test_si(START_GLITCH), .test_so(n7), .test_se(test_se) );
endmodule


module SYS_CTRL_test_1 ( ALU_OUT, ALU_Valid, RdData_REG_FILE, 
        RdData_Valid_REG_FILE, RX_P_DATA, RX_D_VLD, CLK, RST, FIFO_FULL, 
        ALU_FUN, EN_ALU, CLK_GATING_ALU_EN, Address_REG_FILE, WrEn_REG_FILE, 
        RdEn_REG_FILE, WrData_REG_FILE, FIFO_WRITE_DATA, FIFO_WRITE_INC, 
        clk_div_en, test_so, test_se );
  input [15:0] ALU_OUT;
  input [7:0] RdData_REG_FILE;
  input [7:0] RX_P_DATA;
  output [3:0] ALU_FUN;
  output [3:0] Address_REG_FILE;
  output [7:0] WrData_REG_FILE;
  output [7:0] FIFO_WRITE_DATA;
  input ALU_Valid, RdData_Valid_REG_FILE, RX_D_VLD, CLK, RST, FIFO_FULL,
         test_se;
  output EN_ALU, CLK_GATING_ALU_EN, WrEn_REG_FILE, RdEn_REG_FILE,
         FIFO_WRITE_INC, clk_div_en, test_so;
  wire   n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n83, n84, n85, n86;
  wire   [3:0] current;
  wire   [3:0] next;
  assign test_so = current[3];

  SDFFRQX2M \Address_REG_FILE_reg[2]  ( .D(n81), .SI(Address_REG_FILE[1]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(Address_REG_FILE[2]) );
  SDFFRQX2M \Address_REG_FILE_reg[3]  ( .D(n82), .SI(Address_REG_FILE[2]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(Address_REG_FILE[3]) );
  SDFFRQX2M \Address_REG_FILE_reg[1]  ( .D(n80), .SI(Address_REG_FILE[0]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(Address_REG_FILE[1]) );
  SDFFRQX2M \Address_REG_FILE_reg[0]  ( .D(n79), .SI(ALU_Valid), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(Address_REG_FILE[0]) );
  SDFFRQX2M \current_reg[0]  ( .D(next[0]), .SI(Address_REG_FILE[3]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(current[0]) );
  SDFFRQX2M \current_reg[3]  ( .D(next[3]), .SI(n19), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(current[3]) );
  SDFFRQX2M \current_reg[2]  ( .D(next[2]), .SI(n18), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(current[2]) );
  SDFFRQX2M \current_reg[1]  ( .D(next[1]), .SI(n11), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(current[1]) );
  NOR2X2M U13 ( .A(n23), .B(n60), .Y(ALU_FUN[1]) );
  NOR2X2M U14 ( .A(n24), .B(n60), .Y(ALU_FUN[0]) );
  NOR2X2M U15 ( .A(n22), .B(n60), .Y(ALU_FUN[2]) );
  NOR3X2M U16 ( .A(n61), .B(n16), .C(n19), .Y(RdEn_REG_FILE) );
  OR3X2M U17 ( .A(n69), .B(n70), .C(n37), .Y(FIFO_WRITE_INC) );
  AND2X2M U18 ( .A(n25), .B(n53), .Y(n68) );
  AND2X2M U19 ( .A(n55), .B(n63), .Y(n25) );
  OAI21X2M U20 ( .A0(n16), .A1(n61), .B0(n63), .Y(n49) );
  NOR2BX2M U21 ( .AN(n27), .B(n28), .Y(n70) );
  INVX2M U22 ( .A(FIFO_FULL), .Y(n14) );
  OAI222X1M U23 ( .A0(n12), .A1(n32), .B0(n13), .B1(n52), .C0(n53), .C1(n14), 
        .Y(n40) );
  INVX2M U24 ( .A(n28), .Y(n13) );
  NOR2BX2M U25 ( .AN(n38), .B(n39), .Y(n69) );
  OAI21X2M U26 ( .A0(FIFO_FULL), .A1(n53), .B0(n25), .Y(WrEn_REG_FILE) );
  NOR2X2M U27 ( .A(n28), .B(n52), .Y(n37) );
  OAI211X2M U28 ( .A0(n12), .A1(n32), .B0(n33), .C0(n34), .Y(next[2]) );
  AOI22X1M U29 ( .A0(n27), .A1(n28), .B0(n38), .B1(n39), .Y(n33) );
  NOR4BX1M U30 ( .AN(n35), .B(n36), .C(RdEn_REG_FILE), .D(n37), .Y(n34) );
  NAND4BX1M U31 ( .AN(n40), .B(n41), .C(n42), .D(n15), .Y(next[1]) );
  AOI22X1M U32 ( .A0(n12), .A1(n49), .B0(n38), .B1(n39), .Y(n42) );
  NOR3BX2M U33 ( .AN(n59), .B(n19), .C(n11), .Y(n38) );
  INVX2M U34 ( .A(n11), .Y(n16) );
  AOI32X1M U35 ( .A0(n59), .A1(n20), .A2(n58), .B0(n12), .B1(RdEn_REG_FILE), 
        .Y(n64) );
  INVX2M U36 ( .A(n12), .Y(n20) );
  NOR2X2M U37 ( .A(n68), .B(n85), .Y(WrData_REG_FILE[1]) );
  NOR2X2M U38 ( .A(n68), .B(n84), .Y(WrData_REG_FILE[2]) );
  NOR2X2M U39 ( .A(n68), .B(n83), .Y(WrData_REG_FILE[3]) );
  NOR2X2M U40 ( .A(n68), .B(n24), .Y(WrData_REG_FILE[4]) );
  NOR2X2M U41 ( .A(n68), .B(n23), .Y(WrData_REG_FILE[5]) );
  NOR2X2M U42 ( .A(n68), .B(n22), .Y(WrData_REG_FILE[6]) );
  NAND2X2M U43 ( .A(n18), .B(n17), .Y(n61) );
  NOR2X2M U44 ( .A(n68), .B(n86), .Y(WrData_REG_FILE[0]) );
  NOR2X2M U45 ( .A(n68), .B(n21), .Y(WrData_REG_FILE[7]) );
  NAND3X2M U46 ( .A(n67), .B(n18), .C(n11), .Y(n63) );
  AOI21BX2M U47 ( .A0(n18), .A1(n67), .B0N(n64), .Y(n66) );
  NAND3X2M U48 ( .A(n11), .B(n19), .C(n59), .Y(n53) );
  NOR2X2M U49 ( .A(n21), .B(n60), .Y(ALU_FUN[3]) );
  NAND3X2M U50 ( .A(n16), .B(n18), .C(n67), .Y(n55) );
  NOR4X1M U51 ( .A(n21), .B(n24), .C(n83), .D(n86), .Y(n48) );
  NOR3X2M U52 ( .A(n61), .B(n11), .C(n19), .Y(n36) );
  NOR2BX2M U53 ( .AN(n58), .B(n61), .Y(n47) );
  NAND2X2M U54 ( .A(n60), .B(n52), .Y(EN_ALU) );
  NAND4X2M U55 ( .A(n47), .B(n48), .C(n85), .D(n23), .Y(n45) );
  AOI21BX2M U56 ( .A0(n58), .A1(n59), .B0N(n60), .Y(n41) );
  NAND2X2M U57 ( .A(ALU_Valid), .B(n14), .Y(n28) );
  OAI2B11X2M U58 ( .A1N(n49), .A0(n12), .B0(n35), .C0(n50), .Y(next[0]) );
  AOI21X2M U59 ( .A0(n12), .A1(n51), .B0(n40), .Y(n50) );
  NAND4BX1M U60 ( .AN(n36), .B(n41), .C(n54), .D(n55), .Y(n51) );
  NAND4BX1M U61 ( .AN(n31), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .D(n56), .Y(
        n54) );
  OAI2BB1X2M U62 ( .A0N(ALU_OUT[0]), .A1N(n37), .B0(n78), .Y(
        FIFO_WRITE_DATA[0]) );
  AOI22X1M U63 ( .A0(RdData_REG_FILE[0]), .A1(n69), .B0(ALU_OUT[8]), .B1(n70), 
        .Y(n78) );
  OAI2BB1X2M U64 ( .A0N(ALU_OUT[1]), .A1N(n37), .B0(n77), .Y(
        FIFO_WRITE_DATA[1]) );
  AOI22X1M U65 ( .A0(RdData_REG_FILE[1]), .A1(n69), .B0(ALU_OUT[9]), .B1(n70), 
        .Y(n77) );
  OAI2BB1X2M U66 ( .A0N(ALU_OUT[2]), .A1N(n37), .B0(n76), .Y(
        FIFO_WRITE_DATA[2]) );
  AOI22X1M U67 ( .A0(RdData_REG_FILE[2]), .A1(n69), .B0(ALU_OUT[10]), .B1(n70), 
        .Y(n76) );
  OAI2BB1X2M U68 ( .A0N(ALU_OUT[3]), .A1N(n37), .B0(n75), .Y(
        FIFO_WRITE_DATA[3]) );
  AOI22X1M U69 ( .A0(RdData_REG_FILE[3]), .A1(n69), .B0(ALU_OUT[11]), .B1(n70), 
        .Y(n75) );
  OAI2BB1X2M U70 ( .A0N(ALU_OUT[4]), .A1N(n37), .B0(n74), .Y(
        FIFO_WRITE_DATA[4]) );
  AOI22X1M U71 ( .A0(RdData_REG_FILE[4]), .A1(n69), .B0(ALU_OUT[12]), .B1(n70), 
        .Y(n74) );
  OAI2BB1X2M U72 ( .A0N(ALU_OUT[5]), .A1N(n37), .B0(n73), .Y(
        FIFO_WRITE_DATA[5]) );
  AOI22X1M U73 ( .A0(RdData_REG_FILE[5]), .A1(n69), .B0(ALU_OUT[13]), .B1(n70), 
        .Y(n73) );
  OAI2BB1X2M U74 ( .A0N(ALU_OUT[6]), .A1N(n37), .B0(n72), .Y(
        FIFO_WRITE_DATA[6]) );
  AOI22X1M U75 ( .A0(RdData_REG_FILE[6]), .A1(n69), .B0(ALU_OUT[14]), .B1(n70), 
        .Y(n72) );
  OAI2BB1X2M U76 ( .A0N(ALU_OUT[7]), .A1N(n37), .B0(n71), .Y(
        FIFO_WRITE_DATA[7]) );
  AOI22X1M U77 ( .A0(RdData_REG_FILE[7]), .A1(n69), .B0(ALU_OUT[15]), .B1(n70), 
        .Y(n71) );
  NAND2X2M U78 ( .A(RdData_Valid_REG_FILE), .B(n14), .Y(n39) );
  NAND3X2M U79 ( .A(n15), .B(n25), .C(n26), .Y(next[3]) );
  AOI221XLM U80 ( .A0(n27), .A1(n28), .B0(n12), .B1(n29), .C0(EN_ALU), .Y(n26)
         );
  OAI31X1M U81 ( .A0(n30), .A1(n22), .A2(n31), .B0(n32), .Y(n29) );
  NAND3X2M U82 ( .A(n85), .B(n23), .C(RX_P_DATA[2]), .Y(n30) );
  NAND3BX2M U83 ( .AN(EN_ALU), .B(n32), .C(n25), .Y(CLK_GATING_ALU_EN) );
  NOR2X2M U84 ( .A(n17), .B(current[2]), .Y(n67) );
  NAND3X2M U85 ( .A(n67), .B(n16), .C(current[1]), .Y(n60) );
  NOR2X2M U86 ( .A(n18), .B(current[3]), .Y(n59) );
  INVX2M U87 ( .A(current[1]), .Y(n18) );
  BUFX2M U88 ( .A(current[0]), .Y(n11) );
  INVX2M U89 ( .A(current[3]), .Y(n17) );
  INVX2M U90 ( .A(RX_P_DATA[6]), .Y(n22) );
  NOR4X1M U91 ( .A(n19), .B(n17), .C(n11), .D(current[1]), .Y(n27) );
  OAI211X2M U92 ( .A0(n64), .A1(n24), .B0(n63), .C0(n65), .Y(n79) );
  NAND2X2M U93 ( .A(Address_REG_FILE[0]), .B(n66), .Y(n65) );
  OAI2BB2X1M U94 ( .B0(n64), .B1(n23), .A0N(Address_REG_FILE[1]), .A1N(n66), 
        .Y(n80) );
  OAI2BB2X1M U95 ( .B0(n64), .B1(n22), .A0N(Address_REG_FILE[2]), .A1N(n66), 
        .Y(n81) );
  OAI2BB2X1M U96 ( .B0(n64), .B1(n21), .A0N(Address_REG_FILE[3]), .A1N(n66), 
        .Y(n82) );
  INVX2M U97 ( .A(current[2]), .Y(n19) );
  NAND3X2M U98 ( .A(n11), .B(n67), .C(current[1]), .Y(n52) );
  INVX2M U99 ( .A(RX_P_DATA[5]), .Y(n23) );
  INVX2M U100 ( .A(RX_P_DATA[7]), .Y(n21) );
  INVX2M U101 ( .A(RX_P_DATA[4]), .Y(n24) );
  INVX2M U102 ( .A(n43), .Y(n15) );
  OAI32X1M U103 ( .A0(n44), .A1(n16), .A2(n19), .B0(n45), .B1(n46), .Y(n43) );
  NAND3X2M U104 ( .A(RX_P_DATA[2]), .B(n12), .C(RX_P_DATA[6]), .Y(n46) );
  NAND2X2M U105 ( .A(current[3]), .B(n18), .Y(n44) );
  NOR2X2M U106 ( .A(n11), .B(current[2]), .Y(n58) );
  NAND3X2M U107 ( .A(current[2]), .B(n11), .C(n59), .Y(n32) );
  NAND4X2M U108 ( .A(RX_P_DATA[1]), .B(n12), .C(RX_P_DATA[5]), .D(n62), .Y(n35) );
  AND4X2M U109 ( .A(n22), .B(n84), .C(n48), .D(n47), .Y(n62) );
  INVX2M U110 ( .A(RX_P_DATA[3]), .Y(n83) );
  INVX2M U111 ( .A(RX_P_DATA[1]), .Y(n85) );
  BUFX2M U112 ( .A(RX_D_VLD), .Y(n12) );
  NOR2X2M U113 ( .A(RX_P_DATA[6]), .B(RX_P_DATA[2]), .Y(n56) );
  INVX2M U114 ( .A(RX_P_DATA[0]), .Y(n86) );
  NAND3X2M U115 ( .A(n47), .B(RX_P_DATA[7]), .C(n57), .Y(n31) );
  NOR3X2M U116 ( .A(n83), .B(RX_P_DATA[4]), .C(RX_P_DATA[0]), .Y(n57) );
  INVX2M U117 ( .A(RX_P_DATA[2]), .Y(n84) );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
endmodule


module RAM_test_1 ( CLK, RST, Address, WrE, RdEn, WrData, RdData, RdData_Valid, 
        REG0, REG1, REG2, REG3, test_si3, test_si2, test_si1, test_so2, 
        test_so1, test_se );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrE, RdEn, test_si3, test_si2, test_si1, test_se;
  output RdData_Valid, test_so2, test_so1;
  wire   N10, N11, N12, N13, \Reg_File[15][7] , \Reg_File[15][6] ,
         \Reg_File[15][5] , \Reg_File[15][4] , \Reg_File[15][3] ,
         \Reg_File[15][2] , \Reg_File[15][1] , \Reg_File[15][0] ,
         \Reg_File[14][7] , \Reg_File[14][6] , \Reg_File[14][5] ,
         \Reg_File[14][4] , \Reg_File[14][3] , \Reg_File[14][2] ,
         \Reg_File[14][1] , \Reg_File[14][0] , \Reg_File[13][7] ,
         \Reg_File[13][6] , \Reg_File[13][5] , \Reg_File[13][4] ,
         \Reg_File[13][3] , \Reg_File[13][2] , \Reg_File[13][1] ,
         \Reg_File[13][0] , \Reg_File[12][7] , \Reg_File[12][6] ,
         \Reg_File[12][5] , \Reg_File[12][4] , \Reg_File[12][3] ,
         \Reg_File[12][2] , \Reg_File[12][1] , \Reg_File[12][0] ,
         \Reg_File[11][7] , \Reg_File[11][6] , \Reg_File[11][5] ,
         \Reg_File[11][4] , \Reg_File[11][3] , \Reg_File[11][2] ,
         \Reg_File[11][1] , \Reg_File[11][0] , \Reg_File[10][7] ,
         \Reg_File[10][6] , \Reg_File[10][5] , \Reg_File[10][4] ,
         \Reg_File[10][3] , \Reg_File[10][2] , \Reg_File[10][1] ,
         \Reg_File[10][0] , \Reg_File[9][7] , \Reg_File[9][6] ,
         \Reg_File[9][5] , \Reg_File[9][4] , \Reg_File[9][3] ,
         \Reg_File[9][2] , \Reg_File[9][1] , \Reg_File[9][0] ,
         \Reg_File[8][7] , \Reg_File[8][6] , \Reg_File[8][5] ,
         \Reg_File[8][4] , \Reg_File[8][3] , \Reg_File[8][2] ,
         \Reg_File[8][1] , \Reg_File[8][0] , \Reg_File[7][7] ,
         \Reg_File[7][6] , \Reg_File[7][5] , \Reg_File[7][4] ,
         \Reg_File[7][3] , \Reg_File[7][2] , \Reg_File[7][1] ,
         \Reg_File[7][0] , \Reg_File[6][7] , \Reg_File[6][6] ,
         \Reg_File[6][5] , \Reg_File[6][4] , \Reg_File[6][3] ,
         \Reg_File[6][2] , \Reg_File[6][1] , \Reg_File[6][0] ,
         \Reg_File[5][7] , \Reg_File[5][6] , \Reg_File[5][5] ,
         \Reg_File[5][4] , \Reg_File[5][3] , \Reg_File[5][2] ,
         \Reg_File[5][1] , \Reg_File[5][0] , \Reg_File[4][7] ,
         \Reg_File[4][6] , \Reg_File[4][5] , \Reg_File[4][4] ,
         \Reg_File[4][3] , \Reg_File[4][2] , \Reg_File[4][1] ,
         \Reg_File[4][0] , N35, N36, N37, N38, N39, N40, N41, N42, N59, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363;
  assign N10 = Address[0];
  assign N11 = Address[1];
  assign N12 = Address[2];
  assign N13 = Address[3];
  assign test_so2 = \Reg_File[15][7] ;
  assign test_so1 = \Reg_File[13][5] ;

  SDFFSQX2M \Reg_File_reg[3][0]  ( .D(n207), .SI(REG2[7]), .SE(test_se), .CK(
        CLK), .SN(n341), .Q(REG3[0]) );
  SDFFRQX2M \Reg_File_reg[13][7]  ( .D(n294), .SI(\Reg_File[13][6] ), .SE(
        test_se), .CK(CLK), .RN(n349), .Q(\Reg_File[13][7] ) );
  SDFFRQX2M \Reg_File_reg[13][6]  ( .D(n293), .SI(test_si3), .SE(test_se), 
        .CK(CLK), .RN(n349), .Q(\Reg_File[13][6] ) );
  SDFFRQX2M \Reg_File_reg[13][5]  ( .D(n292), .SI(\Reg_File[13][4] ), .SE(
        test_se), .CK(CLK), .RN(n349), .Q(\Reg_File[13][5] ) );
  SDFFRQX2M \Reg_File_reg[13][4]  ( .D(n291), .SI(\Reg_File[13][3] ), .SE(
        test_se), .CK(CLK), .RN(n349), .Q(\Reg_File[13][4] ) );
  SDFFRQX2M \Reg_File_reg[13][3]  ( .D(n290), .SI(\Reg_File[13][2] ), .SE(
        test_se), .CK(CLK), .RN(n349), .Q(\Reg_File[13][3] ) );
  SDFFRQX2M \Reg_File_reg[13][2]  ( .D(n289), .SI(\Reg_File[13][1] ), .SE(
        test_se), .CK(CLK), .RN(n349), .Q(\Reg_File[13][2] ) );
  SDFFRQX2M \Reg_File_reg[13][1]  ( .D(n288), .SI(\Reg_File[13][0] ), .SE(
        test_se), .CK(CLK), .RN(n349), .Q(\Reg_File[13][1] ) );
  SDFFRQX2M \Reg_File_reg[13][0]  ( .D(n287), .SI(\Reg_File[12][7] ), .SE(
        test_se), .CK(CLK), .RN(n349), .Q(\Reg_File[13][0] ) );
  SDFFRQX2M \Reg_File_reg[9][7]  ( .D(n262), .SI(\Reg_File[9][6] ), .SE(
        test_se), .CK(CLK), .RN(n347), .Q(\Reg_File[9][7] ) );
  SDFFRQX2M \Reg_File_reg[9][6]  ( .D(n261), .SI(\Reg_File[9][5] ), .SE(
        test_se), .CK(CLK), .RN(n347), .Q(\Reg_File[9][6] ) );
  SDFFRQX2M \Reg_File_reg[9][5]  ( .D(n260), .SI(\Reg_File[9][4] ), .SE(
        test_se), .CK(CLK), .RN(n347), .Q(\Reg_File[9][5] ) );
  SDFFRQX2M \Reg_File_reg[9][4]  ( .D(n259), .SI(\Reg_File[9][3] ), .SE(
        test_se), .CK(CLK), .RN(n347), .Q(\Reg_File[9][4] ) );
  SDFFRQX2M \Reg_File_reg[9][3]  ( .D(n258), .SI(\Reg_File[9][2] ), .SE(
        test_se), .CK(CLK), .RN(n347), .Q(\Reg_File[9][3] ) );
  SDFFRQX2M \Reg_File_reg[9][2]  ( .D(n257), .SI(\Reg_File[9][1] ), .SE(
        test_se), .CK(CLK), .RN(n347), .Q(\Reg_File[9][2] ) );
  SDFFRQX2M \Reg_File_reg[9][1]  ( .D(n256), .SI(\Reg_File[9][0] ), .SE(
        test_se), .CK(CLK), .RN(n346), .Q(\Reg_File[9][1] ) );
  SDFFRQX2M \Reg_File_reg[9][0]  ( .D(n255), .SI(\Reg_File[8][7] ), .SE(
        test_se), .CK(CLK), .RN(n346), .Q(\Reg_File[9][0] ) );
  SDFFRQX2M \Reg_File_reg[5][7]  ( .D(n230), .SI(\Reg_File[5][6] ), .SE(
        test_se), .CK(CLK), .RN(n345), .Q(\Reg_File[5][7] ) );
  SDFFRQX2M \Reg_File_reg[5][6]  ( .D(n229), .SI(\Reg_File[5][5] ), .SE(
        test_se), .CK(CLK), .RN(n344), .Q(\Reg_File[5][6] ) );
  SDFFRQX2M \Reg_File_reg[5][5]  ( .D(n228), .SI(\Reg_File[5][4] ), .SE(
        test_se), .CK(CLK), .RN(n344), .Q(\Reg_File[5][5] ) );
  SDFFRQX2M \Reg_File_reg[5][4]  ( .D(n227), .SI(\Reg_File[5][3] ), .SE(
        test_se), .CK(CLK), .RN(n344), .Q(\Reg_File[5][4] ) );
  SDFFRQX2M \Reg_File_reg[5][3]  ( .D(n226), .SI(\Reg_File[5][2] ), .SE(
        test_se), .CK(CLK), .RN(n344), .Q(\Reg_File[5][3] ) );
  SDFFRQX2M \Reg_File_reg[5][2]  ( .D(n225), .SI(\Reg_File[5][1] ), .SE(
        test_se), .CK(CLK), .RN(n344), .Q(\Reg_File[5][2] ) );
  SDFFRQX2M \Reg_File_reg[5][1]  ( .D(n224), .SI(\Reg_File[5][0] ), .SE(
        test_se), .CK(CLK), .RN(n344), .Q(\Reg_File[5][1] ) );
  SDFFRQX2M \Reg_File_reg[5][0]  ( .D(n223), .SI(\Reg_File[4][7] ), .SE(
        test_se), .CK(CLK), .RN(n344), .Q(\Reg_File[5][0] ) );
  SDFFRQX2M \Reg_File_reg[15][7]  ( .D(n310), .SI(\Reg_File[15][6] ), .SE(
        test_se), .CK(CLK), .RN(n341), .Q(\Reg_File[15][7] ) );
  SDFFRQX2M \Reg_File_reg[15][6]  ( .D(n309), .SI(\Reg_File[15][5] ), .SE(
        test_se), .CK(CLK), .RN(n350), .Q(\Reg_File[15][6] ) );
  SDFFRQX2M \Reg_File_reg[15][5]  ( .D(n308), .SI(\Reg_File[15][4] ), .SE(
        test_se), .CK(CLK), .RN(n350), .Q(\Reg_File[15][5] ) );
  SDFFRQX2M \Reg_File_reg[15][4]  ( .D(n307), .SI(\Reg_File[15][3] ), .SE(
        test_se), .CK(CLK), .RN(n350), .Q(\Reg_File[15][4] ) );
  SDFFRQX2M \Reg_File_reg[15][3]  ( .D(n306), .SI(\Reg_File[15][2] ), .SE(
        test_se), .CK(CLK), .RN(n350), .Q(\Reg_File[15][3] ) );
  SDFFRQX2M \Reg_File_reg[15][2]  ( .D(n305), .SI(\Reg_File[15][1] ), .SE(
        test_se), .CK(CLK), .RN(n350), .Q(\Reg_File[15][2] ) );
  SDFFRQX2M \Reg_File_reg[15][1]  ( .D(n304), .SI(\Reg_File[15][0] ), .SE(
        test_se), .CK(CLK), .RN(n350), .Q(\Reg_File[15][1] ) );
  SDFFRQX2M \Reg_File_reg[15][0]  ( .D(n303), .SI(\Reg_File[14][7] ), .SE(
        test_se), .CK(CLK), .RN(n350), .Q(\Reg_File[15][0] ) );
  SDFFRQX2M \Reg_File_reg[11][7]  ( .D(n278), .SI(\Reg_File[11][6] ), .SE(
        test_se), .CK(CLK), .RN(n348), .Q(\Reg_File[11][7] ) );
  SDFFRQX2M \Reg_File_reg[11][6]  ( .D(n277), .SI(\Reg_File[11][5] ), .SE(
        test_se), .CK(CLK), .RN(n348), .Q(\Reg_File[11][6] ) );
  SDFFRQX2M \Reg_File_reg[11][5]  ( .D(n276), .SI(\Reg_File[11][4] ), .SE(
        test_se), .CK(CLK), .RN(n348), .Q(\Reg_File[11][5] ) );
  SDFFRQX2M \Reg_File_reg[11][4]  ( .D(n275), .SI(\Reg_File[11][3] ), .SE(
        test_se), .CK(CLK), .RN(n348), .Q(\Reg_File[11][4] ) );
  SDFFRQX2M \Reg_File_reg[11][3]  ( .D(n274), .SI(\Reg_File[11][2] ), .SE(
        test_se), .CK(CLK), .RN(n348), .Q(\Reg_File[11][3] ) );
  SDFFRQX2M \Reg_File_reg[11][2]  ( .D(n273), .SI(\Reg_File[11][1] ), .SE(
        test_se), .CK(CLK), .RN(n348), .Q(\Reg_File[11][2] ) );
  SDFFRQX2M \Reg_File_reg[11][1]  ( .D(n272), .SI(\Reg_File[11][0] ), .SE(
        test_se), .CK(CLK), .RN(n348), .Q(\Reg_File[11][1] ) );
  SDFFRQX2M \Reg_File_reg[11][0]  ( .D(n271), .SI(\Reg_File[10][7] ), .SE(
        test_se), .CK(CLK), .RN(n348), .Q(\Reg_File[11][0] ) );
  SDFFRQX2M \Reg_File_reg[7][7]  ( .D(n246), .SI(\Reg_File[7][6] ), .SE(
        test_se), .CK(CLK), .RN(n346), .Q(\Reg_File[7][7] ) );
  SDFFRQX2M \Reg_File_reg[7][6]  ( .D(n245), .SI(\Reg_File[7][5] ), .SE(
        test_se), .CK(CLK), .RN(n346), .Q(\Reg_File[7][6] ) );
  SDFFRQX2M \Reg_File_reg[7][5]  ( .D(n244), .SI(\Reg_File[7][4] ), .SE(
        test_se), .CK(CLK), .RN(n346), .Q(\Reg_File[7][5] ) );
  SDFFRQX2M \Reg_File_reg[7][4]  ( .D(n243), .SI(\Reg_File[7][3] ), .SE(
        test_se), .CK(CLK), .RN(n346), .Q(\Reg_File[7][4] ) );
  SDFFRQX2M \Reg_File_reg[7][3]  ( .D(n242), .SI(\Reg_File[7][2] ), .SE(
        test_se), .CK(CLK), .RN(n345), .Q(\Reg_File[7][3] ) );
  SDFFRQX2M \Reg_File_reg[7][2]  ( .D(n241), .SI(\Reg_File[7][1] ), .SE(
        test_se), .CK(CLK), .RN(n345), .Q(\Reg_File[7][2] ) );
  SDFFRQX2M \Reg_File_reg[7][1]  ( .D(n240), .SI(\Reg_File[7][0] ), .SE(
        test_se), .CK(CLK), .RN(n345), .Q(\Reg_File[7][1] ) );
  SDFFRQX2M \Reg_File_reg[7][0]  ( .D(n239), .SI(\Reg_File[6][7] ), .SE(
        test_se), .CK(CLK), .RN(n345), .Q(\Reg_File[7][0] ) );
  SDFFRQX2M \Reg_File_reg[14][7]  ( .D(n302), .SI(\Reg_File[14][6] ), .SE(
        test_se), .CK(CLK), .RN(n350), .Q(\Reg_File[14][7] ) );
  SDFFRQX2M \Reg_File_reg[14][6]  ( .D(n301), .SI(\Reg_File[14][5] ), .SE(
        test_se), .CK(CLK), .RN(n350), .Q(\Reg_File[14][6] ) );
  SDFFRQX2M \Reg_File_reg[14][5]  ( .D(n300), .SI(\Reg_File[14][4] ), .SE(
        test_se), .CK(CLK), .RN(n350), .Q(\Reg_File[14][5] ) );
  SDFFRQX2M \Reg_File_reg[14][4]  ( .D(n299), .SI(\Reg_File[14][3] ), .SE(
        test_se), .CK(CLK), .RN(n350), .Q(\Reg_File[14][4] ) );
  SDFFRQX2M \Reg_File_reg[14][3]  ( .D(n298), .SI(\Reg_File[14][2] ), .SE(
        test_se), .CK(CLK), .RN(n349), .Q(\Reg_File[14][3] ) );
  SDFFRQX2M \Reg_File_reg[14][2]  ( .D(n297), .SI(\Reg_File[14][1] ), .SE(
        test_se), .CK(CLK), .RN(n349), .Q(\Reg_File[14][2] ) );
  SDFFRQX2M \Reg_File_reg[14][1]  ( .D(n296), .SI(\Reg_File[14][0] ), .SE(
        test_se), .CK(CLK), .RN(n349), .Q(\Reg_File[14][1] ) );
  SDFFRQX2M \Reg_File_reg[14][0]  ( .D(n295), .SI(\Reg_File[13][7] ), .SE(
        test_se), .CK(CLK), .RN(n349), .Q(\Reg_File[14][0] ) );
  SDFFRQX2M \Reg_File_reg[10][7]  ( .D(n270), .SI(\Reg_File[10][6] ), .SE(
        test_se), .CK(CLK), .RN(n347), .Q(\Reg_File[10][7] ) );
  SDFFRQX2M \Reg_File_reg[10][6]  ( .D(n269), .SI(\Reg_File[10][5] ), .SE(
        test_se), .CK(CLK), .RN(n347), .Q(\Reg_File[10][6] ) );
  SDFFRQX2M \Reg_File_reg[10][5]  ( .D(n268), .SI(\Reg_File[10][4] ), .SE(
        test_se), .CK(CLK), .RN(n347), .Q(\Reg_File[10][5] ) );
  SDFFRQX2M \Reg_File_reg[10][4]  ( .D(n267), .SI(\Reg_File[10][3] ), .SE(
        test_se), .CK(CLK), .RN(n347), .Q(\Reg_File[10][4] ) );
  SDFFRQX2M \Reg_File_reg[10][3]  ( .D(n266), .SI(\Reg_File[10][2] ), .SE(
        test_se), .CK(CLK), .RN(n347), .Q(\Reg_File[10][3] ) );
  SDFFRQX2M \Reg_File_reg[10][2]  ( .D(n265), .SI(\Reg_File[10][1] ), .SE(
        test_se), .CK(CLK), .RN(n347), .Q(\Reg_File[10][2] ) );
  SDFFRQX2M \Reg_File_reg[10][1]  ( .D(n264), .SI(\Reg_File[10][0] ), .SE(
        test_se), .CK(CLK), .RN(n347), .Q(\Reg_File[10][1] ) );
  SDFFRQX2M \Reg_File_reg[10][0]  ( .D(n263), .SI(\Reg_File[9][7] ), .SE(
        test_se), .CK(CLK), .RN(n347), .Q(\Reg_File[10][0] ) );
  SDFFRQX2M \Reg_File_reg[6][7]  ( .D(n238), .SI(\Reg_File[6][6] ), .SE(
        test_se), .CK(CLK), .RN(n345), .Q(\Reg_File[6][7] ) );
  SDFFRQX2M \Reg_File_reg[6][6]  ( .D(n237), .SI(\Reg_File[6][5] ), .SE(
        test_se), .CK(CLK), .RN(n345), .Q(\Reg_File[6][6] ) );
  SDFFRQX2M \Reg_File_reg[6][5]  ( .D(n236), .SI(\Reg_File[6][4] ), .SE(
        test_se), .CK(CLK), .RN(n345), .Q(\Reg_File[6][5] ) );
  SDFFRQX2M \Reg_File_reg[6][4]  ( .D(n235), .SI(\Reg_File[6][3] ), .SE(
        test_se), .CK(CLK), .RN(n345), .Q(\Reg_File[6][4] ) );
  SDFFRQX2M \Reg_File_reg[6][3]  ( .D(n234), .SI(\Reg_File[6][2] ), .SE(
        test_se), .CK(CLK), .RN(n345), .Q(\Reg_File[6][3] ) );
  SDFFRQX2M \Reg_File_reg[6][2]  ( .D(n233), .SI(\Reg_File[6][1] ), .SE(
        test_se), .CK(CLK), .RN(n345), .Q(\Reg_File[6][2] ) );
  SDFFRQX2M \Reg_File_reg[6][1]  ( .D(n232), .SI(\Reg_File[6][0] ), .SE(
        test_se), .CK(CLK), .RN(n345), .Q(\Reg_File[6][1] ) );
  SDFFRQX2M \Reg_File_reg[6][0]  ( .D(n231), .SI(\Reg_File[5][7] ), .SE(
        test_se), .CK(CLK), .RN(n345), .Q(\Reg_File[6][0] ) );
  SDFFRQX2M \Reg_File_reg[12][7]  ( .D(n286), .SI(\Reg_File[12][6] ), .SE(
        test_se), .CK(CLK), .RN(n349), .Q(\Reg_File[12][7] ) );
  SDFFRQX2M \Reg_File_reg[12][6]  ( .D(n285), .SI(\Reg_File[12][5] ), .SE(
        test_se), .CK(CLK), .RN(n349), .Q(\Reg_File[12][6] ) );
  SDFFRQX2M \Reg_File_reg[12][5]  ( .D(n284), .SI(\Reg_File[12][4] ), .SE(
        test_se), .CK(CLK), .RN(n348), .Q(\Reg_File[12][5] ) );
  SDFFRQX2M \Reg_File_reg[12][4]  ( .D(n283), .SI(\Reg_File[12][3] ), .SE(
        test_se), .CK(CLK), .RN(n348), .Q(\Reg_File[12][4] ) );
  SDFFRQX2M \Reg_File_reg[12][3]  ( .D(n282), .SI(\Reg_File[12][2] ), .SE(
        test_se), .CK(CLK), .RN(n348), .Q(\Reg_File[12][3] ) );
  SDFFRQX2M \Reg_File_reg[12][2]  ( .D(n281), .SI(\Reg_File[12][1] ), .SE(
        test_se), .CK(CLK), .RN(n348), .Q(\Reg_File[12][2] ) );
  SDFFRQX2M \Reg_File_reg[12][1]  ( .D(n280), .SI(\Reg_File[12][0] ), .SE(
        test_se), .CK(CLK), .RN(n348), .Q(\Reg_File[12][1] ) );
  SDFFRQX2M \Reg_File_reg[12][0]  ( .D(n279), .SI(\Reg_File[11][7] ), .SE(
        test_se), .CK(CLK), .RN(n348), .Q(\Reg_File[12][0] ) );
  SDFFRQX2M \Reg_File_reg[8][7]  ( .D(n254), .SI(\Reg_File[8][6] ), .SE(
        test_se), .CK(CLK), .RN(n346), .Q(\Reg_File[8][7] ) );
  SDFFRQX2M \Reg_File_reg[8][6]  ( .D(n253), .SI(\Reg_File[8][5] ), .SE(
        test_se), .CK(CLK), .RN(n346), .Q(\Reg_File[8][6] ) );
  SDFFRQX2M \Reg_File_reg[8][5]  ( .D(n252), .SI(\Reg_File[8][4] ), .SE(
        test_se), .CK(CLK), .RN(n346), .Q(\Reg_File[8][5] ) );
  SDFFRQX2M \Reg_File_reg[8][4]  ( .D(n251), .SI(\Reg_File[8][3] ), .SE(
        test_se), .CK(CLK), .RN(n346), .Q(\Reg_File[8][4] ) );
  SDFFRQX2M \Reg_File_reg[8][3]  ( .D(n250), .SI(\Reg_File[8][2] ), .SE(
        test_se), .CK(CLK), .RN(n346), .Q(\Reg_File[8][3] ) );
  SDFFRQX2M \Reg_File_reg[8][2]  ( .D(n249), .SI(\Reg_File[8][1] ), .SE(
        test_se), .CK(CLK), .RN(n346), .Q(\Reg_File[8][2] ) );
  SDFFRQX2M \Reg_File_reg[8][1]  ( .D(n248), .SI(\Reg_File[8][0] ), .SE(
        test_se), .CK(CLK), .RN(n346), .Q(\Reg_File[8][1] ) );
  SDFFRQX2M \Reg_File_reg[8][0]  ( .D(n247), .SI(\Reg_File[7][7] ), .SE(
        test_se), .CK(CLK), .RN(n346), .Q(\Reg_File[8][0] ) );
  SDFFRQX2M \Reg_File_reg[4][7]  ( .D(n222), .SI(\Reg_File[4][6] ), .SE(
        test_se), .CK(CLK), .RN(n344), .Q(\Reg_File[4][7] ) );
  SDFFRQX2M \Reg_File_reg[4][6]  ( .D(n221), .SI(\Reg_File[4][5] ), .SE(
        test_se), .CK(CLK), .RN(n344), .Q(\Reg_File[4][6] ) );
  SDFFRQX2M \Reg_File_reg[4][5]  ( .D(n220), .SI(\Reg_File[4][4] ), .SE(
        test_se), .CK(CLK), .RN(n344), .Q(\Reg_File[4][5] ) );
  SDFFRQX2M \Reg_File_reg[4][4]  ( .D(n219), .SI(\Reg_File[4][3] ), .SE(
        test_se), .CK(CLK), .RN(n344), .Q(\Reg_File[4][4] ) );
  SDFFRQX2M \Reg_File_reg[4][3]  ( .D(n218), .SI(\Reg_File[4][2] ), .SE(
        test_se), .CK(CLK), .RN(n344), .Q(\Reg_File[4][3] ) );
  SDFFRQX2M \Reg_File_reg[4][2]  ( .D(n217), .SI(\Reg_File[4][1] ), .SE(
        test_se), .CK(CLK), .RN(n344), .Q(\Reg_File[4][2] ) );
  SDFFRQX2M \Reg_File_reg[4][1]  ( .D(n216), .SI(\Reg_File[4][0] ), .SE(
        test_se), .CK(CLK), .RN(n344), .Q(\Reg_File[4][1] ) );
  SDFFRQX2M \Reg_File_reg[4][0]  ( .D(n215), .SI(REG3[7]), .SE(test_se), .CK(
        CLK), .RN(n343), .Q(\Reg_File[4][0] ) );
  SDFFRQX2M \RdData_reg[7]  ( .D(n182), .SI(RdData[6]), .SE(test_se), .CK(CLK), 
        .RN(n341), .Q(RdData[7]) );
  SDFFRQX2M \RdData_reg[6]  ( .D(n181), .SI(RdData[5]), .SE(test_se), .CK(CLK), 
        .RN(n341), .Q(RdData[6]) );
  SDFFRQX2M \RdData_reg[5]  ( .D(n180), .SI(RdData[4]), .SE(test_se), .CK(CLK), 
        .RN(n341), .Q(RdData[5]) );
  SDFFRQX2M \RdData_reg[4]  ( .D(n179), .SI(RdData[3]), .SE(test_se), .CK(CLK), 
        .RN(n341), .Q(RdData[4]) );
  SDFFRQX2M \RdData_reg[3]  ( .D(n178), .SI(RdData[2]), .SE(test_se), .CK(CLK), 
        .RN(n341), .Q(RdData[3]) );
  SDFFRQX2M \RdData_reg[2]  ( .D(n177), .SI(RdData[1]), .SE(test_se), .CK(CLK), 
        .RN(n341), .Q(RdData[2]) );
  SDFFRQX2M \RdData_reg[1]  ( .D(n176), .SI(RdData[0]), .SE(test_se), .CK(CLK), 
        .RN(n341), .Q(RdData[1]) );
  SDFFRQX2M \RdData_reg[0]  ( .D(n175), .SI(RdData_Valid), .SE(test_se), .CK(
        CLK), .RN(n341), .Q(RdData[0]) );
  SDFFRQX2M \Reg_File_reg[2][1]  ( .D(n200), .SI(REG2[0]), .SE(test_se), .CK(
        CLK), .RN(n342), .Q(REG2[1]) );
  SDFFRQX2M \Reg_File_reg[2][0]  ( .D(n199), .SI(REG1[7]), .SE(test_se), .CK(
        CLK), .RN(n342), .Q(REG2[0]) );
  SDFFRQX2M \Reg_File_reg[3][6]  ( .D(n213), .SI(REG3[5]), .SE(test_se), .CK(
        CLK), .RN(n343), .Q(REG3[6]) );
  SDFFRQX2M \Reg_File_reg[3][7]  ( .D(n214), .SI(REG3[6]), .SE(test_se), .CK(
        CLK), .RN(n343), .Q(REG3[7]) );
  SDFFRQX2M RdData_Valid_reg ( .D(N59), .SI(test_si1), .SE(test_se), .CK(CLK), 
        .RN(n345), .Q(RdData_Valid) );
  SDFFRQX2M \Reg_File_reg[3][5]  ( .D(n212), .SI(REG3[4]), .SE(test_se), .CK(
        CLK), .RN(n343), .Q(REG3[5]) );
  SDFFRQX2M \Reg_File_reg[3][4]  ( .D(n211), .SI(REG3[3]), .SE(test_se), .CK(
        CLK), .RN(n343), .Q(REG3[4]) );
  SDFFRQX2M \Reg_File_reg[3][2]  ( .D(n209), .SI(REG3[1]), .SE(test_se), .CK(
        CLK), .RN(n343), .Q(REG3[2]) );
  SDFFRQX2M \Reg_File_reg[3][3]  ( .D(n210), .SI(test_si2), .SE(test_se), .CK(
        CLK), .RN(n343), .Q(REG3[3]) );
  SDFFRQX2M \Reg_File_reg[3][1]  ( .D(n208), .SI(REG3[0]), .SE(test_se), .CK(
        CLK), .RN(n343), .Q(REG3[1]) );
  SDFFRQX2M \Reg_File_reg[2][5]  ( .D(n204), .SI(REG2[4]), .SE(test_se), .CK(
        CLK), .RN(n343), .Q(REG2[5]) );
  SDFFRQX2M \Reg_File_reg[2][2]  ( .D(n201), .SI(REG2[1]), .SE(test_se), .CK(
        CLK), .RN(n343), .Q(REG2[2]) );
  SDFFRQX2M \Reg_File_reg[0][1]  ( .D(n184), .SI(REG0[0]), .SE(test_se), .CK(
        CLK), .RN(n341), .Q(REG0[1]) );
  SDFFRQX2M \Reg_File_reg[0][0]  ( .D(n183), .SI(RdData[7]), .SE(test_se), 
        .CK(CLK), .RN(n341), .Q(REG0[0]) );
  SDFFRQX2M \Reg_File_reg[2][6]  ( .D(n205), .SI(REG2[5]), .SE(test_se), .CK(
        CLK), .RN(n343), .Q(REG2[6]) );
  SDFFRQX2M \Reg_File_reg[2][4]  ( .D(n203), .SI(REG2[3]), .SE(test_se), .CK(
        CLK), .RN(n343), .Q(REG2[4]) );
  SDFFRQX2M \Reg_File_reg[2][3]  ( .D(n202), .SI(REG2[2]), .SE(test_se), .CK(
        CLK), .RN(n343), .Q(REG2[3]) );
  SDFFRQX2M \Reg_File_reg[0][2]  ( .D(n185), .SI(REG0[1]), .SE(test_se), .CK(
        CLK), .RN(n341), .Q(REG0[2]) );
  SDFFRQX2M \Reg_File_reg[0][3]  ( .D(n186), .SI(REG0[2]), .SE(test_se), .CK(
        CLK), .RN(n342), .Q(REG0[3]) );
  SDFFRQX2M \Reg_File_reg[0][4]  ( .D(n187), .SI(REG0[3]), .SE(test_se), .CK(
        CLK), .RN(n342), .Q(REG0[4]) );
  SDFFRQX2M \Reg_File_reg[0][5]  ( .D(n188), .SI(REG0[4]), .SE(test_se), .CK(
        CLK), .RN(n342), .Q(REG0[5]) );
  SDFFRQX2M \Reg_File_reg[0][6]  ( .D(n189), .SI(REG0[5]), .SE(test_se), .CK(
        CLK), .RN(n342), .Q(REG0[6]) );
  SDFFRQX2M \Reg_File_reg[0][7]  ( .D(n190), .SI(REG0[6]), .SE(test_se), .CK(
        CLK), .RN(n342), .Q(REG0[7]) );
  SDFFRQX2M \Reg_File_reg[1][5]  ( .D(n196), .SI(REG1[4]), .SE(test_se), .CK(
        CLK), .RN(n343), .Q(REG1[5]) );
  SDFFRQX2M \Reg_File_reg[1][4]  ( .D(n195), .SI(REG1[3]), .SE(test_se), .CK(
        CLK), .RN(n342), .Q(REG1[4]) );
  SDFFRQX2M \Reg_File_reg[1][7]  ( .D(n198), .SI(REG1[6]), .SE(test_se), .CK(
        CLK), .RN(n342), .Q(REG1[7]) );
  SDFFRQX2M \Reg_File_reg[1][1]  ( .D(n192), .SI(REG1[0]), .SE(test_se), .CK(
        CLK), .RN(n342), .Q(REG1[1]) );
  SDFFRQX2M \Reg_File_reg[1][3]  ( .D(n194), .SI(REG1[2]), .SE(test_se), .CK(
        CLK), .RN(n342), .Q(REG1[3]) );
  SDFFRQX2M \Reg_File_reg[1][2]  ( .D(n193), .SI(REG1[1]), .SE(test_se), .CK(
        CLK), .RN(n342), .Q(REG1[2]) );
  SDFFRQX2M \Reg_File_reg[1][6]  ( .D(n197), .SI(REG1[5]), .SE(test_se), .CK(
        CLK), .RN(n342), .Q(REG1[6]) );
  SDFFRQX2M \Reg_File_reg[1][0]  ( .D(n191), .SI(REG0[7]), .SE(test_se), .CK(
        CLK), .RN(n342), .Q(REG1[0]) );
  SDFFSQX1M \Reg_File_reg[2][7]  ( .D(n206), .SI(REG2[6]), .SE(test_se), .CK(
        CLK), .SN(RST), .Q(REG2[7]) );
  NOR2X2M U141 ( .A(N11), .B(N12), .Y(n150) );
  NOR2BX2M U142 ( .AN(N12), .B(N11), .Y(n158) );
  NOR2BX2M U143 ( .AN(N12), .B(n340), .Y(n161) );
  NOR2X2M U144 ( .A(n340), .B(N12), .Y(n155) );
  INVX2M U145 ( .A(n336), .Y(n337) );
  INVX2M U146 ( .A(n334), .Y(n335) );
  INVX2M U147 ( .A(n336), .Y(n338) );
  BUFX2M U148 ( .A(n339), .Y(n336) );
  BUFX2M U149 ( .A(n340), .Y(n334) );
  NOR2BX2M U150 ( .AN(WrE), .B(RdEn), .Y(n148) );
  NOR2BX2M U151 ( .AN(RdEn), .B(WrE), .Y(N59) );
  BUFX2M U152 ( .A(n355), .Y(n341) );
  BUFX2M U153 ( .A(n355), .Y(n342) );
  BUFX2M U154 ( .A(n354), .Y(n343) );
  BUFX2M U155 ( .A(n354), .Y(n344) );
  BUFX2M U156 ( .A(n353), .Y(n345) );
  BUFX2M U157 ( .A(n353), .Y(n346) );
  BUFX2M U158 ( .A(n352), .Y(n347) );
  BUFX2M U159 ( .A(n352), .Y(n348) );
  BUFX2M U160 ( .A(n351), .Y(n349) );
  BUFX2M U161 ( .A(n351), .Y(n350) );
  NOR2BX2M U162 ( .AN(n162), .B(N10), .Y(n151) );
  NOR2BX2M U163 ( .AN(n162), .B(n339), .Y(n153) );
  NOR2BX2M U164 ( .AN(n173), .B(N10), .Y(n165) );
  NOR2BX2M U165 ( .AN(n173), .B(n339), .Y(n167) );
  NAND2X2M U166 ( .A(n153), .B(n150), .Y(n152) );
  NAND2X2M U167 ( .A(n165), .B(n150), .Y(n164) );
  NAND2X2M U168 ( .A(n167), .B(n150), .Y(n166) );
  NAND2X2M U169 ( .A(n165), .B(n155), .Y(n168) );
  NAND2X2M U170 ( .A(n167), .B(n155), .Y(n169) );
  NAND2X2M U171 ( .A(n155), .B(n151), .Y(n154) );
  NAND2X2M U172 ( .A(n155), .B(n153), .Y(n156) );
  NAND2X2M U173 ( .A(n158), .B(n151), .Y(n157) );
  NAND2X2M U174 ( .A(n158), .B(n153), .Y(n159) );
  NAND2X2M U175 ( .A(n161), .B(n151), .Y(n160) );
  NAND2X2M U176 ( .A(n161), .B(n153), .Y(n163) );
  NAND2X2M U177 ( .A(n165), .B(n158), .Y(n170) );
  NAND2X2M U178 ( .A(n167), .B(n158), .Y(n171) );
  NAND2X2M U179 ( .A(n165), .B(n161), .Y(n172) );
  NAND2X2M U180 ( .A(n167), .B(n161), .Y(n174) );
  NAND2X2M U181 ( .A(n150), .B(n151), .Y(n149) );
  INVX2M U182 ( .A(WrData[1]), .Y(n357) );
  INVX2M U183 ( .A(WrData[2]), .Y(n358) );
  INVX2M U184 ( .A(WrData[3]), .Y(n359) );
  INVX2M U185 ( .A(WrData[4]), .Y(n360) );
  INVX2M U186 ( .A(WrData[5]), .Y(n361) );
  INVX2M U187 ( .A(WrData[6]), .Y(n362) );
  INVX2M U188 ( .A(WrData[0]), .Y(n356) );
  INVX2M U189 ( .A(WrData[7]), .Y(n363) );
  BUFX2M U190 ( .A(RST), .Y(n354) );
  BUFX2M U191 ( .A(RST), .Y(n353) );
  BUFX2M U192 ( .A(RST), .Y(n352) );
  BUFX2M U193 ( .A(RST), .Y(n351) );
  BUFX2M U194 ( .A(RST), .Y(n355) );
  OAI2BB2X1M U195 ( .B0(n149), .B1(n356), .A0N(REG0[0]), .A1N(n149), .Y(n183)
         );
  OAI2BB2X1M U196 ( .B0(n149), .B1(n357), .A0N(REG0[1]), .A1N(n149), .Y(n184)
         );
  OAI2BB2X1M U197 ( .B0(n149), .B1(n358), .A0N(REG0[2]), .A1N(n149), .Y(n185)
         );
  OAI2BB2X1M U198 ( .B0(n149), .B1(n359), .A0N(REG0[3]), .A1N(n149), .Y(n186)
         );
  OAI2BB2X1M U199 ( .B0(n149), .B1(n360), .A0N(REG0[4]), .A1N(n149), .Y(n187)
         );
  OAI2BB2X1M U200 ( .B0(n149), .B1(n361), .A0N(REG0[5]), .A1N(n149), .Y(n188)
         );
  OAI2BB2X1M U201 ( .B0(n149), .B1(n362), .A0N(REG0[6]), .A1N(n149), .Y(n189)
         );
  OAI2BB2X1M U202 ( .B0(n149), .B1(n363), .A0N(REG0[7]), .A1N(n149), .Y(n190)
         );
  OAI2BB2X1M U203 ( .B0(n356), .B1(n152), .A0N(REG1[0]), .A1N(n152), .Y(n191)
         );
  OAI2BB2X1M U204 ( .B0(n357), .B1(n152), .A0N(REG1[1]), .A1N(n152), .Y(n192)
         );
  OAI2BB2X1M U205 ( .B0(n358), .B1(n152), .A0N(REG1[2]), .A1N(n152), .Y(n193)
         );
  OAI2BB2X1M U206 ( .B0(n359), .B1(n152), .A0N(REG1[3]), .A1N(n152), .Y(n194)
         );
  OAI2BB2X1M U207 ( .B0(n360), .B1(n152), .A0N(REG1[4]), .A1N(n152), .Y(n195)
         );
  OAI2BB2X1M U208 ( .B0(n361), .B1(n152), .A0N(REG1[5]), .A1N(n152), .Y(n196)
         );
  OAI2BB2X1M U209 ( .B0(n362), .B1(n152), .A0N(REG1[6]), .A1N(n152), .Y(n197)
         );
  OAI2BB2X1M U210 ( .B0(n363), .B1(n152), .A0N(REG1[7]), .A1N(n152), .Y(n198)
         );
  OAI2BB2X1M U211 ( .B0(n356), .B1(n157), .A0N(\Reg_File[4][0] ), .A1N(n157), 
        .Y(n215) );
  OAI2BB2X1M U212 ( .B0(n357), .B1(n157), .A0N(\Reg_File[4][1] ), .A1N(n157), 
        .Y(n216) );
  OAI2BB2X1M U213 ( .B0(n358), .B1(n157), .A0N(\Reg_File[4][2] ), .A1N(n157), 
        .Y(n217) );
  OAI2BB2X1M U214 ( .B0(n359), .B1(n157), .A0N(\Reg_File[4][3] ), .A1N(n157), 
        .Y(n218) );
  OAI2BB2X1M U215 ( .B0(n360), .B1(n157), .A0N(\Reg_File[4][4] ), .A1N(n157), 
        .Y(n219) );
  OAI2BB2X1M U216 ( .B0(n361), .B1(n157), .A0N(\Reg_File[4][5] ), .A1N(n157), 
        .Y(n220) );
  OAI2BB2X1M U217 ( .B0(n362), .B1(n157), .A0N(\Reg_File[4][6] ), .A1N(n157), 
        .Y(n221) );
  OAI2BB2X1M U218 ( .B0(n363), .B1(n157), .A0N(\Reg_File[4][7] ), .A1N(n157), 
        .Y(n222) );
  OAI2BB2X1M U219 ( .B0(n356), .B1(n159), .A0N(\Reg_File[5][0] ), .A1N(n159), 
        .Y(n223) );
  OAI2BB2X1M U220 ( .B0(n357), .B1(n159), .A0N(\Reg_File[5][1] ), .A1N(n159), 
        .Y(n224) );
  OAI2BB2X1M U221 ( .B0(n358), .B1(n159), .A0N(\Reg_File[5][2] ), .A1N(n159), 
        .Y(n225) );
  OAI2BB2X1M U222 ( .B0(n359), .B1(n159), .A0N(\Reg_File[5][3] ), .A1N(n159), 
        .Y(n226) );
  OAI2BB2X1M U223 ( .B0(n360), .B1(n159), .A0N(\Reg_File[5][4] ), .A1N(n159), 
        .Y(n227) );
  OAI2BB2X1M U224 ( .B0(n361), .B1(n159), .A0N(\Reg_File[5][5] ), .A1N(n159), 
        .Y(n228) );
  OAI2BB2X1M U225 ( .B0(n362), .B1(n159), .A0N(\Reg_File[5][6] ), .A1N(n159), 
        .Y(n229) );
  OAI2BB2X1M U226 ( .B0(n363), .B1(n159), .A0N(\Reg_File[5][7] ), .A1N(n159), 
        .Y(n230) );
  OAI2BB2X1M U227 ( .B0(n356), .B1(n160), .A0N(\Reg_File[6][0] ), .A1N(n160), 
        .Y(n231) );
  OAI2BB2X1M U228 ( .B0(n357), .B1(n160), .A0N(\Reg_File[6][1] ), .A1N(n160), 
        .Y(n232) );
  OAI2BB2X1M U229 ( .B0(n358), .B1(n160), .A0N(\Reg_File[6][2] ), .A1N(n160), 
        .Y(n233) );
  OAI2BB2X1M U230 ( .B0(n359), .B1(n160), .A0N(\Reg_File[6][3] ), .A1N(n160), 
        .Y(n234) );
  OAI2BB2X1M U231 ( .B0(n360), .B1(n160), .A0N(\Reg_File[6][4] ), .A1N(n160), 
        .Y(n235) );
  OAI2BB2X1M U232 ( .B0(n361), .B1(n160), .A0N(\Reg_File[6][5] ), .A1N(n160), 
        .Y(n236) );
  OAI2BB2X1M U233 ( .B0(n362), .B1(n160), .A0N(\Reg_File[6][6] ), .A1N(n160), 
        .Y(n237) );
  OAI2BB2X1M U234 ( .B0(n363), .B1(n160), .A0N(\Reg_File[6][7] ), .A1N(n160), 
        .Y(n238) );
  OAI2BB2X1M U235 ( .B0(n356), .B1(n163), .A0N(\Reg_File[7][0] ), .A1N(n163), 
        .Y(n239) );
  OAI2BB2X1M U236 ( .B0(n357), .B1(n163), .A0N(\Reg_File[7][1] ), .A1N(n163), 
        .Y(n240) );
  OAI2BB2X1M U237 ( .B0(n358), .B1(n163), .A0N(\Reg_File[7][2] ), .A1N(n163), 
        .Y(n241) );
  OAI2BB2X1M U238 ( .B0(n359), .B1(n163), .A0N(\Reg_File[7][3] ), .A1N(n163), 
        .Y(n242) );
  OAI2BB2X1M U239 ( .B0(n360), .B1(n163), .A0N(\Reg_File[7][4] ), .A1N(n163), 
        .Y(n243) );
  OAI2BB2X1M U240 ( .B0(n361), .B1(n163), .A0N(\Reg_File[7][5] ), .A1N(n163), 
        .Y(n244) );
  OAI2BB2X1M U241 ( .B0(n362), .B1(n163), .A0N(\Reg_File[7][6] ), .A1N(n163), 
        .Y(n245) );
  OAI2BB2X1M U242 ( .B0(n363), .B1(n163), .A0N(\Reg_File[7][7] ), .A1N(n163), 
        .Y(n246) );
  OAI2BB2X1M U243 ( .B0(n356), .B1(n164), .A0N(\Reg_File[8][0] ), .A1N(n164), 
        .Y(n247) );
  OAI2BB2X1M U244 ( .B0(n357), .B1(n164), .A0N(\Reg_File[8][1] ), .A1N(n164), 
        .Y(n248) );
  OAI2BB2X1M U245 ( .B0(n358), .B1(n164), .A0N(\Reg_File[8][2] ), .A1N(n164), 
        .Y(n249) );
  OAI2BB2X1M U246 ( .B0(n359), .B1(n164), .A0N(\Reg_File[8][3] ), .A1N(n164), 
        .Y(n250) );
  OAI2BB2X1M U247 ( .B0(n360), .B1(n164), .A0N(\Reg_File[8][4] ), .A1N(n164), 
        .Y(n251) );
  OAI2BB2X1M U248 ( .B0(n361), .B1(n164), .A0N(\Reg_File[8][5] ), .A1N(n164), 
        .Y(n252) );
  OAI2BB2X1M U249 ( .B0(n362), .B1(n164), .A0N(\Reg_File[8][6] ), .A1N(n164), 
        .Y(n253) );
  OAI2BB2X1M U250 ( .B0(n363), .B1(n164), .A0N(\Reg_File[8][7] ), .A1N(n164), 
        .Y(n254) );
  OAI2BB2X1M U251 ( .B0(n356), .B1(n166), .A0N(\Reg_File[9][0] ), .A1N(n166), 
        .Y(n255) );
  OAI2BB2X1M U252 ( .B0(n357), .B1(n166), .A0N(\Reg_File[9][1] ), .A1N(n166), 
        .Y(n256) );
  OAI2BB2X1M U253 ( .B0(n358), .B1(n166), .A0N(\Reg_File[9][2] ), .A1N(n166), 
        .Y(n257) );
  OAI2BB2X1M U254 ( .B0(n359), .B1(n166), .A0N(\Reg_File[9][3] ), .A1N(n166), 
        .Y(n258) );
  OAI2BB2X1M U255 ( .B0(n360), .B1(n166), .A0N(\Reg_File[9][4] ), .A1N(n166), 
        .Y(n259) );
  OAI2BB2X1M U256 ( .B0(n361), .B1(n166), .A0N(\Reg_File[9][5] ), .A1N(n166), 
        .Y(n260) );
  OAI2BB2X1M U257 ( .B0(n362), .B1(n166), .A0N(\Reg_File[9][6] ), .A1N(n166), 
        .Y(n261) );
  OAI2BB2X1M U258 ( .B0(n363), .B1(n166), .A0N(\Reg_File[9][7] ), .A1N(n166), 
        .Y(n262) );
  OAI2BB2X1M U259 ( .B0(n356), .B1(n168), .A0N(\Reg_File[10][0] ), .A1N(n168), 
        .Y(n263) );
  OAI2BB2X1M U260 ( .B0(n357), .B1(n168), .A0N(\Reg_File[10][1] ), .A1N(n168), 
        .Y(n264) );
  OAI2BB2X1M U261 ( .B0(n358), .B1(n168), .A0N(\Reg_File[10][2] ), .A1N(n168), 
        .Y(n265) );
  OAI2BB2X1M U262 ( .B0(n359), .B1(n168), .A0N(\Reg_File[10][3] ), .A1N(n168), 
        .Y(n266) );
  OAI2BB2X1M U263 ( .B0(n360), .B1(n168), .A0N(\Reg_File[10][4] ), .A1N(n168), 
        .Y(n267) );
  OAI2BB2X1M U264 ( .B0(n361), .B1(n168), .A0N(\Reg_File[10][5] ), .A1N(n168), 
        .Y(n268) );
  OAI2BB2X1M U265 ( .B0(n362), .B1(n168), .A0N(\Reg_File[10][6] ), .A1N(n168), 
        .Y(n269) );
  OAI2BB2X1M U266 ( .B0(n363), .B1(n168), .A0N(\Reg_File[10][7] ), .A1N(n168), 
        .Y(n270) );
  OAI2BB2X1M U267 ( .B0(n356), .B1(n169), .A0N(\Reg_File[11][0] ), .A1N(n169), 
        .Y(n271) );
  OAI2BB2X1M U268 ( .B0(n357), .B1(n169), .A0N(\Reg_File[11][1] ), .A1N(n169), 
        .Y(n272) );
  OAI2BB2X1M U269 ( .B0(n358), .B1(n169), .A0N(\Reg_File[11][2] ), .A1N(n169), 
        .Y(n273) );
  OAI2BB2X1M U270 ( .B0(n359), .B1(n169), .A0N(\Reg_File[11][3] ), .A1N(n169), 
        .Y(n274) );
  OAI2BB2X1M U271 ( .B0(n360), .B1(n169), .A0N(\Reg_File[11][4] ), .A1N(n169), 
        .Y(n275) );
  OAI2BB2X1M U272 ( .B0(n361), .B1(n169), .A0N(\Reg_File[11][5] ), .A1N(n169), 
        .Y(n276) );
  OAI2BB2X1M U273 ( .B0(n362), .B1(n169), .A0N(\Reg_File[11][6] ), .A1N(n169), 
        .Y(n277) );
  OAI2BB2X1M U274 ( .B0(n363), .B1(n169), .A0N(\Reg_File[11][7] ), .A1N(n169), 
        .Y(n278) );
  OAI2BB2X1M U275 ( .B0(n356), .B1(n170), .A0N(\Reg_File[12][0] ), .A1N(n170), 
        .Y(n279) );
  OAI2BB2X1M U276 ( .B0(n357), .B1(n170), .A0N(\Reg_File[12][1] ), .A1N(n170), 
        .Y(n280) );
  OAI2BB2X1M U277 ( .B0(n358), .B1(n170), .A0N(\Reg_File[12][2] ), .A1N(n170), 
        .Y(n281) );
  OAI2BB2X1M U278 ( .B0(n359), .B1(n170), .A0N(\Reg_File[12][3] ), .A1N(n170), 
        .Y(n282) );
  OAI2BB2X1M U279 ( .B0(n360), .B1(n170), .A0N(\Reg_File[12][4] ), .A1N(n170), 
        .Y(n283) );
  OAI2BB2X1M U280 ( .B0(n361), .B1(n170), .A0N(\Reg_File[12][5] ), .A1N(n170), 
        .Y(n284) );
  OAI2BB2X1M U281 ( .B0(n362), .B1(n170), .A0N(\Reg_File[12][6] ), .A1N(n170), 
        .Y(n285) );
  OAI2BB2X1M U282 ( .B0(n363), .B1(n170), .A0N(\Reg_File[12][7] ), .A1N(n170), 
        .Y(n286) );
  OAI2BB2X1M U283 ( .B0(n356), .B1(n171), .A0N(\Reg_File[13][0] ), .A1N(n171), 
        .Y(n287) );
  OAI2BB2X1M U284 ( .B0(n357), .B1(n171), .A0N(\Reg_File[13][1] ), .A1N(n171), 
        .Y(n288) );
  OAI2BB2X1M U285 ( .B0(n358), .B1(n171), .A0N(\Reg_File[13][2] ), .A1N(n171), 
        .Y(n289) );
  OAI2BB2X1M U286 ( .B0(n359), .B1(n171), .A0N(\Reg_File[13][3] ), .A1N(n171), 
        .Y(n290) );
  OAI2BB2X1M U287 ( .B0(n360), .B1(n171), .A0N(\Reg_File[13][4] ), .A1N(n171), 
        .Y(n291) );
  OAI2BB2X1M U288 ( .B0(n361), .B1(n171), .A0N(\Reg_File[13][5] ), .A1N(n171), 
        .Y(n292) );
  OAI2BB2X1M U289 ( .B0(n362), .B1(n171), .A0N(\Reg_File[13][6] ), .A1N(n171), 
        .Y(n293) );
  OAI2BB2X1M U290 ( .B0(n363), .B1(n171), .A0N(\Reg_File[13][7] ), .A1N(n171), 
        .Y(n294) );
  OAI2BB2X1M U291 ( .B0(n356), .B1(n172), .A0N(\Reg_File[14][0] ), .A1N(n172), 
        .Y(n295) );
  OAI2BB2X1M U292 ( .B0(n357), .B1(n172), .A0N(\Reg_File[14][1] ), .A1N(n172), 
        .Y(n296) );
  OAI2BB2X1M U293 ( .B0(n358), .B1(n172), .A0N(\Reg_File[14][2] ), .A1N(n172), 
        .Y(n297) );
  OAI2BB2X1M U294 ( .B0(n359), .B1(n172), .A0N(\Reg_File[14][3] ), .A1N(n172), 
        .Y(n298) );
  OAI2BB2X1M U295 ( .B0(n360), .B1(n172), .A0N(\Reg_File[14][4] ), .A1N(n172), 
        .Y(n299) );
  OAI2BB2X1M U296 ( .B0(n361), .B1(n172), .A0N(\Reg_File[14][5] ), .A1N(n172), 
        .Y(n300) );
  OAI2BB2X1M U297 ( .B0(n362), .B1(n172), .A0N(\Reg_File[14][6] ), .A1N(n172), 
        .Y(n301) );
  OAI2BB2X1M U298 ( .B0(n363), .B1(n172), .A0N(\Reg_File[14][7] ), .A1N(n172), 
        .Y(n302) );
  OAI2BB2X1M U299 ( .B0(n356), .B1(n174), .A0N(\Reg_File[15][0] ), .A1N(n174), 
        .Y(n303) );
  OAI2BB2X1M U300 ( .B0(n357), .B1(n174), .A0N(\Reg_File[15][1] ), .A1N(n174), 
        .Y(n304) );
  OAI2BB2X1M U301 ( .B0(n358), .B1(n174), .A0N(\Reg_File[15][2] ), .A1N(n174), 
        .Y(n305) );
  OAI2BB2X1M U302 ( .B0(n359), .B1(n174), .A0N(\Reg_File[15][3] ), .A1N(n174), 
        .Y(n306) );
  OAI2BB2X1M U303 ( .B0(n360), .B1(n174), .A0N(\Reg_File[15][4] ), .A1N(n174), 
        .Y(n307) );
  OAI2BB2X1M U304 ( .B0(n361), .B1(n174), .A0N(\Reg_File[15][5] ), .A1N(n174), 
        .Y(n308) );
  OAI2BB2X1M U305 ( .B0(n362), .B1(n174), .A0N(\Reg_File[15][6] ), .A1N(n174), 
        .Y(n309) );
  OAI2BB2X1M U306 ( .B0(n363), .B1(n174), .A0N(\Reg_File[15][7] ), .A1N(n174), 
        .Y(n310) );
  OAI2BB2X1M U307 ( .B0(n356), .B1(n154), .A0N(REG2[0]), .A1N(n154), .Y(n199)
         );
  OAI2BB2X1M U308 ( .B0(n357), .B1(n154), .A0N(REG2[1]), .A1N(n154), .Y(n200)
         );
  OAI2BB2X1M U309 ( .B0(n358), .B1(n154), .A0N(REG2[2]), .A1N(n154), .Y(n201)
         );
  OAI2BB2X1M U310 ( .B0(n359), .B1(n154), .A0N(REG2[3]), .A1N(n154), .Y(n202)
         );
  OAI2BB2X1M U311 ( .B0(n360), .B1(n154), .A0N(REG2[4]), .A1N(n154), .Y(n203)
         );
  OAI2BB2X1M U312 ( .B0(n361), .B1(n154), .A0N(REG2[5]), .A1N(n154), .Y(n204)
         );
  OAI2BB2X1M U313 ( .B0(n362), .B1(n154), .A0N(REG2[6]), .A1N(n154), .Y(n205)
         );
  OAI2BB2X1M U314 ( .B0(n357), .B1(n156), .A0N(REG3[1]), .A1N(n156), .Y(n208)
         );
  OAI2BB2X1M U315 ( .B0(n358), .B1(n156), .A0N(REG3[2]), .A1N(n156), .Y(n209)
         );
  OAI2BB2X1M U316 ( .B0(n359), .B1(n156), .A0N(REG3[3]), .A1N(n156), .Y(n210)
         );
  OAI2BB2X1M U317 ( .B0(n360), .B1(n156), .A0N(REG3[4]), .A1N(n156), .Y(n211)
         );
  OAI2BB2X1M U318 ( .B0(n361), .B1(n156), .A0N(REG3[5]), .A1N(n156), .Y(n212)
         );
  OAI2BB2X1M U319 ( .B0(n362), .B1(n156), .A0N(REG3[6]), .A1N(n156), .Y(n213)
         );
  OAI2BB2X1M U320 ( .B0(n363), .B1(n156), .A0N(REG3[7]), .A1N(n156), .Y(n214)
         );
  OAI2BB2X1M U321 ( .B0(n363), .B1(n154), .A0N(REG2[7]), .A1N(n154), .Y(n206)
         );
  OAI2BB2X1M U322 ( .B0(n356), .B1(n156), .A0N(REG3[0]), .A1N(n156), .Y(n207)
         );
  NOR2BX2M U323 ( .AN(n148), .B(N13), .Y(n162) );
  AND2X2M U324 ( .A(N13), .B(n148), .Y(n173) );
  AO22X1M U325 ( .A0(RdData[0]), .A1(n148), .B0(N42), .B1(N59), .Y(n175) );
  MX4X1M U326 ( .A(n142), .B(n140), .C(n141), .D(n139), .S0(N13), .S1(N12), 
        .Y(N42) );
  MX4X1M U327 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N10), 
        .S1(N11), .Y(n142) );
  MX4X1M U328 ( .A(\Reg_File[8][0] ), .B(\Reg_File[9][0] ), .C(
        \Reg_File[10][0] ), .D(\Reg_File[11][0] ), .S0(N10), .S1(N11), .Y(n140) );
  AO22X1M U329 ( .A0(RdData[1]), .A1(n148), .B0(N41), .B1(N59), .Y(n176) );
  MX4X1M U330 ( .A(n146), .B(n144), .C(n145), .D(n143), .S0(N13), .S1(N12), 
        .Y(N41) );
  MX4X1M U331 ( .A(\Reg_File[8][1] ), .B(\Reg_File[9][1] ), .C(
        \Reg_File[10][1] ), .D(\Reg_File[11][1] ), .S0(N10), .S1(N11), .Y(n144) );
  MX4X1M U332 ( .A(\Reg_File[12][1] ), .B(\Reg_File[13][1] ), .C(
        \Reg_File[14][1] ), .D(\Reg_File[15][1] ), .S0(n338), .S1(n335), .Y(
        n143) );
  AO22X1M U333 ( .A0(RdData[2]), .A1(n148), .B0(N40), .B1(N59), .Y(n177) );
  MX4X1M U334 ( .A(n313), .B(n311), .C(n312), .D(n147), .S0(N13), .S1(N12), 
        .Y(N40) );
  MX4X1M U335 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n337), 
        .S1(n335), .Y(n313) );
  MX4X1M U336 ( .A(\Reg_File[8][2] ), .B(\Reg_File[9][2] ), .C(
        \Reg_File[10][2] ), .D(\Reg_File[11][2] ), .S0(n337), .S1(n335), .Y(
        n311) );
  AO22X1M U337 ( .A0(RdData[3]), .A1(n148), .B0(N39), .B1(N59), .Y(n178) );
  MX4X1M U338 ( .A(n317), .B(n315), .C(n316), .D(n314), .S0(N13), .S1(N12), 
        .Y(N39) );
  MX4X1M U339 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n337), 
        .S1(n335), .Y(n317) );
  MX4X1M U340 ( .A(\Reg_File[8][3] ), .B(\Reg_File[9][3] ), .C(
        \Reg_File[10][3] ), .D(\Reg_File[11][3] ), .S0(n337), .S1(n335), .Y(
        n315) );
  AO22X1M U341 ( .A0(RdData[4]), .A1(n148), .B0(N38), .B1(N59), .Y(n179) );
  MX4X1M U342 ( .A(n321), .B(n319), .C(n320), .D(n318), .S0(N13), .S1(N12), 
        .Y(N38) );
  MX4X1M U343 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n338), 
        .S1(n335), .Y(n321) );
  MX4X1M U344 ( .A(\Reg_File[8][4] ), .B(\Reg_File[9][4] ), .C(
        \Reg_File[10][4] ), .D(\Reg_File[11][4] ), .S0(n337), .S1(n335), .Y(
        n319) );
  AO22X1M U345 ( .A0(RdData[5]), .A1(n148), .B0(N37), .B1(N59), .Y(n180) );
  MX4X1M U346 ( .A(n325), .B(n323), .C(n324), .D(n322), .S0(N13), .S1(N12), 
        .Y(N37) );
  MX4X1M U347 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n338), 
        .S1(N11), .Y(n325) );
  MX4X1M U348 ( .A(\Reg_File[8][5] ), .B(\Reg_File[9][5] ), .C(
        \Reg_File[10][5] ), .D(\Reg_File[11][5] ), .S0(n338), .S1(N11), .Y(
        n323) );
  AO22X1M U349 ( .A0(RdData[6]), .A1(n148), .B0(N36), .B1(N59), .Y(n181) );
  MX4X1M U350 ( .A(n329), .B(n327), .C(n328), .D(n326), .S0(N13), .S1(N12), 
        .Y(N36) );
  MX4X1M U351 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n338), 
        .S1(N11), .Y(n329) );
  MX4X1M U352 ( .A(\Reg_File[8][6] ), .B(\Reg_File[9][6] ), .C(
        \Reg_File[10][6] ), .D(\Reg_File[11][6] ), .S0(n338), .S1(N11), .Y(
        n327) );
  AO22X1M U353 ( .A0(RdData[7]), .A1(n148), .B0(N35), .B1(N59), .Y(n182) );
  MX4X1M U354 ( .A(n333), .B(n331), .C(n332), .D(n330), .S0(N13), .S1(N12), 
        .Y(N35) );
  MX4X1M U355 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n338), 
        .S1(N11), .Y(n333) );
  MX4X1M U356 ( .A(\Reg_File[8][7] ), .B(\Reg_File[9][7] ), .C(
        \Reg_File[10][7] ), .D(\Reg_File[11][7] ), .S0(n338), .S1(N11), .Y(
        n331) );
  MX4X1M U357 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n337), 
        .S1(N11), .Y(n146) );
  MX4X1M U358 ( .A(\Reg_File[4][0] ), .B(\Reg_File[5][0] ), .C(
        \Reg_File[6][0] ), .D(\Reg_File[7][0] ), .S0(N10), .S1(N11), .Y(n141)
         );
  MX4X1M U359 ( .A(\Reg_File[4][1] ), .B(\Reg_File[5][1] ), .C(
        \Reg_File[6][1] ), .D(\Reg_File[7][1] ), .S0(n337), .S1(N11), .Y(n145)
         );
  MX4X1M U360 ( .A(\Reg_File[4][2] ), .B(\Reg_File[5][2] ), .C(
        \Reg_File[6][2] ), .D(\Reg_File[7][2] ), .S0(n337), .S1(n335), .Y(n312) );
  MX4X1M U361 ( .A(\Reg_File[4][3] ), .B(\Reg_File[5][3] ), .C(
        \Reg_File[6][3] ), .D(\Reg_File[7][3] ), .S0(n337), .S1(n335), .Y(n316) );
  MX4X1M U362 ( .A(\Reg_File[4][4] ), .B(\Reg_File[5][4] ), .C(
        \Reg_File[6][4] ), .D(\Reg_File[7][4] ), .S0(n337), .S1(n335), .Y(n320) );
  MX4X1M U363 ( .A(\Reg_File[4][5] ), .B(\Reg_File[5][5] ), .C(
        \Reg_File[6][5] ), .D(\Reg_File[7][5] ), .S0(n338), .S1(N11), .Y(n324)
         );
  MX4X1M U364 ( .A(\Reg_File[4][6] ), .B(\Reg_File[5][6] ), .C(
        \Reg_File[6][6] ), .D(\Reg_File[7][6] ), .S0(n338), .S1(N11), .Y(n328)
         );
  MX4X1M U365 ( .A(\Reg_File[4][7] ), .B(\Reg_File[5][7] ), .C(
        \Reg_File[6][7] ), .D(\Reg_File[7][7] ), .S0(n338), .S1(N11), .Y(n332)
         );
  MX4X1M U366 ( .A(\Reg_File[12][0] ), .B(\Reg_File[13][0] ), .C(
        \Reg_File[14][0] ), .D(\Reg_File[15][0] ), .S0(n337), .S1(n335), .Y(
        n139) );
  MX4X1M U367 ( .A(\Reg_File[12][2] ), .B(\Reg_File[13][2] ), .C(
        \Reg_File[14][2] ), .D(\Reg_File[15][2] ), .S0(n337), .S1(n335), .Y(
        n147) );
  MX4X1M U368 ( .A(\Reg_File[12][3] ), .B(\Reg_File[13][3] ), .C(
        \Reg_File[14][3] ), .D(\Reg_File[15][3] ), .S0(n337), .S1(n335), .Y(
        n314) );
  MX4X1M U369 ( .A(\Reg_File[12][4] ), .B(\Reg_File[13][4] ), .C(
        \Reg_File[14][4] ), .D(\Reg_File[15][4] ), .S0(n337), .S1(n335), .Y(
        n318) );
  MX4X1M U370 ( .A(\Reg_File[12][5] ), .B(\Reg_File[13][5] ), .C(
        \Reg_File[14][5] ), .D(\Reg_File[15][5] ), .S0(n338), .S1(N11), .Y(
        n322) );
  MX4X1M U371 ( .A(\Reg_File[12][6] ), .B(\Reg_File[13][6] ), .C(
        \Reg_File[14][6] ), .D(\Reg_File[15][6] ), .S0(n338), .S1(N11), .Y(
        n326) );
  MX4X1M U372 ( .A(\Reg_File[12][7] ), .B(\Reg_File[13][7] ), .C(
        \Reg_File[14][7] ), .D(\Reg_File[15][7] ), .S0(n338), .S1(N11), .Y(
        n330) );
  INVX2M U373 ( .A(N10), .Y(n339) );
  INVX2M U374 ( .A(N11), .Y(n340) );
endmodule


module ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_DW_div_uns_0 ( a, 
        b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;

  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n13), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n14), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n16), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n17), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n18), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n15), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n12), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n18), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n17), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n18), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n18), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n18), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n18), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n18), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n14), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n13), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n16), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n15), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n15), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n14), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n16), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n17), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n15), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n16), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n16), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n17), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n17), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n17), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  INVX2M U1 ( .A(b[0]), .Y(n19) );
  XNOR2X2M U2 ( .A(n19), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n19), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n19), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n19), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n19), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n19), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2X2M U8 ( .A(n19), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  OR2X2M U9 ( .A(n19), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U10 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U11 ( .A(a[5]), .Y(n4) );
  INVX2M U12 ( .A(n19), .Y(n3) );
  NAND2X2M U13 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U14 ( .A(a[4]), .Y(n6) );
  INVX2M U15 ( .A(n19), .Y(n5) );
  NAND2X2M U16 ( .A(n7), .B(n8), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U17 ( .A(a[3]), .Y(n8) );
  INVX2M U18 ( .A(n19), .Y(n7) );
  NAND2X2M U19 ( .A(n7), .B(n9), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U20 ( .A(a[2]), .Y(n9) );
  NAND2X2M U21 ( .A(n7), .B(n10), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U22 ( .A(a[1]), .Y(n10) );
  NAND2X2M U23 ( .A(n7), .B(n11), .Y(\u_div/CryTmp[0][1] ) );
  NAND2X2M U24 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U25 ( .A(a[6]), .Y(n2) );
  INVX2M U26 ( .A(n19), .Y(n1) );
  INVX2M U27 ( .A(a[0]), .Y(n11) );
  INVX2M U28 ( .A(b[1]), .Y(n18) );
  INVX2M U29 ( .A(b[2]), .Y(n17) );
  INVX2M U30 ( .A(b[3]), .Y(n16) );
  INVX2M U31 ( .A(b[4]), .Y(n15) );
  INVX2M U32 ( .A(b[5]), .Y(n14) );
  INVX2M U33 ( .A(b[6]), .Y(n13) );
  INVX2M U34 ( .A(b[7]), .Y(n12) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U40 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U41 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U46 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U47 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U51 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U52 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U55 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U56 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U58 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U59 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U60 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U61 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U62 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U63 ( .A(\u_div/CryTmp[7][1] ), .B(n20), .C(n18), .D(n17), .Y(
        quotient[7]) );
  AND3X1M U64 ( .A(n20), .B(n17), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U65 ( .A(\u_div/CryTmp[5][3] ), .B(n20), .Y(quotient[5]) );
  AND2X1M U66 ( .A(n21), .B(n16), .Y(n20) );
  AND2X1M U67 ( .A(\u_div/CryTmp[4][4] ), .B(n21), .Y(quotient[4]) );
  AND3X1M U68 ( .A(n22), .B(n15), .C(n14), .Y(n21) );
  AND3X1M U69 ( .A(n22), .B(n14), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U70 ( .A(\u_div/CryTmp[2][6] ), .B(n22), .Y(quotient[2]) );
  NOR2X1M U71 ( .A(b[6]), .B(b[7]), .Y(n22) );
  AND2X1M U72 ( .A(\u_div/CryTmp[1][7] ), .B(n12), .Y(quotient[1]) );
endmodule


module ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_DW01_sub_0 ( A, 
        B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  XNOR2X2M U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U2 ( .A(B[0]), .Y(n9) );
  INVX2M U3 ( .A(B[2]), .Y(n7) );
  INVX2M U4 ( .A(B[3]), .Y(n6) );
  INVX2M U5 ( .A(B[4]), .Y(n5) );
  INVX2M U6 ( .A(B[5]), .Y(n4) );
  INVX2M U7 ( .A(B[6]), .Y(n3) );
  INVX2M U8 ( .A(B[1]), .Y(n8) );
  NAND2X2M U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U10 ( .A(A[0]), .Y(n1) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_DW01_add_0 ( A, 
        B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_DW01_add_1 ( A, 
        B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U4 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_DW02_mult_0 ( A, 
        B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n7), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n6), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n8), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n5), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n4), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n3), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  AND2X2M U2 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  CLKXOR2X2M U10 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U12 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U13 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U14 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U15 ( .A(\ab[0][6] ), .Y(n22) );
  INVX2M U16 ( .A(\ab[0][7] ), .Y(n23) );
  AND2X2M U17 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U18 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U21 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U22 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  AND2X2M U23 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U24 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U25 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  XNOR2X2M U27 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U28 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U29 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U30 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U31 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U32 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U33 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U34 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U35 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  INVX2M U36 ( .A(A[1]), .Y(n38) );
  INVX2M U37 ( .A(A[0]), .Y(n39) );
  XNOR2X2M U38 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U39 ( .A(A[2]), .Y(n37) );
  INVX2M U40 ( .A(A[3]), .Y(n36) );
  INVX2M U41 ( .A(A[4]), .Y(n35) );
  INVX2M U42 ( .A(A[6]), .Y(n33) );
  INVX2M U43 ( .A(A[7]), .Y(n32) );
  INVX2M U44 ( .A(A[5]), .Y(n34) );
  INVX2M U45 ( .A(B[6]), .Y(n25) );
  INVX2M U46 ( .A(B[3]), .Y(n28) );
  INVX2M U47 ( .A(B[7]), .Y(n24) );
  INVX2M U48 ( .A(B[4]), .Y(n27) );
  INVX2M U49 ( .A(B[5]), .Y(n26) );
  INVX2M U50 ( .A(B[0]), .Y(n31) );
  INVX2M U51 ( .A(B[2]), .Y(n29) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
  ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_DW01_add_1 FS_1 ( .A(
        {1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , \A1[8] , \A1[7] , 
        \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , \A1[1] , \A1[0] }), 
        .B({n10, n16, n15, n14, n13, n11, n12, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
endmodule


module ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_test_1 ( A, B, 
        ALU_FUN, CLK, RST, ALU_Enable, ALU_OUT, OUT_VALID, test_si, test_se );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input CLK, RST, ALU_Enable, test_si, test_se;
  output OUT_VALID;
  wire   sub_16, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103, N104,
         N105, N106, N107, N108, N109, N111, N112, N113, N114, N115, N116,
         N117, N118, N151, N152, N153, N171, N172, N173, N174, N175, N176,
         N177, N178, N179, N180, N181, N182, N183, N184, N185, N186, N187, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n4, n5, n6, n7, n8, n9, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169;
  wire   [8:0] sum;
  wire   [7:0] sub;

  SDFFRQX2M \ALU_OUT_reg[7]  ( .D(N179), .SI(ALU_OUT[6]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[7]) );
  SDFFRQX2M \ALU_OUT_reg[6]  ( .D(N178), .SI(ALU_OUT[5]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[6]) );
  SDFFRQX2M \ALU_OUT_reg[5]  ( .D(N177), .SI(ALU_OUT[4]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[5]) );
  SDFFRQX2M \ALU_OUT_reg[4]  ( .D(N176), .SI(ALU_OUT[3]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[4]) );
  SDFFRQX2M \ALU_OUT_reg[3]  ( .D(N175), .SI(ALU_OUT[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[3]) );
  SDFFRQX2M \ALU_OUT_reg[2]  ( .D(N174), .SI(ALU_OUT[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[2]) );
  SDFFRQX2M \ALU_OUT_reg[1]  ( .D(N173), .SI(ALU_OUT[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[1]) );
  SDFFRQX2M \ALU_OUT_reg[0]  ( .D(N172), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(ALU_OUT[0]) );
  SDFFRQX2M \ALU_OUT_reg[15]  ( .D(N187), .SI(ALU_OUT[14]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[15]) );
  SDFFRQX2M \ALU_OUT_reg[14]  ( .D(N186), .SI(ALU_OUT[13]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[14]) );
  SDFFRQX2M \ALU_OUT_reg[13]  ( .D(N185), .SI(ALU_OUT[12]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[13]) );
  SDFFRQX2M \ALU_OUT_reg[12]  ( .D(N184), .SI(ALU_OUT[11]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[12]) );
  SDFFRQX2M \ALU_OUT_reg[11]  ( .D(N183), .SI(ALU_OUT[10]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[11]) );
  SDFFRQX2M \ALU_OUT_reg[10]  ( .D(N182), .SI(ALU_OUT[9]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[10]) );
  SDFFRQX2M \ALU_OUT_reg[9]  ( .D(N181), .SI(ALU_OUT[8]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[9]) );
  SDFFRQX2M \ALU_OUT_reg[8]  ( .D(N180), .SI(ALU_OUT[7]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[8]) );
  SDFFRQX1M OUT_VALID_reg ( .D(N171), .SI(ALU_OUT[15]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(OUT_VALID) );
  NOR4X1M U23 ( .A(n168), .B(ALU_FUN[0]), .C(ALU_FUN[1]), .D(ALU_FUN[2]), .Y(
        n73) );
  INVX2M U24 ( .A(n64), .Y(n161) );
  INVX2M U25 ( .A(n69), .Y(n160) );
  OAI2BB1X2M U26 ( .A0N(N108), .A1N(n55), .B0(n56), .Y(N186) );
  OAI2BB1X2M U27 ( .A0N(N109), .A1N(n55), .B0(n56), .Y(N187) );
  OAI2BB1X2M U28 ( .A0N(N106), .A1N(n55), .B0(n56), .Y(N184) );
  OAI2BB1X2M U29 ( .A0N(N105), .A1N(n55), .B0(n56), .Y(N183) );
  OAI2BB1X2M U30 ( .A0N(N107), .A1N(n55), .B0(n56), .Y(N185) );
  OAI2BB1X2M U31 ( .A0N(N103), .A1N(n55), .B0(n56), .Y(N181) );
  OAI2BB1X2M U32 ( .A0N(N104), .A1N(n55), .B0(n56), .Y(N182) );
  OAI21X2M U33 ( .A0(n165), .A1(n166), .B0(n129), .Y(n64) );
  INVX2M U34 ( .A(n74), .Y(n163) );
  INVX2M U35 ( .A(n73), .Y(n164) );
  NAND2X2M U36 ( .A(n130), .B(n138), .Y(n69) );
  INVX2M U37 ( .A(n138), .Y(n166) );
  NOR3X2M U38 ( .A(n167), .B(n165), .C(n168), .Y(n121) );
  AND3X2M U39 ( .A(n130), .B(n167), .C(n168), .Y(n63) );
  AND2X2M U40 ( .A(n137), .B(n162), .Y(n58) );
  AND2X2M U41 ( .A(n121), .B(n162), .Y(n61) );
  OAI2BB2X1M U42 ( .B0(n153), .B1(n69), .A0N(N101), .A1N(n58), .Y(n68) );
  NOR3X2M U43 ( .A(n165), .B(ALU_FUN[0]), .C(n166), .Y(n74) );
  OAI21X2M U44 ( .A0(ALU_FUN[1]), .A1(n166), .B0(n129), .Y(n72) );
  NOR2X2M U45 ( .A(n162), .B(ALU_FUN[1]), .Y(n130) );
  INVX2M U46 ( .A(ALU_FUN[1]), .Y(n165) );
  NOR2X2M U47 ( .A(n167), .B(n4), .Y(n138) );
  INVX2M U48 ( .A(ALU_FUN[2]), .Y(n167) );
  INVX2M U49 ( .A(ALU_FUN[0]), .Y(n162) );
  NAND2BX2M U50 ( .AN(n57), .B(ALU_Enable), .Y(n56) );
  NAND3X2M U51 ( .A(n130), .B(n167), .C(n4), .Y(n129) );
  NOR4X1M U52 ( .A(ALU_FUN[0]), .B(ALU_FUN[1]), .C(ALU_FUN[2]), .D(n4), .Y(n62) );
  NOR3X2M U53 ( .A(ALU_FUN[2]), .B(n4), .C(n165), .Y(n137) );
  AND3X2M U54 ( .A(n130), .B(ALU_FUN[2]), .C(n4), .Y(n78) );
  AOI21X2M U55 ( .A0(n121), .A1(ALU_FUN[0]), .B0(n169), .Y(N171) );
  INVX2M U56 ( .A(n4), .Y(n168) );
  AND2X2M U57 ( .A(n58), .B(ALU_Enable), .Y(n55) );
  INVX2M U58 ( .A(ALU_Enable), .Y(n169) );
  AOI31X2M U59 ( .A0(n122), .A1(n123), .A2(n124), .B0(n169), .Y(N172) );
  AOI22X1M U60 ( .A0(sub[0]), .A1(n63), .B0(sum[0]), .B1(n62), .Y(n122) );
  AOI222X1M U61 ( .A0(N94), .A1(n58), .B0(n74), .B1(n159), .C0(n5), .C1(n160), 
        .Y(n123) );
  AOI211X2M U62 ( .A0(n6), .A1(n78), .B0(n125), .C0(n126), .Y(n124) );
  OAI2BB1X2M U63 ( .A0N(N111), .A1N(n144), .B0(n131), .Y(n125) );
  AOI31X2M U64 ( .A0(N151), .A1(n4), .A2(n132), .B0(n120), .Y(n131) );
  NOR3X2M U65 ( .A(n165), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n132) );
  AOI31X2M U66 ( .A0(n111), .A1(n112), .A2(n113), .B0(n169), .Y(N173) );
  AOI222X1M U67 ( .A0(sum[1]), .A1(n62), .B0(N95), .B1(n58), .C0(sub[1]), .C1(
        n63), .Y(n111) );
  AOI222X1M U68 ( .A0(n6), .A1(n160), .B0(n7), .B1(n78), .C0(n74), .C1(n140), 
        .Y(n112) );
  AOI211X2M U69 ( .A0(n5), .A1(n61), .B0(n114), .C0(n115), .Y(n113) );
  OAI2BB1X2M U70 ( .A0N(N112), .A1N(n144), .B0(n118), .Y(n114) );
  AOI31X2M U71 ( .A0(N152), .A1(n4), .A2(n119), .B0(n120), .Y(n118) );
  NOR3X2M U72 ( .A(n162), .B(ALU_FUN[2]), .C(n165), .Y(n119) );
  AOI31X2M U73 ( .A0(n104), .A1(n105), .A2(n106), .B0(n169), .Y(N174) );
  AOI22X1M U74 ( .A0(sub[2]), .A1(n63), .B0(sum[2]), .B1(n62), .Y(n104) );
  AOI222X1M U75 ( .A0(N96), .A1(n58), .B0(n74), .B1(n158), .C0(n7), .C1(n160), 
        .Y(n105) );
  AOI221XLM U76 ( .A0(n6), .A1(n61), .B0(n8), .B1(n78), .C0(n107), .Y(n106) );
  OAI21X2M U77 ( .A0(n108), .A1(n150), .B0(n109), .Y(n107) );
  AOI221XLM U78 ( .A0(n73), .A1(n158), .B0(n7), .B1(n72), .C0(n160), .Y(n108)
         );
  AOI22X1M U79 ( .A0(N113), .A1(n144), .B0(n110), .B1(n150), .Y(n109) );
  OAI221X1M U80 ( .A0(n7), .A1(n161), .B0(n164), .B1(n158), .C0(n163), .Y(n110) );
  AOI31X2M U81 ( .A0(n97), .A1(n98), .A2(n99), .B0(n169), .Y(N175) );
  AOI22X1M U82 ( .A0(sub[3]), .A1(n63), .B0(sum[3]), .B1(n62), .Y(n97) );
  AOI222X1M U83 ( .A0(N97), .A1(n58), .B0(n74), .B1(n157), .C0(n8), .C1(n160), 
        .Y(n98) );
  AOI221XLM U84 ( .A0(n7), .A1(n61), .B0(n9), .B1(n78), .C0(n100), .Y(n99) );
  OAI21X2M U85 ( .A0(n101), .A1(n149), .B0(n102), .Y(n100) );
  AOI221XLM U86 ( .A0(n73), .A1(n157), .B0(n8), .B1(n72), .C0(n160), .Y(n101)
         );
  AOI22X1M U87 ( .A0(N114), .A1(n144), .B0(n103), .B1(n149), .Y(n102) );
  OAI221X1M U88 ( .A0(n8), .A1(n161), .B0(n164), .B1(n157), .C0(n163), .Y(n103) );
  AOI31X2M U89 ( .A0(n90), .A1(n91), .A2(n92), .B0(n169), .Y(N176) );
  AOI22X1M U90 ( .A0(sub[4]), .A1(n63), .B0(sum[4]), .B1(n62), .Y(n90) );
  AOI222X1M U91 ( .A0(N98), .A1(n58), .B0(n74), .B1(n156), .C0(n9), .C1(n160), 
        .Y(n91) );
  AOI221XLM U92 ( .A0(n8), .A1(n61), .B0(n78), .B1(n27), .C0(n93), .Y(n92) );
  OAI21X2M U93 ( .A0(n94), .A1(n148), .B0(n95), .Y(n93) );
  AOI221XLM U94 ( .A0(n73), .A1(n156), .B0(n9), .B1(n72), .C0(n160), .Y(n94)
         );
  AOI22X1M U95 ( .A0(N115), .A1(n144), .B0(n96), .B1(n148), .Y(n95) );
  OAI221X1M U96 ( .A0(n9), .A1(n161), .B0(n164), .B1(n156), .C0(n163), .Y(n96)
         );
  AOI31X2M U97 ( .A0(n75), .A1(n76), .A2(n77), .B0(n169), .Y(N178) );
  AOI22X1M U98 ( .A0(sub[6]), .A1(n63), .B0(sum[6]), .B1(n62), .Y(n75) );
  AOI221XLM U99 ( .A0(n27), .A1(n61), .B0(n78), .B1(n29), .C0(n79), .Y(n77) );
  AOI222X1M U100 ( .A0(N100), .A1(n58), .B0(n74), .B1(n154), .C0(n160), .C1(
        n28), .Y(n76) );
  AOI31X2M U101 ( .A0(n83), .A1(n84), .A2(n85), .B0(n169), .Y(N177) );
  AOI22X1M U102 ( .A0(sub[5]), .A1(n63), .B0(sum[5]), .B1(n62), .Y(n83) );
  AOI222X1M U103 ( .A0(N99), .A1(n58), .B0(n74), .B1(n155), .C0(n27), .C1(n160), .Y(n84) );
  AOI221XLM U104 ( .A0(n9), .A1(n61), .B0(n78), .B1(n28), .C0(n86), .Y(n85) );
  OAI21X2M U105 ( .A0(n87), .A1(n147), .B0(n88), .Y(n86) );
  AOI221XLM U106 ( .A0(n73), .A1(n155), .B0(n27), .B1(n72), .C0(n160), .Y(n87)
         );
  AOI22X1M U107 ( .A0(N116), .A1(n144), .B0(n89), .B1(n147), .Y(n88) );
  OAI221X1M U108 ( .A0(n27), .A1(n161), .B0(n164), .B1(n155), .C0(n163), .Y(
        n89) );
  AOI31X2M U109 ( .A0(n57), .A1(n59), .A2(n60), .B0(n169), .Y(N180) );
  NAND2X2M U110 ( .A(sum[8]), .B(n62), .Y(n59) );
  AOI22X1M U111 ( .A0(n29), .A1(n61), .B0(N102), .B1(n58), .Y(n60) );
  INVX2M U112 ( .A(n71), .Y(n152) );
  AOI221XLM U113 ( .A0(n72), .A1(n29), .B0(n153), .B1(n73), .C0(n160), .Y(n71)
         );
  OAI221X1M U114 ( .A0(n29), .A1(n161), .B0(n153), .B1(n164), .C0(n163), .Y(
        n70) );
  AOI21X2M U115 ( .A0(sub_16), .A1(n63), .B0(n64), .Y(n57) );
  OAI21X2M U116 ( .A0(n80), .A1(n146), .B0(n81), .Y(n79) );
  AOI221XLM U117 ( .A0(n73), .A1(n154), .B0(n28), .B1(n72), .C0(n160), .Y(n80)
         );
  AOI22X1M U118 ( .A0(N117), .A1(n144), .B0(n82), .B1(n146), .Y(n81) );
  OAI221X1M U119 ( .A0(n28), .A1(n161), .B0(n164), .B1(n154), .C0(n163), .Y(
        n82) );
  AND4X2M U120 ( .A(N153), .B(n4), .C(n133), .D(ALU_FUN[2]), .Y(n120) );
  NOR2X2M U121 ( .A(ALU_FUN[1]), .B(ALU_FUN[0]), .Y(n133) );
  INVX2M U122 ( .A(n6), .Y(n140) );
  BUFX2M U123 ( .A(ALU_FUN[3]), .Y(n4) );
  INVX2M U124 ( .A(n134), .Y(n144) );
  OAI211X2M U125 ( .A0(n135), .A1(n136), .B0(n137), .C0(ALU_FUN[0]), .Y(n134)
         );
  NAND4X2M U126 ( .A(n148), .B(n147), .C(n146), .D(n145), .Y(n135) );
  NAND4X2M U127 ( .A(n141), .B(n151), .C(n150), .D(n149), .Y(n136) );
  INVX2M U128 ( .A(n29), .Y(n153) );
  INVX2M U129 ( .A(n28), .Y(n154) );
  INVX2M U130 ( .A(n5), .Y(n159) );
  INVX2M U131 ( .A(n7), .Y(n158) );
  INVX2M U132 ( .A(n8), .Y(n157) );
  INVX2M U133 ( .A(n27), .Y(n155) );
  INVX2M U134 ( .A(n9), .Y(n156) );
  BUFX2M U135 ( .A(A[7]), .Y(n29) );
  BUFX2M U136 ( .A(A[6]), .Y(n28) );
  BUFX2M U137 ( .A(A[5]), .Y(n27) );
  BUFX2M U138 ( .A(A[4]), .Y(n9) );
  BUFX2M U139 ( .A(A[3]), .Y(n8) );
  BUFX2M U140 ( .A(A[2]), .Y(n7) );
  BUFX2M U141 ( .A(A[1]), .Y(n6) );
  BUFX2M U142 ( .A(A[0]), .Y(n5) );
  AOI31X2M U143 ( .A0(n65), .A1(n66), .A2(n67), .B0(n169), .Y(N179) );
  AOI22X1M U144 ( .A0(n28), .A1(n61), .B0(n74), .B1(n153), .Y(n65) );
  AOI222X1M U145 ( .A0(B[7]), .A1(n152), .B0(N118), .B1(n144), .C0(n70), .C1(
        n145), .Y(n66) );
  AOI221XLM U146 ( .A0(sub[7]), .A1(n63), .B0(sum[7]), .B1(n62), .C0(n68), .Y(
        n67) );
  OAI22X1M U147 ( .A0(n127), .A1(n141), .B0(B[0]), .B1(n128), .Y(n126) );
  AOI221XLM U148 ( .A0(n73), .A1(n159), .B0(n5), .B1(n72), .C0(n160), .Y(n127)
         );
  AOI221XLM U149 ( .A0(n5), .A1(n73), .B0(n64), .B1(n159), .C0(n74), .Y(n128)
         );
  OAI22X1M U150 ( .A0(n116), .A1(n151), .B0(B[1]), .B1(n117), .Y(n115) );
  AOI221XLM U151 ( .A0(n73), .A1(n140), .B0(n6), .B1(n72), .C0(n160), .Y(n116)
         );
  AOI221XLM U152 ( .A0(n6), .A1(n73), .B0(n64), .B1(n140), .C0(n74), .Y(n117)
         );
  INVX2M U153 ( .A(n30), .Y(n142) );
  INVX2M U154 ( .A(n41), .Y(n143) );
  INVX2M U155 ( .A(B[0]), .Y(n141) );
  INVX2M U156 ( .A(B[6]), .Y(n146) );
  INVX2M U157 ( .A(B[3]), .Y(n149) );
  INVX2M U158 ( .A(B[2]), .Y(n150) );
  INVX2M U159 ( .A(B[4]), .Y(n148) );
  INVX2M U160 ( .A(B[5]), .Y(n147) );
  INVX2M U161 ( .A(B[1]), .Y(n151) );
  INVX2M U162 ( .A(B[7]), .Y(n145) );
  NOR2X1M U163 ( .A(n153), .B(B[7]), .Y(n52) );
  NAND2BX1M U164 ( .AN(B[4]), .B(n9), .Y(n45) );
  NAND2BX1M U165 ( .AN(n9), .B(B[4]), .Y(n34) );
  CLKNAND2X2M U166 ( .A(n45), .B(n34), .Y(n47) );
  NOR2X1M U167 ( .A(n149), .B(n8), .Y(n42) );
  NOR2X1M U168 ( .A(n150), .B(n7), .Y(n33) );
  NOR2X1M U169 ( .A(n141), .B(n5), .Y(n30) );
  CLKNAND2X2M U170 ( .A(n7), .B(n150), .Y(n44) );
  NAND2BX1M U171 ( .AN(n33), .B(n44), .Y(n39) );
  AOI21X1M U172 ( .A0(n30), .A1(n140), .B0(B[1]), .Y(n31) );
  AOI211X1M U173 ( .A0(n6), .A1(n142), .B0(n39), .C0(n31), .Y(n32) );
  CLKNAND2X2M U174 ( .A(n8), .B(n149), .Y(n43) );
  OAI31X1M U175 ( .A0(n42), .A1(n33), .A2(n32), .B0(n43), .Y(n35) );
  NAND2BX1M U176 ( .AN(n27), .B(B[5]), .Y(n50) );
  OAI211X1M U177 ( .A0(n47), .A1(n35), .B0(n34), .C0(n50), .Y(n36) );
  NAND2BX1M U178 ( .AN(B[5]), .B(n27), .Y(n46) );
  XNOR2X1M U179 ( .A(n28), .B(B[6]), .Y(n49) );
  AOI32X1M U180 ( .A0(n36), .A1(n46), .A2(n49), .B0(B[6]), .B1(n154), .Y(n37)
         );
  CLKNAND2X2M U181 ( .A(B[7]), .B(n153), .Y(n53) );
  OAI21X1M U182 ( .A0(n52), .A1(n37), .B0(n53), .Y(N153) );
  CLKNAND2X2M U183 ( .A(n5), .B(n141), .Y(n40) );
  OA21X1M U184 ( .A0(n40), .A1(n140), .B0(B[1]), .Y(n38) );
  AOI211X1M U185 ( .A0(n40), .A1(n140), .B0(n39), .C0(n38), .Y(n41) );
  AOI31X1M U186 ( .A0(n143), .A1(n44), .A2(n43), .B0(n42), .Y(n48) );
  OAI2B11X1M U187 ( .A1N(n48), .A0(n47), .B0(n46), .C0(n45), .Y(n51) );
  AOI32X1M U188 ( .A0(n51), .A1(n50), .A2(n49), .B0(n28), .B1(n146), .Y(n54)
         );
  AOI2B1X1M U189 ( .A1N(n54), .A0(n53), .B0(n52), .Y(n139) );
  CLKINVX1M U190 ( .A(n139), .Y(N152) );
  NOR2X1M U191 ( .A(N153), .B(N152), .Y(N151) );
  ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_DW_div_uns_0 div_29 ( 
        .a({n29, n28, n27, n9, n8, n7, n6, n5}), .b(B), .quotient({N118, N117, 
        N116, N115, N114, N113, N112, N111}) );
  ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_DW01_sub_0 sub_10 ( 
        .A({1'b0, n29, n28, n27, n9, n8, n7, n6, n5}), .B({1'b0, B}), .CI(1'b0), .DIFF({sub_16, sub}) );
  ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_DW01_add_0 add_9 ( 
        .A({1'b0, n29, n28, n27, n9, n8, n7, n6, n5}), .B({1'b0, B}), .CI(1'b0), .SUM(sum) );
  ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_DW02_mult_0 mult_26 ( 
        .A({n29, n28, n27, n9, n8, n7, n6, n5}), .B(B), .TC(1'b0), .PRODUCT({
        N109, N108, N107, N106, N105, N104, N103, N102, N101, N100, N99, N98, 
        N97, N96, N95, N94}) );
endmodule


module CLK_GATING ( CLK, CLK_EN, test_mode, GATED_CLK );
  input CLK, CLK_EN, test_mode;
  output GATED_CLK;
  wire   _0_net_;

  TLATNCAX4M U0_TLATNCAX4M ( .E(_0_net_), .CK(CLK), .ECK(GATED_CLK) );
  OR2X2M U1 ( .A(CLK_EN), .B(test_mode), .Y(_0_net_) );
endmodule


module SYS_TOP_dft ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, scan_clk, scan_rst, 
        test_mode, SE, SI, UART_TX_O, parity_error, framing_error, SO, 
        test_si2, test_so2, test_si3, test_so3, test_si4 );
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN, scan_clk, scan_rst, test_mode,
         SE, SI, test_si2, test_si3, test_si4;
  output UART_TX_O, parity_error, framing_error, SO, test_so2, test_so3;
  wire   MUXED_REF_CLK, MUXED_UART_CLK, TX_CLK, MUXED_TX_CLK, RX_CLK,
         MUXED_RX_CLK, D2_SYNC_RST, MUXED_UART_RST, D1_SYNC_RST, MUXED_REF_RST,
         MUXED_RST, RX_VALID, SYNC_RX_VALID, FIFO_WRITE_INC, READ_INC,
         FIFO_FULL, FIFO_EMPTY, TX_BUSY, ALU_VALID, REG_FILE_READ_OUT_VALID,
         ALU_EN, CLK_GATING_ALU_EN, REG_FILE_WRITE_EN, REG_FILE_READ_EN,
         ALU_CLK, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n17, n18, n19, n23, n24, n27, n28, n29;
  wire   [7:0] RX_OUT;
  wire   [7:0] SYNC_RX_OUT;
  wire   [7:0] FIFO_DATA_IN;
  wire   [7:0] READ_FIFO_DATA;
  wire   [7:0] DIV_RATIO;
  wire   [7:0] UART_Config;
  wire   [7:0] RX_DIV_Ratio;
  wire   [15:0] ALU_OUT;
  wire   [7:0] REG_FILE_READ_OUT;
  wire   [3:0] ALU_FUN;
  wire   [3:0] REG_FILE_ADDRESS;
  wire   [7:0] REG_FILE_WRITE_DATA_IN;
  wire   [7:0] OP_A;
  wire   [7:0] OP_B;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;
  assign test_so2 = DIV_RATIO[2];

  INVX2M U2 ( .A(n15), .Y(n14) );
  INVX2M U3 ( .A(FIFO_EMPTY), .Y(n1) );
  INVX4M U4 ( .A(n13), .Y(n12) );
  INVX2M U5 ( .A(MUXED_REF_RST), .Y(n13) );
  INVX2M U6 ( .A(MUXED_UART_RST), .Y(n15) );
  INVX2M U7 ( .A(n7), .Y(n6) );
  INVX2M U8 ( .A(UART_Config[4]), .Y(n7) );
  INVX2M U9 ( .A(n11), .Y(n10) );
  INVX2M U10 ( .A(UART_Config[6]), .Y(n11) );
  INVX2M U11 ( .A(n5), .Y(n4) );
  INVX2M U12 ( .A(UART_Config[3]), .Y(n5) );
  INVX2M U13 ( .A(n9), .Y(n8) );
  INVX2M U14 ( .A(UART_Config[5]), .Y(n9) );
  BUFX2M U15 ( .A(REG_FILE_ADDRESS[0]), .Y(n2) );
  BUFX2M U16 ( .A(REG_FILE_ADDRESS[1]), .Y(n3) );
  mux2X1_1 REF_CLK_MUX ( .IN_0(REF_CLK), .IN_1(scan_clk), .SEL(test_mode), 
        .OUT(MUXED_REF_CLK) );
  mux2X1_4 UART_CLK_MUX ( .IN_0(UART_CLK), .IN_1(scan_clk), .SEL(test_mode), 
        .OUT(MUXED_UART_CLK) );
  mux2X1_3 TX_CLK_MUX ( .IN_0(TX_CLK), .IN_1(scan_clk), .SEL(test_mode), .OUT(
        MUXED_TX_CLK) );
  mux2X1_2 RX_CLK_MUX ( .IN_0(RX_CLK), .IN_1(scan_clk), .SEL(test_mode), .OUT(
        MUXED_RX_CLK) );
  mux2X1_0 UART_RST_MUX ( .IN_0(D2_SYNC_RST), .IN_1(scan_rst), .SEL(test_mode), 
        .OUT(MUXED_UART_RST) );
  mux2X1_6 REF_RST_MUX ( .IN_0(D1_SYNC_RST), .IN_1(scan_rst), .SEL(test_mode), 
        .OUT(MUXED_REF_RST) );
  mux2X1_5 TOT_RST_MUX ( .IN_0(RST_N), .IN_1(scan_rst), .SEL(test_mode), .OUT(
        MUXED_RST) );
  RST_Sync_NUM_STAGES2_test_0 D1 ( .CLK(MUXED_REF_CLK), .RST(MUXED_RST), 
        .SYNC_RST(D1_SYNC_RST), .test_si(n29), .test_so(n28), .test_se(SE) );
  RST_Sync_NUM_STAGES2_test_1 D2 ( .CLK(MUXED_UART_CLK), .RST(MUXED_RST), 
        .SYNC_RST(D2_SYNC_RST), .test_si(n28), .test_so(n27), .test_se(SE) );
  Data_Sync_NUM_STAGES2_BUS_WIDTH8_test_1 DATA_SYNC ( .bus_enable(RX_VALID), 
        .CLK(MUXED_REF_CLK), .RST(n12), .unsync_bus(RX_OUT), .enable_pulse(
        SYNC_RX_VALID), .sync_bus(SYNC_RX_OUT), .test_si(n27), .test_se(SE) );
  fifo_top_width8_test_1 FIFO ( .W_CLK(MUXED_REF_CLK), .W_RST(n12), .W_INC(
        FIFO_WRITE_INC), .R_CLK(MUXED_TX_CLK), .R_RST(n14), .R_INC(READ_INC), 
        .WR_DATA(FIFO_DATA_IN), .RD_DATA(READ_FIFO_DATA), .FULL(FIFO_FULL), 
        .EMPTY(FIFO_EMPTY), .test_si2(test_si2), .test_si1(SYNC_RX_OUT[7]), 
        .test_so2(n24), .test_so1(SO), .test_se(SE) );
  PULSE_GEN_test_1 PULSE_GENERATOR ( .clk(MUXED_TX_CLK), .rst(n14), .lvl_sig(
        TX_BUSY), .pulse_sig(READ_INC), .test_si(n24), .test_so(n23), 
        .test_se(SE) );
  ClkDiv_test_1 TX_CLK_DIV ( .i_ref_clk(MUXED_UART_CLK), .i_rst(n14), 
        .i_clk_en(1'b1), .i_div_ratio(DIV_RATIO), .o_div_clk(TX_CLK), 
        .test_si(n18), .test_so(n17), .test_se(SE) );
  CLKDIV_MUX CLK_DIV_N ( .IN({UART_Config[7], n10, n8, n6, n4, UART_Config[2]}), .OUT({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, RX_DIV_Ratio[3:0]})
         );
  ClkDiv_test_0 RX_CLK_DIV ( .i_ref_clk(MUXED_UART_CLK), .i_rst(n14), 
        .i_clk_en(1'b1), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 
        RX_DIV_Ratio[3:0]}), .o_div_clk(RX_CLK), .test_si(n19), .test_so(n18), 
        .test_se(SE) );
  UART_TOP_test_1 UART ( .TX_CLK(MUXED_TX_CLK), .RX_CLK(MUXED_RX_CLK), .RST(
        n14), .PAR_TYP(UART_Config[1]), .PAR_EN(UART_Config[0]), .Prescale({
        UART_Config[7], n10, n8, n6, n4, UART_Config[2]}), .TX_IN_P(
        READ_FIFO_DATA), .TX_IN_V(n1), .RX_IN_S(UART_RX_IN), .TX_OUT_S(
        UART_TX_O), .TX_OUT_V(TX_BUSY), .RX_OUT_P(RX_OUT), .RX_OUT_V(RX_VALID), 
        .STOP_ERROR(framing_error), .PARITY_ERROR(parity_error), .test_si(n17), 
        .test_se(SE) );
  SYS_CTRL_test_1 CTRL_UNIT ( .ALU_OUT(ALU_OUT), .ALU_Valid(ALU_VALID), 
        .RdData_REG_FILE(REG_FILE_READ_OUT), .RdData_Valid_REG_FILE(
        REG_FILE_READ_OUT_VALID), .RX_P_DATA(SYNC_RX_OUT), .RX_D_VLD(
        SYNC_RX_VALID), .CLK(MUXED_REF_CLK), .RST(n12), .FIFO_FULL(FIFO_FULL), 
        .ALU_FUN(ALU_FUN), .EN_ALU(ALU_EN), .CLK_GATING_ALU_EN(
        CLK_GATING_ALU_EN), .Address_REG_FILE(REG_FILE_ADDRESS), 
        .WrEn_REG_FILE(REG_FILE_WRITE_EN), .RdEn_REG_FILE(REG_FILE_READ_EN), 
        .WrData_REG_FILE(REG_FILE_WRITE_DATA_IN), .FIFO_WRITE_DATA(
        FIFO_DATA_IN), .FIFO_WRITE_INC(FIFO_WRITE_INC), .test_so(n29), 
        .test_se(SE) );
  RAM_test_1 REG_FILE ( .CLK(MUXED_REF_CLK), .RST(n12), .Address({
        REG_FILE_ADDRESS[3:2], n3, n2}), .WrE(REG_FILE_WRITE_EN), .RdEn(
        REG_FILE_READ_EN), .WrData(REG_FILE_WRITE_DATA_IN), .RdData(
        REG_FILE_READ_OUT), .RdData_Valid(REG_FILE_READ_OUT_VALID), .REG0(OP_A), .REG1(OP_B), .REG2(UART_Config), .REG3(DIV_RATIO), .test_si3(test_si4), 
        .test_si2(test_si3), .test_si1(n23), .test_so2(n19), .test_so1(
        test_so3), .test_se(SE) );
  ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_test_1 ALU ( .A(OP_A), 
        .B(OP_B), .ALU_FUN(ALU_FUN), .CLK(ALU_CLK), .RST(n12), .ALU_Enable(
        ALU_EN), .ALU_OUT(ALU_OUT), .OUT_VALID(ALU_VALID), .test_si(SI), 
        .test_se(SE) );
  CLK_GATING ALU_GATING_CLK ( .CLK(MUXED_REF_CLK), .CLK_EN(CLK_GATING_ALU_EN), 
        .test_mode(test_mode), .GATED_CLK(ALU_CLK) );
endmodule


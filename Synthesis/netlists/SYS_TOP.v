/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Wed Oct 23 21:52:22 2024
/////////////////////////////////////////////////////////////


module RST_Sync_NUM_STAGES2_0 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \chain[0] ;

  DFFRQX2M SYNC_RST_reg ( .D(\chain[0] ), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
  DFFRQX2M \chain_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\chain[0] ) );
endmodule


module RST_Sync_NUM_STAGES2_1 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \chain[0] ;

  DFFRQX2M SYNC_RST_reg ( .D(\chain[0] ), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
  DFFRQX2M \chain_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\chain[0] ) );
endmodule


module Data_Sync_NUM_STAGES2_BUS_WIDTH8 ( bus_enable, CLK, RST, unsync_bus, 
        enable_pulse, sync_bus );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input bus_enable, CLK, RST;
  output enable_pulse;
  wire   final, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] chain;

  DFFRQX2M final_reg ( .D(chain[1]), .CK(CLK), .RN(RST), .Q(final) );
  DFFRQX2M enable_pulse_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(enable_pulse) );
  DFFRQX2M \chain_reg[1]  ( .D(chain[0]), .CK(CLK), .RN(RST), .Q(chain[1]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX2M \chain_reg[0]  ( .D(bus_enable), .CK(CLK), .RN(RST), .Q(chain[0])
         );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(final), .B(chain[1]), .Y(n1) );
  AO22X1M U5 ( .A0(unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module fifo_wptr_full ( w_inc, CLK, RST, r_ptr_syncronized, w_address, w_ptr, 
        w_full );
  input [3:0] r_ptr_syncronized;
  output [2:0] w_address;
  output [3:0] w_ptr;
  input w_inc, CLK, RST;
  output w_full;
  wire   n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n1, n2, n3,
         n4;

  DFFRQX2M \internal_reg[3]  ( .D(n15), .CK(CLK), .RN(RST), .Q(w_ptr[3]) );
  DFFRQX2M \internal_reg[2]  ( .D(n16), .CK(CLK), .RN(RST), .Q(w_address[2])
         );
  DFFRQX2M \internal_reg[0]  ( .D(n18), .CK(CLK), .RN(RST), .Q(w_address[0])
         );
  DFFRQX2M \internal_reg[1]  ( .D(n17), .CK(CLK), .RN(RST), .Q(w_address[1])
         );
  INVX2M U3 ( .A(RST), .Y(n2) );
  NOR2BX2M U4 ( .AN(w_inc), .B(w_full), .Y(n9) );
  CLKXOR2X2M U5 ( .A(n4), .B(n3), .Y(w_ptr[2]) );
  XNOR2X2M U6 ( .A(n4), .B(n1), .Y(n15) );
  NOR2X2M U7 ( .A(n7), .B(n3), .Y(n1) );
  CLKXOR2X2M U8 ( .A(n3), .B(n7), .Y(n16) );
  XNOR2X2M U9 ( .A(w_ptr[2]), .B(r_ptr_syncronized[2]), .Y(n14) );
  AND4X2M U10 ( .A(n10), .B(n11), .C(n12), .D(n13), .Y(w_full) );
  CLKXOR2X2M U11 ( .A(w_ptr[3]), .B(r_ptr_syncronized[3]), .Y(n13) );
  XNOR2X2M U12 ( .A(w_ptr[1]), .B(r_ptr_syncronized[1]), .Y(n10) );
  NOR2X2M U13 ( .A(n2), .B(n14), .Y(n12) );
  XNOR2X2M U14 ( .A(w_ptr[0]), .B(r_ptr_syncronized[0]), .Y(n11) );
  NAND2X2M U15 ( .A(n8), .B(w_address[1]), .Y(n7) );
  INVX2M U16 ( .A(w_address[2]), .Y(n3) );
  AND2X2M U17 ( .A(n9), .B(w_address[0]), .Y(n8) );
  INVX2M U18 ( .A(w_ptr[3]), .Y(n4) );
  CLKXOR2X2M U19 ( .A(w_address[1]), .B(w_address[2]), .Y(w_ptr[1]) );
  CLKXOR2X2M U20 ( .A(w_address[0]), .B(w_address[1]), .Y(w_ptr[0]) );
  CLKXOR2X2M U21 ( .A(w_address[1]), .B(n8), .Y(n17) );
  CLKXOR2X2M U22 ( .A(w_address[0]), .B(n9), .Y(n18) );
endmodule


module data_sync_fifo_0 ( insertion, out, CLK, RST );
  input [3:0] insertion;
  output [3:0] out;
  input CLK, RST;

  wire   [3:0] stage_one;

  DFFRQX2M \out_reg[2]  ( .D(stage_one[2]), .CK(CLK), .RN(RST), .Q(out[2]) );
  DFFRQX2M \out_reg[1]  ( .D(stage_one[1]), .CK(CLK), .RN(RST), .Q(out[1]) );
  DFFRQX2M \out_reg[0]  ( .D(stage_one[0]), .CK(CLK), .RN(RST), .Q(out[0]) );
  DFFRQX2M \out_reg[3]  ( .D(stage_one[3]), .CK(CLK), .RN(RST), .Q(out[3]) );
  DFFRQX2M \stage_one_reg[2]  ( .D(insertion[2]), .CK(CLK), .RN(RST), .Q(
        stage_one[2]) );
  DFFRQX2M \stage_one_reg[1]  ( .D(insertion[1]), .CK(CLK), .RN(RST), .Q(
        stage_one[1]) );
  DFFRQX2M \stage_one_reg[0]  ( .D(insertion[0]), .CK(CLK), .RN(RST), .Q(
        stage_one[0]) );
  DFFRQX2M \stage_one_reg[3]  ( .D(insertion[3]), .CK(CLK), .RN(RST), .Q(
        stage_one[3]) );
endmodule


module fifo_rptr_empty ( r_inc, CLK, RST, w_ptr_syncronized, r_address, r_ptr, 
        r_empty );
  input [3:0] w_ptr_syncronized;
  output [2:0] r_address;
  output [3:0] r_ptr;
  input r_inc, CLK, RST;
  output r_empty;
  wire   n3, n5, n6, n7, n8, n9, n10, n11, n12, n13, n15, n16, n17, n18, n1;

  DFFRQX2M \internal_reg[3]  ( .D(n15), .CK(CLK), .RN(RST), .Q(r_ptr[3]) );
  DFFRQX2M \internal_reg[2]  ( .D(n16), .CK(CLK), .RN(RST), .Q(r_address[2])
         );
  DFFRX1M \internal_reg[0]  ( .D(n18), .CK(CLK), .RN(RST), .Q(r_address[0]), 
        .QN(n3) );
  DFFRQX2M \internal_reg[1]  ( .D(n17), .CK(CLK), .RN(RST), .Q(r_address[1])
         );
  INVX2M U3 ( .A(n5), .Y(r_empty) );
  NOR2X2M U4 ( .A(n9), .B(n3), .Y(n8) );
  XNOR2X2M U5 ( .A(r_address[2]), .B(n7), .Y(n16) );
  NAND4X2M U6 ( .A(n10), .B(n11), .C(n12), .D(n13), .Y(n5) );
  XNOR2X2M U7 ( .A(r_ptr[2]), .B(w_ptr_syncronized[2]), .Y(n13) );
  XNOR2X2M U8 ( .A(r_ptr[0]), .B(w_ptr_syncronized[0]), .Y(n11) );
  XNOR2X2M U9 ( .A(r_ptr[1]), .B(w_ptr_syncronized[1]), .Y(n10) );
  NAND2X2M U10 ( .A(n8), .B(r_address[1]), .Y(n7) );
  AND2X2M U11 ( .A(RST), .B(n1), .Y(n12) );
  XNOR2X2M U12 ( .A(w_ptr_syncronized[3]), .B(r_ptr[3]), .Y(n1) );
  NAND2X2M U13 ( .A(r_inc), .B(n5), .Y(n9) );
  CLKXOR2X2M U14 ( .A(r_address[1]), .B(n8), .Y(n17) );
  CLKXOR2X2M U15 ( .A(r_ptr[3]), .B(n6), .Y(n15) );
  NOR2BX2M U16 ( .AN(r_address[2]), .B(n7), .Y(n6) );
  CLKXOR2X2M U17 ( .A(n3), .B(n9), .Y(n18) );
  XNOR2X2M U18 ( .A(n3), .B(r_address[1]), .Y(r_ptr[0]) );
  CLKXOR2X2M U19 ( .A(r_address[1]), .B(r_address[2]), .Y(r_ptr[1]) );
  CLKXOR2X2M U20 ( .A(r_ptr[3]), .B(r_address[2]), .Y(r_ptr[2]) );
endmodule


module data_sync_fifo_1 ( insertion, out, CLK, RST );
  input [3:0] insertion;
  output [3:0] out;
  input CLK, RST;

  wire   [3:0] stage_one;

  DFFRQX2M \out_reg[2]  ( .D(stage_one[2]), .CK(CLK), .RN(RST), .Q(out[2]) );
  DFFRQX2M \out_reg[1]  ( .D(stage_one[1]), .CK(CLK), .RN(RST), .Q(out[1]) );
  DFFRQX2M \out_reg[0]  ( .D(stage_one[0]), .CK(CLK), .RN(RST), .Q(out[0]) );
  DFFRQX2M \out_reg[3]  ( .D(stage_one[3]), .CK(CLK), .RN(RST), .Q(out[3]) );
  DFFRQX2M \stage_one_reg[1]  ( .D(insertion[1]), .CK(CLK), .RN(RST), .Q(
        stage_one[1]) );
  DFFRQX2M \stage_one_reg[0]  ( .D(insertion[0]), .CK(CLK), .RN(RST), .Q(
        stage_one[0]) );
  DFFRQX2M \stage_one_reg[3]  ( .D(insertion[3]), .CK(CLK), .RN(RST), .Q(
        stage_one[3]) );
  DFFRQX2M \stage_one_reg[2]  ( .D(insertion[2]), .CK(CLK), .RN(RST), .Q(
        stage_one[2]) );
endmodule


module fifo_memory_data_width8 ( w_data, full, w_inc, CLK, RST, w_address, 
        r_address, r_data );
  input [7:0] w_data;
  input [2:0] w_address;
  input [2:0] r_address;
  output [7:0] r_data;
  input full, w_inc, CLK, RST;
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
         \Memory[0][0] , n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113;
  assign N10 = r_address[0];
  assign N11 = r_address[1];
  assign N12 = r_address[2];

  DFFRQX2M \Memory_reg[5][7]  ( .D(n69), .CK(CLK), .RN(n100), .Q(
        \Memory[5][7] ) );
  DFFRQX2M \Memory_reg[5][6]  ( .D(n68), .CK(CLK), .RN(n100), .Q(
        \Memory[5][6] ) );
  DFFRQX2M \Memory_reg[5][5]  ( .D(n67), .CK(CLK), .RN(n100), .Q(
        \Memory[5][5] ) );
  DFFRQX2M \Memory_reg[5][4]  ( .D(n66), .CK(CLK), .RN(n100), .Q(
        \Memory[5][4] ) );
  DFFRQX2M \Memory_reg[5][3]  ( .D(n65), .CK(CLK), .RN(n100), .Q(
        \Memory[5][3] ) );
  DFFRQX2M \Memory_reg[5][2]  ( .D(n64), .CK(CLK), .RN(n100), .Q(
        \Memory[5][2] ) );
  DFFRQX2M \Memory_reg[5][1]  ( .D(n63), .CK(CLK), .RN(n100), .Q(
        \Memory[5][1] ) );
  DFFRQX2M \Memory_reg[5][0]  ( .D(n62), .CK(CLK), .RN(n100), .Q(
        \Memory[5][0] ) );
  DFFRQX2M \Memory_reg[1][7]  ( .D(n37), .CK(CLK), .RN(n102), .Q(
        \Memory[1][7] ) );
  DFFRQX2M \Memory_reg[1][6]  ( .D(n36), .CK(CLK), .RN(n102), .Q(
        \Memory[1][6] ) );
  DFFRQX2M \Memory_reg[1][5]  ( .D(n35), .CK(CLK), .RN(n102), .Q(
        \Memory[1][5] ) );
  DFFRQX2M \Memory_reg[1][4]  ( .D(n34), .CK(CLK), .RN(n102), .Q(
        \Memory[1][4] ) );
  DFFRQX2M \Memory_reg[1][3]  ( .D(n33), .CK(CLK), .RN(n103), .Q(
        \Memory[1][3] ) );
  DFFRQX2M \Memory_reg[1][2]  ( .D(n32), .CK(CLK), .RN(n103), .Q(
        \Memory[1][2] ) );
  DFFRQX2M \Memory_reg[1][1]  ( .D(n31), .CK(CLK), .RN(n103), .Q(
        \Memory[1][1] ) );
  DFFRQX2M \Memory_reg[1][0]  ( .D(n30), .CK(CLK), .RN(n103), .Q(
        \Memory[1][0] ) );
  DFFRQX2M \Memory_reg[7][7]  ( .D(n85), .CK(CLK), .RN(n99), .Q(\Memory[7][7] ) );
  DFFRQX2M \Memory_reg[7][6]  ( .D(n84), .CK(CLK), .RN(n99), .Q(\Memory[7][6] ) );
  DFFRQX2M \Memory_reg[7][5]  ( .D(n83), .CK(CLK), .RN(n99), .Q(\Memory[7][5] ) );
  DFFRQX2M \Memory_reg[7][4]  ( .D(n82), .CK(CLK), .RN(n99), .Q(\Memory[7][4] ) );
  DFFRQX2M \Memory_reg[7][3]  ( .D(n81), .CK(CLK), .RN(n99), .Q(\Memory[7][3] ) );
  DFFRQX2M \Memory_reg[7][2]  ( .D(n80), .CK(CLK), .RN(n99), .Q(\Memory[7][2] ) );
  DFFRQX2M \Memory_reg[7][1]  ( .D(n79), .CK(CLK), .RN(n99), .Q(\Memory[7][1] ) );
  DFFRQX2M \Memory_reg[7][0]  ( .D(n78), .CK(CLK), .RN(n99), .Q(\Memory[7][0] ) );
  DFFRQX2M \Memory_reg[3][7]  ( .D(n53), .CK(CLK), .RN(n101), .Q(
        \Memory[3][7] ) );
  DFFRQX2M \Memory_reg[3][6]  ( .D(n52), .CK(CLK), .RN(n101), .Q(
        \Memory[3][6] ) );
  DFFRQX2M \Memory_reg[3][5]  ( .D(n51), .CK(CLK), .RN(n101), .Q(
        \Memory[3][5] ) );
  DFFRQX2M \Memory_reg[3][4]  ( .D(n50), .CK(CLK), .RN(n101), .Q(
        \Memory[3][4] ) );
  DFFRQX2M \Memory_reg[3][3]  ( .D(n49), .CK(CLK), .RN(n101), .Q(
        \Memory[3][3] ) );
  DFFRQX2M \Memory_reg[3][2]  ( .D(n48), .CK(CLK), .RN(n101), .Q(
        \Memory[3][2] ) );
  DFFRQX2M \Memory_reg[3][1]  ( .D(n47), .CK(CLK), .RN(n101), .Q(
        \Memory[3][1] ) );
  DFFRQX2M \Memory_reg[3][0]  ( .D(n46), .CK(CLK), .RN(n102), .Q(
        \Memory[3][0] ) );
  DFFRQX2M \Memory_reg[6][7]  ( .D(n77), .CK(CLK), .RN(n99), .Q(\Memory[6][7] ) );
  DFFRQX2M \Memory_reg[6][6]  ( .D(n76), .CK(CLK), .RN(n99), .Q(\Memory[6][6] ) );
  DFFRQX2M \Memory_reg[6][5]  ( .D(n75), .CK(CLK), .RN(n99), .Q(\Memory[6][5] ) );
  DFFRQX2M \Memory_reg[6][4]  ( .D(n74), .CK(CLK), .RN(n99), .Q(\Memory[6][4] ) );
  DFFRQX2M \Memory_reg[6][3]  ( .D(n73), .CK(CLK), .RN(n99), .Q(\Memory[6][3] ) );
  DFFRQX2M \Memory_reg[6][2]  ( .D(n72), .CK(CLK), .RN(n100), .Q(
        \Memory[6][2] ) );
  DFFRQX2M \Memory_reg[6][1]  ( .D(n71), .CK(CLK), .RN(n100), .Q(
        \Memory[6][1] ) );
  DFFRQX2M \Memory_reg[6][0]  ( .D(n70), .CK(CLK), .RN(n100), .Q(
        \Memory[6][0] ) );
  DFFRQX2M \Memory_reg[2][7]  ( .D(n45), .CK(CLK), .RN(n102), .Q(
        \Memory[2][7] ) );
  DFFRQX2M \Memory_reg[2][6]  ( .D(n44), .CK(CLK), .RN(n102), .Q(
        \Memory[2][6] ) );
  DFFRQX2M \Memory_reg[2][5]  ( .D(n43), .CK(CLK), .RN(n102), .Q(
        \Memory[2][5] ) );
  DFFRQX2M \Memory_reg[2][4]  ( .D(n42), .CK(CLK), .RN(n102), .Q(
        \Memory[2][4] ) );
  DFFRQX2M \Memory_reg[2][3]  ( .D(n41), .CK(CLK), .RN(n102), .Q(
        \Memory[2][3] ) );
  DFFRQX2M \Memory_reg[2][2]  ( .D(n40), .CK(CLK), .RN(n102), .Q(
        \Memory[2][2] ) );
  DFFRQX2M \Memory_reg[2][1]  ( .D(n39), .CK(CLK), .RN(n102), .Q(
        \Memory[2][1] ) );
  DFFRQX2M \Memory_reg[2][0]  ( .D(n38), .CK(CLK), .RN(n102), .Q(
        \Memory[2][0] ) );
  DFFRQX2M \Memory_reg[4][7]  ( .D(n61), .CK(CLK), .RN(n100), .Q(
        \Memory[4][7] ) );
  DFFRQX2M \Memory_reg[4][6]  ( .D(n60), .CK(CLK), .RN(n100), .Q(
        \Memory[4][6] ) );
  DFFRQX2M \Memory_reg[4][5]  ( .D(n59), .CK(CLK), .RN(n101), .Q(
        \Memory[4][5] ) );
  DFFRQX2M \Memory_reg[4][4]  ( .D(n58), .CK(CLK), .RN(n101), .Q(
        \Memory[4][4] ) );
  DFFRQX2M \Memory_reg[4][3]  ( .D(n57), .CK(CLK), .RN(n101), .Q(
        \Memory[4][3] ) );
  DFFRQX2M \Memory_reg[4][2]  ( .D(n56), .CK(CLK), .RN(n101), .Q(
        \Memory[4][2] ) );
  DFFRQX2M \Memory_reg[4][1]  ( .D(n55), .CK(CLK), .RN(n101), .Q(
        \Memory[4][1] ) );
  DFFRQX2M \Memory_reg[4][0]  ( .D(n54), .CK(CLK), .RN(n101), .Q(
        \Memory[4][0] ) );
  DFFRQX2M \Memory_reg[0][7]  ( .D(n29), .CK(CLK), .RN(n103), .Q(
        \Memory[0][7] ) );
  DFFRQX2M \Memory_reg[0][6]  ( .D(n28), .CK(CLK), .RN(n103), .Q(
        \Memory[0][6] ) );
  DFFRQX2M \Memory_reg[0][5]  ( .D(n27), .CK(CLK), .RN(n103), .Q(
        \Memory[0][5] ) );
  DFFRQX2M \Memory_reg[0][4]  ( .D(n26), .CK(CLK), .RN(n103), .Q(
        \Memory[0][4] ) );
  DFFRQX2M \Memory_reg[0][3]  ( .D(n25), .CK(CLK), .RN(n103), .Q(
        \Memory[0][3] ) );
  DFFRQX2M \Memory_reg[0][2]  ( .D(n24), .CK(CLK), .RN(n103), .Q(
        \Memory[0][2] ) );
  DFFRQX2M \Memory_reg[0][1]  ( .D(n23), .CK(CLK), .RN(n103), .Q(
        \Memory[0][1] ) );
  DFFRQX2M \Memory_reg[0][0]  ( .D(n22), .CK(CLK), .RN(n103), .Q(
        \Memory[0][0] ) );
  BUFX2M U2 ( .A(n19), .Y(n95) );
  BUFX2M U3 ( .A(n20), .Y(n94) );
  BUFX2M U4 ( .A(n21), .Y(n93) );
  BUFX2M U5 ( .A(n14), .Y(n96) );
  BUFX2M U6 ( .A(n97), .Y(n101) );
  BUFX2M U7 ( .A(n97), .Y(n100) );
  BUFX2M U8 ( .A(n97), .Y(n99) );
  BUFX2M U9 ( .A(n98), .Y(n102) );
  BUFX2M U10 ( .A(n98), .Y(n103) );
  BUFX2M U11 ( .A(RST), .Y(n97) );
  BUFX2M U12 ( .A(RST), .Y(n98) );
  NAND3X2M U13 ( .A(n112), .B(n113), .C(n18), .Y(n17) );
  NAND3X2M U14 ( .A(n112), .B(n113), .C(n12), .Y(n11) );
  NOR2BX2M U15 ( .AN(w_inc), .B(full), .Y(n16) );
  NAND3X2M U16 ( .A(w_address[0]), .B(n12), .C(w_address[1]), .Y(n15) );
  NAND3X2M U17 ( .A(n12), .B(n113), .C(w_address[0]), .Y(n13) );
  NOR2BX2M U18 ( .AN(n16), .B(w_address[2]), .Y(n12) );
  OAI2BB2X1M U19 ( .B0(n11), .B1(n104), .A0N(\Memory[0][0] ), .A1N(n11), .Y(
        n22) );
  OAI2BB2X1M U20 ( .B0(n11), .B1(n105), .A0N(\Memory[0][1] ), .A1N(n11), .Y(
        n23) );
  OAI2BB2X1M U21 ( .B0(n11), .B1(n106), .A0N(\Memory[0][2] ), .A1N(n11), .Y(
        n24) );
  OAI2BB2X1M U22 ( .B0(n11), .B1(n107), .A0N(\Memory[0][3] ), .A1N(n11), .Y(
        n25) );
  OAI2BB2X1M U23 ( .B0(n11), .B1(n108), .A0N(\Memory[0][4] ), .A1N(n11), .Y(
        n26) );
  OAI2BB2X1M U24 ( .B0(n11), .B1(n109), .A0N(\Memory[0][5] ), .A1N(n11), .Y(
        n27) );
  OAI2BB2X1M U25 ( .B0(n11), .B1(n110), .A0N(\Memory[0][6] ), .A1N(n11), .Y(
        n28) );
  OAI2BB2X1M U26 ( .B0(n11), .B1(n111), .A0N(\Memory[0][7] ), .A1N(n11), .Y(
        n29) );
  OAI2BB2X1M U27 ( .B0(n104), .B1(n15), .A0N(\Memory[3][0] ), .A1N(n15), .Y(
        n46) );
  OAI2BB2X1M U28 ( .B0(n105), .B1(n15), .A0N(\Memory[3][1] ), .A1N(n15), .Y(
        n47) );
  OAI2BB2X1M U29 ( .B0(n106), .B1(n15), .A0N(\Memory[3][2] ), .A1N(n15), .Y(
        n48) );
  OAI2BB2X1M U30 ( .B0(n107), .B1(n15), .A0N(\Memory[3][3] ), .A1N(n15), .Y(
        n49) );
  OAI2BB2X1M U31 ( .B0(n108), .B1(n15), .A0N(\Memory[3][4] ), .A1N(n15), .Y(
        n50) );
  OAI2BB2X1M U32 ( .B0(n109), .B1(n15), .A0N(\Memory[3][5] ), .A1N(n15), .Y(
        n51) );
  OAI2BB2X1M U33 ( .B0(n110), .B1(n15), .A0N(\Memory[3][6] ), .A1N(n15), .Y(
        n52) );
  OAI2BB2X1M U34 ( .B0(n111), .B1(n15), .A0N(\Memory[3][7] ), .A1N(n15), .Y(
        n53) );
  OAI2BB2X1M U35 ( .B0(n104), .B1(n13), .A0N(\Memory[1][0] ), .A1N(n13), .Y(
        n30) );
  OAI2BB2X1M U36 ( .B0(n105), .B1(n13), .A0N(\Memory[1][1] ), .A1N(n13), .Y(
        n31) );
  OAI2BB2X1M U37 ( .B0(n106), .B1(n13), .A0N(\Memory[1][2] ), .A1N(n13), .Y(
        n32) );
  OAI2BB2X1M U38 ( .B0(n107), .B1(n13), .A0N(\Memory[1][3] ), .A1N(n13), .Y(
        n33) );
  OAI2BB2X1M U39 ( .B0(n108), .B1(n13), .A0N(\Memory[1][4] ), .A1N(n13), .Y(
        n34) );
  OAI2BB2X1M U40 ( .B0(n109), .B1(n13), .A0N(\Memory[1][5] ), .A1N(n13), .Y(
        n35) );
  OAI2BB2X1M U41 ( .B0(n110), .B1(n13), .A0N(\Memory[1][6] ), .A1N(n13), .Y(
        n36) );
  OAI2BB2X1M U42 ( .B0(n111), .B1(n13), .A0N(\Memory[1][7] ), .A1N(n13), .Y(
        n37) );
  OAI2BB2X1M U43 ( .B0(n104), .B1(n17), .A0N(\Memory[4][0] ), .A1N(n17), .Y(
        n54) );
  OAI2BB2X1M U44 ( .B0(n105), .B1(n17), .A0N(\Memory[4][1] ), .A1N(n17), .Y(
        n55) );
  OAI2BB2X1M U45 ( .B0(n106), .B1(n17), .A0N(\Memory[4][2] ), .A1N(n17), .Y(
        n56) );
  OAI2BB2X1M U46 ( .B0(n107), .B1(n17), .A0N(\Memory[4][3] ), .A1N(n17), .Y(
        n57) );
  OAI2BB2X1M U47 ( .B0(n108), .B1(n17), .A0N(\Memory[4][4] ), .A1N(n17), .Y(
        n58) );
  OAI2BB2X1M U48 ( .B0(n109), .B1(n17), .A0N(\Memory[4][5] ), .A1N(n17), .Y(
        n59) );
  OAI2BB2X1M U49 ( .B0(n110), .B1(n17), .A0N(\Memory[4][6] ), .A1N(n17), .Y(
        n60) );
  OAI2BB2X1M U50 ( .B0(n111), .B1(n17), .A0N(\Memory[4][7] ), .A1N(n17), .Y(
        n61) );
  OAI2BB2X1M U51 ( .B0(n104), .B1(n96), .A0N(\Memory[2][0] ), .A1N(n96), .Y(
        n38) );
  OAI2BB2X1M U52 ( .B0(n105), .B1(n96), .A0N(\Memory[2][1] ), .A1N(n96), .Y(
        n39) );
  OAI2BB2X1M U53 ( .B0(n106), .B1(n96), .A0N(\Memory[2][2] ), .A1N(n96), .Y(
        n40) );
  OAI2BB2X1M U54 ( .B0(n107), .B1(n96), .A0N(\Memory[2][3] ), .A1N(n96), .Y(
        n41) );
  OAI2BB2X1M U55 ( .B0(n108), .B1(n96), .A0N(\Memory[2][4] ), .A1N(n96), .Y(
        n42) );
  OAI2BB2X1M U56 ( .B0(n109), .B1(n96), .A0N(\Memory[2][5] ), .A1N(n96), .Y(
        n43) );
  OAI2BB2X1M U57 ( .B0(n110), .B1(n96), .A0N(\Memory[2][6] ), .A1N(n96), .Y(
        n44) );
  OAI2BB2X1M U58 ( .B0(n111), .B1(n96), .A0N(\Memory[2][7] ), .A1N(n96), .Y(
        n45) );
  OAI2BB2X1M U59 ( .B0(n104), .B1(n95), .A0N(\Memory[5][0] ), .A1N(n95), .Y(
        n62) );
  OAI2BB2X1M U60 ( .B0(n105), .B1(n95), .A0N(\Memory[5][1] ), .A1N(n95), .Y(
        n63) );
  OAI2BB2X1M U61 ( .B0(n106), .B1(n95), .A0N(\Memory[5][2] ), .A1N(n95), .Y(
        n64) );
  OAI2BB2X1M U62 ( .B0(n107), .B1(n95), .A0N(\Memory[5][3] ), .A1N(n95), .Y(
        n65) );
  OAI2BB2X1M U63 ( .B0(n108), .B1(n95), .A0N(\Memory[5][4] ), .A1N(n95), .Y(
        n66) );
  OAI2BB2X1M U64 ( .B0(n109), .B1(n95), .A0N(\Memory[5][5] ), .A1N(n95), .Y(
        n67) );
  OAI2BB2X1M U65 ( .B0(n110), .B1(n95), .A0N(\Memory[5][6] ), .A1N(n95), .Y(
        n68) );
  OAI2BB2X1M U66 ( .B0(n111), .B1(n95), .A0N(\Memory[5][7] ), .A1N(n95), .Y(
        n69) );
  OAI2BB2X1M U67 ( .B0(n104), .B1(n94), .A0N(\Memory[6][0] ), .A1N(n94), .Y(
        n70) );
  OAI2BB2X1M U68 ( .B0(n105), .B1(n94), .A0N(\Memory[6][1] ), .A1N(n94), .Y(
        n71) );
  OAI2BB2X1M U69 ( .B0(n106), .B1(n94), .A0N(\Memory[6][2] ), .A1N(n94), .Y(
        n72) );
  OAI2BB2X1M U70 ( .B0(n107), .B1(n94), .A0N(\Memory[6][3] ), .A1N(n94), .Y(
        n73) );
  OAI2BB2X1M U71 ( .B0(n108), .B1(n94), .A0N(\Memory[6][4] ), .A1N(n94), .Y(
        n74) );
  OAI2BB2X1M U72 ( .B0(n109), .B1(n94), .A0N(\Memory[6][5] ), .A1N(n94), .Y(
        n75) );
  OAI2BB2X1M U73 ( .B0(n110), .B1(n94), .A0N(\Memory[6][6] ), .A1N(n94), .Y(
        n76) );
  OAI2BB2X1M U74 ( .B0(n111), .B1(n94), .A0N(\Memory[6][7] ), .A1N(n94), .Y(
        n77) );
  OAI2BB2X1M U75 ( .B0(n104), .B1(n93), .A0N(\Memory[7][0] ), .A1N(n93), .Y(
        n78) );
  OAI2BB2X1M U76 ( .B0(n105), .B1(n93), .A0N(\Memory[7][1] ), .A1N(n93), .Y(
        n79) );
  OAI2BB2X1M U77 ( .B0(n106), .B1(n93), .A0N(\Memory[7][2] ), .A1N(n93), .Y(
        n80) );
  OAI2BB2X1M U78 ( .B0(n107), .B1(n93), .A0N(\Memory[7][3] ), .A1N(n93), .Y(
        n81) );
  OAI2BB2X1M U79 ( .B0(n108), .B1(n93), .A0N(\Memory[7][4] ), .A1N(n93), .Y(
        n82) );
  OAI2BB2X1M U80 ( .B0(n109), .B1(n93), .A0N(\Memory[7][5] ), .A1N(n93), .Y(
        n83) );
  OAI2BB2X1M U81 ( .B0(n110), .B1(n93), .A0N(\Memory[7][6] ), .A1N(n93), .Y(
        n84) );
  OAI2BB2X1M U82 ( .B0(n111), .B1(n93), .A0N(\Memory[7][7] ), .A1N(n93), .Y(
        n85) );
  AND2X2M U83 ( .A(w_address[2]), .B(n16), .Y(n18) );
  NAND3X2M U84 ( .A(n12), .B(n112), .C(w_address[1]), .Y(n14) );
  NAND3X2M U85 ( .A(w_address[1]), .B(w_address[0]), .C(n18), .Y(n21) );
  NAND3X2M U86 ( .A(w_address[0]), .B(n113), .C(n18), .Y(n19) );
  NAND3X2M U87 ( .A(w_address[1]), .B(n112), .C(n18), .Y(n20) );
  INVX2M U88 ( .A(w_data[0]), .Y(n104) );
  INVX2M U89 ( .A(w_data[1]), .Y(n105) );
  INVX2M U90 ( .A(w_data[2]), .Y(n106) );
  INVX2M U91 ( .A(w_data[3]), .Y(n107) );
  INVX2M U92 ( .A(w_data[4]), .Y(n108) );
  INVX2M U93 ( .A(w_data[5]), .Y(n109) );
  INVX2M U94 ( .A(w_data[6]), .Y(n110) );
  INVX2M U95 ( .A(w_data[7]), .Y(n111) );
  INVX2M U96 ( .A(w_address[1]), .Y(n113) );
  INVX2M U97 ( .A(w_address[0]), .Y(n112) );
  BUFX4M U98 ( .A(N10), .Y(n92) );
  MX2X2M U99 ( .A(n89), .B(n88), .S0(N12), .Y(r_data[6]) );
  MX4X1M U100 ( .A(\Memory[4][6] ), .B(\Memory[5][6] ), .C(\Memory[6][6] ), 
        .D(\Memory[7][6] ), .S0(n92), .S1(N11), .Y(n88) );
  MX4X1M U101 ( .A(\Memory[0][6] ), .B(\Memory[1][6] ), .C(\Memory[2][6] ), 
        .D(\Memory[3][6] ), .S0(n92), .S1(N11), .Y(n89) );
  MX2X2M U102 ( .A(n6), .B(n5), .S0(N12), .Y(r_data[2]) );
  MX4X1M U103 ( .A(\Memory[4][2] ), .B(\Memory[5][2] ), .C(\Memory[6][2] ), 
        .D(\Memory[7][2] ), .S0(n92), .S1(N11), .Y(n5) );
  MX4X1M U104 ( .A(\Memory[0][2] ), .B(\Memory[1][2] ), .C(\Memory[2][2] ), 
        .D(\Memory[3][2] ), .S0(n92), .S1(N11), .Y(n6) );
  MX2X2M U105 ( .A(n2), .B(n1), .S0(N12), .Y(r_data[0]) );
  MX4X1M U106 ( .A(\Memory[4][0] ), .B(\Memory[5][0] ), .C(\Memory[6][0] ), 
        .D(\Memory[7][0] ), .S0(n92), .S1(N11), .Y(n1) );
  MX4X1M U107 ( .A(\Memory[0][0] ), .B(\Memory[1][0] ), .C(\Memory[2][0] ), 
        .D(\Memory[3][0] ), .S0(n92), .S1(N11), .Y(n2) );
  MX2X2M U108 ( .A(n10), .B(n9), .S0(N12), .Y(r_data[4]) );
  MX4X1M U109 ( .A(\Memory[4][4] ), .B(\Memory[5][4] ), .C(\Memory[6][4] ), 
        .D(\Memory[7][4] ), .S0(n92), .S1(N11), .Y(n9) );
  MX4X1M U110 ( .A(\Memory[0][4] ), .B(\Memory[1][4] ), .C(\Memory[2][4] ), 
        .D(\Memory[3][4] ), .S0(n92), .S1(N11), .Y(n10) );
  MX2X2M U111 ( .A(n87), .B(n86), .S0(N12), .Y(r_data[5]) );
  MX4X1M U112 ( .A(\Memory[4][5] ), .B(\Memory[5][5] ), .C(\Memory[6][5] ), 
        .D(\Memory[7][5] ), .S0(n92), .S1(N11), .Y(n86) );
  MX4X1M U113 ( .A(\Memory[0][5] ), .B(\Memory[1][5] ), .C(\Memory[2][5] ), 
        .D(\Memory[3][5] ), .S0(n92), .S1(N11), .Y(n87) );
  MX2X2M U114 ( .A(n4), .B(n3), .S0(N12), .Y(r_data[1]) );
  MX4X1M U115 ( .A(\Memory[4][1] ), .B(\Memory[5][1] ), .C(\Memory[6][1] ), 
        .D(\Memory[7][1] ), .S0(n92), .S1(N11), .Y(n3) );
  MX4X1M U116 ( .A(\Memory[0][1] ), .B(\Memory[1][1] ), .C(\Memory[2][1] ), 
        .D(\Memory[3][1] ), .S0(n92), .S1(N11), .Y(n4) );
  MX2X2M U117 ( .A(n91), .B(n90), .S0(N12), .Y(r_data[7]) );
  MX4X1M U118 ( .A(\Memory[4][7] ), .B(\Memory[5][7] ), .C(\Memory[6][7] ), 
        .D(\Memory[7][7] ), .S0(n92), .S1(N11), .Y(n90) );
  MX4X1M U119 ( .A(\Memory[0][7] ), .B(\Memory[1][7] ), .C(\Memory[2][7] ), 
        .D(\Memory[3][7] ), .S0(n92), .S1(N11), .Y(n91) );
  MX2X2M U120 ( .A(n8), .B(n7), .S0(N12), .Y(r_data[3]) );
  MX4X1M U121 ( .A(\Memory[4][3] ), .B(\Memory[5][3] ), .C(\Memory[6][3] ), 
        .D(\Memory[7][3] ), .S0(n92), .S1(N11), .Y(n7) );
  MX4X1M U122 ( .A(\Memory[0][3] ), .B(\Memory[1][3] ), .C(\Memory[2][3] ), 
        .D(\Memory[3][3] ), .S0(n92), .S1(N11), .Y(n8) );
endmodule


module fifo_top_width8 ( W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC, WR_DATA, 
        RD_DATA, FULL, EMPTY );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC;
  output FULL, EMPTY;
  wire   n1, n2, n3, n4;
  wire   [3:0] rptr_s;
  wire   [2:0] w_address;
  wire   [3:0] wptr;
  wire   [3:0] rptr;
  wire   [3:0] wptr_s;
  wire   [2:0] r_address;

  fifo_wptr_full Write_Full ( .w_inc(W_INC), .CLK(W_CLK), .RST(n3), 
        .r_ptr_syncronized(rptr_s), .w_address(w_address), .w_ptr(wptr), 
        .w_full(FULL) );
  data_sync_fifo_0 Data_Sync_Write_Block ( .insertion(rptr), .out(rptr_s), 
        .CLK(W_CLK), .RST(n3) );
  fifo_rptr_empty Read_Empty ( .r_inc(R_INC), .CLK(R_CLK), .RST(n1), 
        .w_ptr_syncronized(wptr_s), .r_address(r_address), .r_ptr(rptr), 
        .r_empty(EMPTY) );
  data_sync_fifo_1 Data_Sync_Read_Block ( .insertion(wptr), .out(wptr_s), 
        .CLK(R_CLK), .RST(n1) );
  fifo_memory_data_width8 Memory ( .w_data(WR_DATA), .full(FULL), .w_inc(W_INC), .CLK(W_CLK), .RST(n3), .w_address(w_address), .r_address(r_address), 
        .r_data(RD_DATA) );
  INVX2M U1 ( .A(n4), .Y(n3) );
  INVX2M U2 ( .A(W_RST), .Y(n4) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(R_RST), .Y(n2) );
endmodule


module PULSE_GEN ( clk, rst, lvl_sig, pulse_sig );
  input clk, rst, lvl_sig;
  output pulse_sig;
  wire   pls_flop, rcv_flop;

  DFFRQX2M rcv_flop_reg ( .D(lvl_sig), .CK(clk), .RN(rst), .Q(rcv_flop) );
  DFFRQX2M pls_flop_reg ( .D(rcv_flop), .CK(clk), .RN(rst), .Q(pls_flop) );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
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


module ClkDiv_0 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;

  ClkDiv_0_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFRQX2M div_clk_reg ( .D(n18), .CK(i_ref_clk), .RN(i_rst), .Q(div_clk) );
  DFFSQX2M odd_edge_tog_reg ( .D(n17), .CK(i_ref_clk), .SN(i_rst), .Q(
        odd_edge_tog) );
  DFFRQX2M \count_reg[5]  ( .D(n20), .CK(i_ref_clk), .RN(i_rst), .Q(count[5])
         );
  DFFRQX2M \count_reg[4]  ( .D(n21), .CK(i_ref_clk), .RN(i_rst), .Q(count[4])
         );
  DFFRQX2M \count_reg[3]  ( .D(n22), .CK(i_ref_clk), .RN(i_rst), .Q(count[3])
         );
  DFFRQX2M \count_reg[6]  ( .D(n19), .CK(i_ref_clk), .RN(i_rst), .Q(count[6])
         );
  DFFRQX2M \count_reg[0]  ( .D(n25), .CK(i_ref_clk), .RN(i_rst), .Q(count[0])
         );
  DFFRQX2M \count_reg[2]  ( .D(n23), .CK(i_ref_clk), .RN(i_rst), .Q(count[2])
         );
  DFFRQX2M \count_reg[1]  ( .D(n24), .CK(i_ref_clk), .RN(i_rst), .Q(count[1])
         );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  OR2X2M U4 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n1) );
  NAND2BX2M U5 ( .AN(n41), .B(i_clk_en), .Y(n7) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n6) );
  CLKINVX1M U7 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U16 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U18 ( .A0(n7), .A1(count[0]), .B0(N16), .B1(n8), .Y(n25) );
  AO22X1M U19 ( .A0(n7), .A1(count[1]), .B0(N17), .B1(n8), .Y(n24) );
  AO22X1M U20 ( .A0(n7), .A1(count[2]), .B0(N18), .B1(n8), .Y(n23) );
  AO22X1M U21 ( .A0(n7), .A1(count[3]), .B0(N19), .B1(n8), .Y(n22) );
  AO22X1M U22 ( .A0(n7), .A1(count[4]), .B0(N20), .B1(n8), .Y(n21) );
  AO22X1M U23 ( .A0(n7), .A1(count[5]), .B0(N21), .B1(n8), .Y(n20) );
  AO22X1M U24 ( .A0(n7), .A1(count[6]), .B0(N22), .B1(n8), .Y(n19) );
  AND3X1M U25 ( .A(n9), .B(n10), .C(N2), .Y(n8) );
  CLKXOR2X2M U26 ( .A(div_clk), .B(n11), .Y(n18) );
  AOI21X1M U27 ( .A0(n10), .A1(n9), .B0(n7), .Y(n11) );
  OR2X1M U28 ( .A(n12), .B(i_div_ratio[0]), .Y(n9) );
  XNOR2X1M U29 ( .A(odd_edge_tog), .B(n13), .Y(n17) );
  OR2X1M U30 ( .A(n10), .B(n7), .Y(n13) );
  CLKNAND2X2M U31 ( .A(n14), .B(i_div_ratio[0]), .Y(n10) );
  MXI2X1M U32 ( .A(n15), .B(n12), .S0(odd_edge_tog), .Y(n14) );
  NAND4X1M U33 ( .A(n16), .B(n26), .C(n27), .D(n28), .Y(n12) );
  NOR4X1M U34 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n28) );
  CLKXOR2X2M U35 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n32) );
  CLKXOR2X2M U36 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n31) );
  CLKXOR2X2M U37 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n29) );
  XNOR2X1M U39 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n27) );
  XNOR2X1M U40 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n26) );
  XNOR2X1M U41 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n16) );
  NAND4X1M U42 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n15) );
  NOR4X1M U43 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n36) );
  CLKXOR2X2M U44 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n40) );
  CLKXOR2X2M U45 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n39) );
  CLKXOR2X2M U46 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n37) );
  XNOR2X1M U48 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n35) );
  XNOR2X1M U49 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n34) );
  XNOR2X1M U50 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n33) );
  CLKINVX1M U51 ( .A(n7), .Y(N2) );
  NOR4BX1M U52 ( .AN(n42), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n41) );
  NOR4X1M U53 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n42) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
  INVX2M U11 ( .A(IN[2]), .Y(n15) );
  NAND4BX1M U12 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n16), .Y(n6) );
  NAND4BX1M U13 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n16), .Y(n7) );
  INVX2M U14 ( .A(IN[1]), .Y(n14) );
  NOR3X2M U15 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NOR3X2M U16 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  NOR4X1M U17 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U18 ( .A(n17), .B(n14), .C(IN[2]), .Y(n5) );
  OAI211X2M U19 ( .A0(n8), .A1(n9), .B0(n17), .C0(n14), .Y(OUT[0]) );
  NAND2X2M U20 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U21 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  INVX2M U22 ( .A(IN[0]), .Y(n17) );
  INVX2M U23 ( .A(IN[5]), .Y(n16) );
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


module ClkDiv_1 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;

  ClkDiv_1_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFRQX2M div_clk_reg ( .D(n50), .CK(i_ref_clk), .RN(i_rst), .Q(div_clk) );
  DFFSQX2M odd_edge_tog_reg ( .D(n51), .CK(i_ref_clk), .SN(i_rst), .Q(
        odd_edge_tog) );
  DFFRQX2M \count_reg[5]  ( .D(n48), .CK(i_ref_clk), .RN(i_rst), .Q(count[5])
         );
  DFFRQX2M \count_reg[4]  ( .D(n47), .CK(i_ref_clk), .RN(i_rst), .Q(count[4])
         );
  DFFRQX2M \count_reg[3]  ( .D(n46), .CK(i_ref_clk), .RN(i_rst), .Q(count[3])
         );
  DFFRQX2M \count_reg[6]  ( .D(n49), .CK(i_ref_clk), .RN(i_rst), .Q(count[6])
         );
  DFFRQX2M \count_reg[0]  ( .D(n43), .CK(i_ref_clk), .RN(i_rst), .Q(count[0])
         );
  DFFRQX2M \count_reg[2]  ( .D(n45), .CK(i_ref_clk), .RN(i_rst), .Q(count[2])
         );
  DFFRQX2M \count_reg[1]  ( .D(n44), .CK(i_ref_clk), .RN(i_rst), .Q(count[1])
         );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  OR2X2M U4 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n1) );
  NAND2BX2M U5 ( .AN(n41), .B(i_clk_en), .Y(n7) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n6) );
  CLKINVX1M U7 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U16 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U18 ( .A0(n7), .A1(count[0]), .B0(N16), .B1(n8), .Y(n43) );
  AO22X1M U19 ( .A0(n7), .A1(count[1]), .B0(N17), .B1(n8), .Y(n44) );
  AO22X1M U20 ( .A0(n7), .A1(count[2]), .B0(N18), .B1(n8), .Y(n45) );
  AO22X1M U21 ( .A0(n7), .A1(count[3]), .B0(N19), .B1(n8), .Y(n46) );
  AO22X1M U22 ( .A0(n7), .A1(count[4]), .B0(N20), .B1(n8), .Y(n47) );
  AO22X1M U23 ( .A0(n7), .A1(count[5]), .B0(N21), .B1(n8), .Y(n48) );
  AO22X1M U24 ( .A0(n7), .A1(count[6]), .B0(N22), .B1(n8), .Y(n49) );
  AND3X1M U25 ( .A(n9), .B(n10), .C(N2), .Y(n8) );
  CLKXOR2X2M U26 ( .A(div_clk), .B(n11), .Y(n50) );
  AOI21X1M U27 ( .A0(n10), .A1(n9), .B0(n7), .Y(n11) );
  OR2X1M U28 ( .A(n12), .B(i_div_ratio[0]), .Y(n9) );
  XNOR2X1M U29 ( .A(odd_edge_tog), .B(n13), .Y(n51) );
  OR2X1M U30 ( .A(n10), .B(n7), .Y(n13) );
  CLKNAND2X2M U31 ( .A(n14), .B(i_div_ratio[0]), .Y(n10) );
  MXI2X1M U32 ( .A(n15), .B(n12), .S0(odd_edge_tog), .Y(n14) );
  NAND4X1M U33 ( .A(n16), .B(n26), .C(n27), .D(n28), .Y(n12) );
  NOR4X1M U34 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n28) );
  CLKXOR2X2M U35 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n32) );
  CLKXOR2X2M U36 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n31) );
  CLKXOR2X2M U37 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n29) );
  XNOR2X1M U39 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n27) );
  XNOR2X1M U40 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n26) );
  XNOR2X1M U41 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n16) );
  NAND4X1M U42 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n15) );
  NOR4X1M U43 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n36) );
  CLKXOR2X2M U44 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n40) );
  CLKXOR2X2M U45 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n39) );
  CLKXOR2X2M U46 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n37) );
  XNOR2X1M U48 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n35) );
  XNOR2X1M U49 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n34) );
  XNOR2X1M U50 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n33) );
  CLKINVX1M U51 ( .A(n7), .Y(N2) );
  NOR4BX1M U52 ( .AN(n42), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n41) );
  NOR4X1M U53 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n42) );
endmodule


module start_check ( start_check_en, CLK, RST, rst_all, start_bit, 
        start_glitch );
  input start_check_en, CLK, RST, rst_all, start_bit;
  output start_glitch;
  wire   n2, n3, n1;

  DFFRQX2M start_glitch_reg ( .D(n3), .CK(CLK), .RN(RST), .Q(start_glitch) );
  NOR2BX2M U3 ( .AN(rst_all), .B(n2), .Y(n3) );
  AOI22X1M U4 ( .A0(start_check_en), .A1(start_bit), .B0(start_glitch), .B1(n1), .Y(n2) );
  INVX2M U5 ( .A(start_check_en), .Y(n1) );
endmodule


module stop_check ( stop_check_en, CLK, RST, rst_all, stop_bit, stop_error );
  input stop_check_en, CLK, RST, rst_all, stop_bit;
  output stop_error;
  wire   n2, n3, n1;

  DFFRHQX8M stop_error_reg ( .D(n3), .CK(CLK), .RN(RST), .Q(stop_error) );
  NOR2BX2M U2 ( .AN(rst_all), .B(n2), .Y(n3) );
  AOI2BB2XLM U3 ( .B0(stop_error), .B1(n1), .A0N(stop_bit), .A1N(n1), .Y(n2)
         );
  INVX2M U4 ( .A(stop_check_en), .Y(n1) );
endmodule


module FSM_RX ( RX_IN, CLK, RST, PAR_EN, par_error, strt_glitch, stp_error, 
        bit_count, edge_count, prescale, data_sample_en, par_chk_en, 
        strt_chk_en, stp_chk_en, data_valid, deser_en, enable, rst_all );
  input [3:0] bit_count;
  input [4:0] edge_count;
  input [5:0] prescale;
  input RX_IN, CLK, RST, PAR_EN, par_error, strt_glitch, stp_error;
  output data_sample_en, par_chk_en, strt_chk_en, stp_chk_en, data_valid,
         deser_en, enable, rst_all;
  wire   N51, N52, N53, N54, N55, N56, N57, N62, N63, N69, N70, N71, N72, N73,
         N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87, N88,
         N178, N179, N180, N181, N182, N183, N193, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, \r175/A[5] , \r173/carry[2] , \r173/carry[3] ,
         \r173/carry[4] , \r171/carry[4] , \r171/carry[3] , \r169/carry[4] ,
         \r169/carry[3] , \add_169/carry[4] , \add_169/carry[3] ,
         \add_169/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117;
  wire   [5:0] PRE_SCALE;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign PRE_SCALE[4] = prescale[4];
  assign PRE_SCALE[3] = prescale[3];
  assign PRE_SCALE[2] = prescale[2];
  assign PRE_SCALE[0] = prescale[0];
  assign N57 = prescale[1];

  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  INVX2M U3 ( .A(N54), .Y(n22) );
  NOR3X2M U4 ( .A(current_state[1]), .B(current_state[2]), .C(n112), .Y(n70)
         );
  NOR4X1M U5 ( .A(PRE_SCALE[0]), .B(N57), .C(PRE_SCALE[2]), .D(PRE_SCALE[4]), 
        .Y(n99) );
  INVX2M U6 ( .A(N53), .Y(n21) );
  INVX2M U7 ( .A(N52), .Y(n20) );
  ADDHX1M U8 ( .A(PRE_SCALE[2]), .B(N57), .CO(\add_169/carry[2] ), .S(N178) );
  ADDHX1M U9 ( .A(PRE_SCALE[4]), .B(\add_169/carry[3] ), .CO(
        \add_169/carry[4] ), .S(N180) );
  ADDHX1M U10 ( .A(PRE_SCALE[3]), .B(\add_169/carry[2] ), .CO(
        \add_169/carry[3] ), .S(N179) );
  XNOR2X2M U11 ( .A(PRE_SCALE[3]), .B(PRE_SCALE[2]), .Y(n1) );
  XNOR2X2M U12 ( .A(PRE_SCALE[4]), .B(\r169/carry[3] ), .Y(n2) );
  INVX2M U13 ( .A(n73), .Y(n113) );
  INVX2M U14 ( .A(n72), .Y(enable) );
  XNOR2X2M U15 ( .A(\r175/A[5] ), .B(\r169/carry[4] ), .Y(n3) );
  INVX2M U16 ( .A(N57), .Y(n5) );
  INVX2M U17 ( .A(PRE_SCALE[2]), .Y(n6) );
  NOR3BX2M U18 ( .AN(n86), .B(n69), .C(n81), .Y(deser_en) );
  INVX2M U19 ( .A(N80), .Y(n69) );
  NAND2X2M U20 ( .A(N88), .B(N183), .Y(n88) );
  INVX2M U21 ( .A(N88), .Y(n109) );
  AOI21X2M U22 ( .A0(n102), .A1(n103), .B0(N56), .Y(data_sample_en) );
  OAI2BB1X2M U23 ( .A0N(n76), .A1N(n91), .B0(n82), .Y(n103) );
  OAI21X2M U24 ( .A0(N193), .A1(n88), .B0(n113), .Y(n102) );
  INVX2M U25 ( .A(edge_count[1]), .Y(n4) );
  NAND3X2M U26 ( .A(n114), .B(n86), .C(N80), .Y(n71) );
  NOR4BX1M U27 ( .AN(N193), .B(n73), .C(n74), .D(n108), .Y(par_chk_en) );
  NAND2X2M U28 ( .A(n107), .B(n109), .Y(n74) );
  NOR2X2M U29 ( .A(n82), .B(N56), .Y(n86) );
  INVX2M U30 ( .A(N56), .Y(n107) );
  OAI21X2M U31 ( .A0(n87), .A1(n71), .B0(n97), .Y(n93) );
  NAND4XLM U32 ( .A(N88), .B(n114), .C(n86), .D(n69), .Y(n97) );
  INVX2M U33 ( .A(N183), .Y(n108) );
  NAND2BX2M U34 ( .AN(N73), .B(N63), .Y(n82) );
  NOR4X1M U35 ( .A(n113), .B(n101), .C(n114), .D(n70), .Y(n72) );
  NAND2X2M U36 ( .A(n72), .B(n115), .Y(rst_all) );
  NAND2X2M U37 ( .A(n105), .B(n115), .Y(n73) );
  INVX2M U38 ( .A(n76), .Y(n114) );
  NOR2X2M U39 ( .A(n70), .B(n110), .Y(n91) );
  INVX2M U40 ( .A(n81), .Y(n110) );
  NOR3X2M U41 ( .A(n116), .B(n112), .C(n115), .Y(data_valid) );
  NOR2X2M U42 ( .A(n87), .B(n111), .Y(n79) );
  NAND2X2M U43 ( .A(n99), .B(n100), .Y(n87) );
  INVX2M U44 ( .A(n100), .Y(\r175/A[5] ) );
  OAI2B2X1M U45 ( .A1N(n70), .A0(n95), .B0(RX_IN), .B1(n96), .Y(n94) );
  AOI31X2M U46 ( .A0(n116), .A1(n115), .A2(n112), .B0(data_valid), .Y(n96) );
  NOR2BX2M U47 ( .AN(strt_glitch), .B(n69), .Y(n95) );
  OAI221X1M U48 ( .A0(n90), .A1(n81), .B0(n86), .B1(n91), .C0(n92), .Y(
        next_state[0]) );
  AOI2B1XLM U49 ( .A1N(n79), .A0(N80), .B0(n98), .Y(n90) );
  AOI2B1X1M U50 ( .A1N(stp_error), .A0(n93), .B0(n94), .Y(n92) );
  AOI21XLM U51 ( .A0(N88), .A1(bit_count[3]), .B0(N80), .Y(n98) );
  OAI21X2M U52 ( .A0(n75), .A1(n76), .B0(n77), .Y(next_state[2]) );
  AOI33XLM U53 ( .A0(n78), .A1(n107), .A2(N88), .B0(n79), .B1(n117), .B2(
        deser_en), .Y(n77) );
  OAI33X2M U54 ( .A0(n108), .A1(par_error), .A2(n73), .B0(n80), .B1(n111), 
        .B2(n81), .Y(n78) );
  NAND3BX2M U55 ( .AN(n82), .B(n69), .C(n117), .Y(n80) );
  OAI32XLM U56 ( .A0(n87), .A1(strt_glitch), .A2(n69), .B0(N80), .B1(n109), 
        .Y(n85) );
  OAI211X2M U57 ( .A0(n75), .A1(n76), .B0(n83), .C0(n84), .Y(next_state[1]) );
  OAI31XLM U58 ( .A0(n106), .A1(N56), .A2(n88), .B0(n113), .Y(n83) );
  AOI31X2M U59 ( .A0(n70), .A1(n85), .A2(n86), .B0(n110), .Y(n84) );
  INVX2M U60 ( .A(par_error), .Y(n106) );
  AND3X2M U61 ( .A(stp_error), .B(n86), .C(n89), .Y(n75) );
  AOI22XLM U62 ( .A0(N80), .A1(n87), .B0(n69), .B1(n109), .Y(n89) );
  ADDHX1M U63 ( .A(\r175/A[5] ), .B(\add_169/carry[4] ), .CO(N182), .S(N181)
         );
  INVX2M U64 ( .A(edge_count[3]), .Y(n24) );
  INVX2M U65 ( .A(edge_count[2]), .Y(n23) );
  INVX2M U66 ( .A(N179), .Y(n31) );
  INVX2M U67 ( .A(N180), .Y(n32) );
  INVX2M U68 ( .A(n71), .Y(stp_chk_en) );
  AND4X2M U69 ( .A(n107), .B(n70), .C(N63), .D(N73), .Y(strt_chk_en) );
  NOR3X2M U70 ( .A(n112), .B(current_state[2]), .C(n116), .Y(n101) );
  NOR2X2M U71 ( .A(n116), .B(current_state[0]), .Y(n105) );
  NAND2X2M U72 ( .A(n101), .B(n104), .Y(n81) );
  OAI31X1M U73 ( .A0(bit_count[0]), .A1(bit_count[2]), .A2(bit_count[1]), .B0(
        bit_count[3]), .Y(n104) );
  NAND2X2M U74 ( .A(current_state[2]), .B(n105), .Y(n76) );
  INVX2M U75 ( .A(current_state[2]), .Y(n115) );
  INVX2M U76 ( .A(current_state[1]), .Y(n116) );
  INVX2M U77 ( .A(current_state[0]), .Y(n112) );
  INVX2M U78 ( .A(edge_count[4]), .Y(n33) );
  INVX2M U79 ( .A(bit_count[3]), .Y(n111) );
  AOI2B1X1M U80 ( .A1N(PRE_SCALE[3]), .A0(n99), .B0(prescale[5]), .Y(n100) );
  OR2X2M U81 ( .A(N57), .B(PRE_SCALE[0]), .Y(n10) );
  INVX2M U82 ( .A(PAR_EN), .Y(n117) );
  AND2X1M U83 ( .A(\r173/carry[4] ), .B(\r175/A[5] ), .Y(N79) );
  CLKXOR2X2M U84 ( .A(\r175/A[5] ), .B(\r173/carry[4] ), .Y(N78) );
  AND2X1M U85 ( .A(\r173/carry[3] ), .B(PRE_SCALE[4]), .Y(\r173/carry[4] ) );
  CLKXOR2X2M U86 ( .A(PRE_SCALE[4]), .B(\r173/carry[3] ), .Y(N77) );
  AND2X1M U87 ( .A(\r173/carry[2] ), .B(PRE_SCALE[3]), .Y(\r173/carry[3] ) );
  CLKXOR2X2M U88 ( .A(PRE_SCALE[3]), .B(\r173/carry[2] ), .Y(N76) );
  OR2X1M U89 ( .A(PRE_SCALE[2]), .B(N57), .Y(\r173/carry[2] ) );
  XNOR2X1M U90 ( .A(N57), .B(PRE_SCALE[2]), .Y(N75) );
  AND2X1M U91 ( .A(\r171/carry[4] ), .B(\r175/A[5] ), .Y(N72) );
  CLKXOR2X2M U92 ( .A(\r175/A[5] ), .B(\r171/carry[4] ), .Y(N71) );
  AND2X1M U93 ( .A(\r171/carry[3] ), .B(PRE_SCALE[4]), .Y(\r171/carry[4] ) );
  CLKXOR2X2M U94 ( .A(PRE_SCALE[4]), .B(\r171/carry[3] ), .Y(N70) );
  AND2X1M U95 ( .A(PRE_SCALE[2]), .B(PRE_SCALE[3]), .Y(\r171/carry[3] ) );
  CLKXOR2X2M U96 ( .A(PRE_SCALE[3]), .B(PRE_SCALE[2]), .Y(N69) );
  AND2X1M U97 ( .A(\r169/carry[4] ), .B(\r175/A[5] ), .Y(N62) );
  AND2X1M U98 ( .A(\r169/carry[3] ), .B(PRE_SCALE[4]), .Y(\r169/carry[4] ) );
  AND2X1M U99 ( .A(PRE_SCALE[2]), .B(PRE_SCALE[3]), .Y(\r169/carry[3] ) );
  NAND2BX1M U100 ( .AN(PRE_SCALE[2]), .B(n5), .Y(n7) );
  OAI2BB1X1M U101 ( .A0N(N57), .A1N(PRE_SCALE[2]), .B0(n7), .Y(N51) );
  OR2X1M U102 ( .A(n7), .B(PRE_SCALE[3]), .Y(n8) );
  OAI2BB1X1M U103 ( .A0N(n7), .A1N(PRE_SCALE[3]), .B0(n8), .Y(N52) );
  XNOR2X1M U104 ( .A(PRE_SCALE[4]), .B(n8), .Y(N53) );
  NOR3X1M U105 ( .A(PRE_SCALE[4]), .B(\r175/A[5] ), .C(n8), .Y(N55) );
  OAI21X1M U106 ( .A0(PRE_SCALE[4]), .A1(n8), .B0(\r175/A[5] ), .Y(n9) );
  NAND2BX1M U107 ( .AN(N55), .B(n9), .Y(N54) );
  CLKINVX1M U108 ( .A(PRE_SCALE[0]), .Y(N81) );
  OAI2BB1X1M U109 ( .A0N(PRE_SCALE[0]), .A1N(N57), .B0(n10), .Y(N82) );
  OR2X1M U110 ( .A(n10), .B(PRE_SCALE[2]), .Y(n11) );
  OAI2BB1X1M U111 ( .A0N(n10), .A1N(PRE_SCALE[2]), .B0(n11), .Y(N83) );
  OR2X1M U112 ( .A(n11), .B(PRE_SCALE[3]), .Y(n12) );
  OAI2BB1X1M U113 ( .A0N(n11), .A1N(PRE_SCALE[3]), .B0(n12), .Y(N84) );
  OR2X1M U114 ( .A(n12), .B(PRE_SCALE[4]), .Y(n13) );
  OAI2BB1X1M U115 ( .A0N(n12), .A1N(PRE_SCALE[4]), .B0(n13), .Y(N85) );
  NOR2X1M U116 ( .A(n13), .B(\r175/A[5] ), .Y(N87) );
  AO21XLM U117 ( .A0(n13), .A1(\r175/A[5] ), .B0(N87), .Y(N86) );
  NAND2BX1M U118 ( .AN(edge_count[0]), .B(n5), .Y(n15) );
  AOI2BB1X1M U119 ( .A0N(n15), .A1N(edge_count[1]), .B0(N51), .Y(n14) );
  AOI221XLM U120 ( .A0(edge_count[2]), .A1(n20), .B0(edge_count[1]), .B1(n15), 
        .C0(n14), .Y(n16) );
  AOI221XLM U121 ( .A0(N53), .A1(n24), .B0(N52), .B1(n23), .C0(n16), .Y(n17)
         );
  AOI221XLM U122 ( .A0(edge_count[4]), .A1(n22), .B0(edge_count[3]), .B1(n21), 
        .C0(n17), .Y(n18) );
  NOR2X1M U123 ( .A(N55), .B(n18), .Y(n19) );
  OAI21X1M U124 ( .A0(edge_count[4]), .A1(n22), .B0(n19), .Y(N56) );
  NAND2BX1M U125 ( .AN(n5), .B(edge_count[0]), .Y(n26) );
  AOI2BB1X1M U126 ( .A0N(n26), .A1N(N178), .B0(edge_count[1]), .Y(n25) );
  AOI221XLM U127 ( .A0(N179), .A1(n23), .B0(N178), .B1(n26), .C0(n25), .Y(n27)
         );
  AOI221XLM U128 ( .A0(edge_count[3]), .A1(n32), .B0(edge_count[2]), .B1(n31), 
        .C0(n27), .Y(n28) );
  AOI221XLM U129 ( .A0(N181), .A1(n33), .B0(N180), .B1(n24), .C0(n28), .Y(n29)
         );
  AOI2B1X1M U130 ( .A1N(N181), .A0(edge_count[4]), .B0(n29), .Y(n30) );
  NOR2X1M U131 ( .A(N182), .B(n30), .Y(N183) );
  CLKNAND2X2M U132 ( .A(edge_count[4]), .B(n3), .Y(n43) );
  CLKNAND2X2M U133 ( .A(edge_count[3]), .B(n2), .Y(n41) );
  NOR2BX1M U134 ( .AN(N57), .B(edge_count[0]), .Y(n35) );
  AO21XLM U135 ( .A0(n4), .A1(n35), .B0(n6), .Y(n34) );
  CLKNAND2X2M U136 ( .A(edge_count[2]), .B(n1), .Y(n42) );
  OAI211X1M U137 ( .A0(n35), .A1(n4), .B0(n34), .C0(n42), .Y(n36) );
  OAI221X1M U138 ( .A0(edge_count[2]), .A1(n1), .B0(edge_count[3]), .B1(n2), 
        .C0(n36), .Y(n37) );
  AOI31X1M U139 ( .A0(n43), .A1(n41), .A2(n37), .B0(N62), .Y(n38) );
  OA21X1M U140 ( .A0(edge_count[4]), .A1(n3), .B0(n38), .Y(N63) );
  NOR2BX1M U141 ( .AN(edge_count[0]), .B(N57), .Y(n39) );
  OAI2B2X1M U142 ( .A1N(n6), .A0(n39), .B0(edge_count[1]), .B1(n39), .Y(n40)
         );
  AND2X1M U143 ( .A(N63), .B(n40), .Y(n44) );
  AND4X1M U144 ( .A(n44), .B(n43), .C(n42), .D(n41), .Y(N193) );
  NOR2BX1M U145 ( .AN(N57), .B(edge_count[0]), .Y(n45) );
  OAI2B2X1M U146 ( .A1N(edge_count[1]), .A0(n45), .B0(n6), .B1(n45), .Y(n48)
         );
  NOR2BX1M U147 ( .AN(edge_count[0]), .B(N57), .Y(n46) );
  OAI2B2X1M U148 ( .A1N(n6), .A0(n46), .B0(edge_count[1]), .B1(n46), .Y(n47)
         );
  NAND3BX1M U149 ( .AN(N72), .B(n48), .C(n47), .Y(n52) );
  CLKXOR2X2M U150 ( .A(N71), .B(edge_count[4]), .Y(n51) );
  CLKXOR2X2M U151 ( .A(N69), .B(edge_count[2]), .Y(n50) );
  CLKXOR2X2M U152 ( .A(N70), .B(edge_count[3]), .Y(n49) );
  NOR4X1M U153 ( .A(n52), .B(n51), .C(n50), .D(n49), .Y(N73) );
  NOR2BX1M U154 ( .AN(n5), .B(edge_count[0]), .Y(n53) );
  OAI2B2X1M U155 ( .A1N(edge_count[1]), .A0(n53), .B0(N75), .B1(n53), .Y(n56)
         );
  NOR2BX1M U156 ( .AN(edge_count[0]), .B(n5), .Y(n54) );
  OAI2B2X1M U157 ( .A1N(N75), .A0(n54), .B0(edge_count[1]), .B1(n54), .Y(n55)
         );
  NAND3BX1M U158 ( .AN(N79), .B(n56), .C(n55), .Y(n60) );
  CLKXOR2X2M U159 ( .A(N78), .B(edge_count[4]), .Y(n59) );
  CLKXOR2X2M U160 ( .A(N76), .B(edge_count[2]), .Y(n58) );
  CLKXOR2X2M U161 ( .A(N77), .B(edge_count[3]), .Y(n57) );
  NOR4X1M U162 ( .A(n60), .B(n59), .C(n58), .D(n57), .Y(N80) );
  NOR2BX1M U163 ( .AN(edge_count[0]), .B(N81), .Y(n61) );
  OAI2B2X1M U164 ( .A1N(N82), .A0(n61), .B0(edge_count[1]), .B1(n61), .Y(n64)
         );
  NOR2BX1M U165 ( .AN(N81), .B(edge_count[0]), .Y(n62) );
  OAI2B2X1M U166 ( .A1N(edge_count[1]), .A0(n62), .B0(N82), .B1(n62), .Y(n63)
         );
  NAND4BBX1M U167 ( .AN(N87), .BN(N86), .C(n64), .D(n63), .Y(n68) );
  CLKXOR2X2M U168 ( .A(N85), .B(edge_count[4]), .Y(n67) );
  CLKXOR2X2M U169 ( .A(N83), .B(edge_count[2]), .Y(n66) );
  CLKXOR2X2M U170 ( .A(N84), .B(edge_count[3]), .Y(n65) );
  NOR4X1M U171 ( .A(n68), .B(n67), .C(n66), .D(n65), .Y(N88) );
endmodule


module edge_bit_counter ( enable, RST, CLK, rst_all, prescale, bit_count, 
        edge_count );
  input [5:0] prescale;
  output [3:0] bit_count;
  output [4:0] edge_count;
  input enable, RST, CLK, rst_all;
  wire   N8, N9, N10, N11, N13, N14, N15, N18, N19, N20, N21, N35, N36, N37,
         N38, N39, N40, N41, N42, N43, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         \add_29/carry[4] , \add_29/carry[3] , \add_29/carry[2] , n1, n2, n3,
         n4, n5, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25;

  DFFRQX2M \bit_count_reg[0]  ( .D(N35), .CK(CLK), .RN(RST), .Q(bit_count[0])
         );
  DFFRQX2M \bit_count_reg[1]  ( .D(N36), .CK(CLK), .RN(RST), .Q(bit_count[1])
         );
  DFFRQX2M \bit_count_reg[2]  ( .D(N37), .CK(CLK), .RN(RST), .Q(bit_count[2])
         );
  DFFRQX2M \bit_count_reg[3]  ( .D(N38), .CK(CLK), .RN(RST), .Q(bit_count[3])
         );
  DFFRQX2M \edge_count_reg[0]  ( .D(N39), .CK(CLK), .RN(RST), .Q(edge_count[0]) );
  DFFRQX2M \edge_count_reg[4]  ( .D(N43), .CK(CLK), .RN(RST), .Q(edge_count[4]) );
  DFFRQX2M \edge_count_reg[1]  ( .D(N40), .CK(CLK), .RN(RST), .Q(edge_count[1]) );
  DFFRQX2M \edge_count_reg[3]  ( .D(N42), .CK(CLK), .RN(RST), .Q(edge_count[3]) );
  DFFRQX2M \edge_count_reg[2]  ( .D(N41), .CK(CLK), .RN(RST), .Q(edge_count[2]) );
  INVX2M U3 ( .A(n7), .Y(n25) );
  NAND2X2M U4 ( .A(rst_all), .B(enable), .Y(n7) );
  AOI21BX2M U5 ( .A0(n4), .A1(prescale[4]), .B0N(n5), .Y(n1) );
  NAND2X2M U6 ( .A(N15), .B(n25), .Y(n6) );
  NOR2BX2M U7 ( .AN(N18), .B(n6), .Y(N40) );
  NOR2BX2M U8 ( .AN(N19), .B(n6), .Y(N41) );
  NOR2BX2M U9 ( .AN(N20), .B(n6), .Y(N42) );
  INVX2M U10 ( .A(N11), .Y(n22) );
  INVX2M U11 ( .A(N10), .Y(n21) );
  NOR2BX2M U12 ( .AN(bit_count[0]), .B(N15), .Y(n12) );
  NOR2X2M U13 ( .A(edge_count[0]), .B(n6), .Y(N39) );
  NAND2X2M U14 ( .A(bit_count[1]), .B(n12), .Y(n10) );
  NOR2X2M U15 ( .A(n7), .B(n14), .Y(N35) );
  CLKXOR2X2M U16 ( .A(bit_count[0]), .B(N15), .Y(n14) );
  NOR2X2M U17 ( .A(n8), .B(n7), .Y(N38) );
  CLKXOR2X2M U18 ( .A(n9), .B(bit_count[3]), .Y(n8) );
  NAND2BX2M U19 ( .AN(n10), .B(bit_count[2]), .Y(n9) );
  NOR2X2M U20 ( .A(n11), .B(n7), .Y(N37) );
  CLKXOR2X2M U21 ( .A(n10), .B(bit_count[2]), .Y(n11) );
  NOR2X2M U22 ( .A(n13), .B(n7), .Y(N36) );
  XNOR2X2M U23 ( .A(n12), .B(bit_count[1]), .Y(n13) );
  INVX2M U24 ( .A(edge_count[3]), .Y(n24) );
  INVX2M U25 ( .A(edge_count[2]), .Y(n23) );
  AND3X2M U26 ( .A(N21), .B(N15), .C(n25), .Y(N43) );
  ADDHX1M U27 ( .A(edge_count[2]), .B(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(N19) );
  ADDHX1M U28 ( .A(edge_count[1]), .B(edge_count[0]), .CO(\add_29/carry[2] ), 
        .S(N18) );
  ADDHX1M U29 ( .A(edge_count[3]), .B(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(N20) );
  OR2X2M U30 ( .A(prescale[1]), .B(prescale[0]), .Y(n2) );
  CLKINVX1M U31 ( .A(prescale[0]), .Y(N8) );
  OAI2BB1X1M U32 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n2), .Y(N9) );
  OR2X1M U33 ( .A(n2), .B(prescale[2]), .Y(n3) );
  OAI2BB1X1M U34 ( .A0N(n2), .A1N(prescale[2]), .B0(n3), .Y(N10) );
  OR2X1M U35 ( .A(n3), .B(prescale[3]), .Y(n4) );
  OAI2BB1X1M U36 ( .A0N(n3), .A1N(prescale[3]), .B0(n4), .Y(N11) );
  OR2X1M U37 ( .A(n4), .B(prescale[4]), .Y(n5) );
  NOR2X1M U38 ( .A(n5), .B(prescale[5]), .Y(N14) );
  AO21XLM U39 ( .A0(n5), .A1(prescale[5]), .B0(N14), .Y(N13) );
  CLKXOR2X2M U40 ( .A(\add_29/carry[4] ), .B(edge_count[4]), .Y(N21) );
  NAND2BX1M U41 ( .AN(edge_count[0]), .B(N8), .Y(n16) );
  AOI2BB1X1M U42 ( .A0N(n16), .A1N(edge_count[1]), .B0(N9), .Y(n15) );
  AOI221XLM U43 ( .A0(edge_count[2]), .A1(n21), .B0(edge_count[1]), .B1(n16), 
        .C0(n15), .Y(n17) );
  AOI221XLM U44 ( .A0(N11), .A1(n24), .B0(N10), .B1(n23), .C0(n17), .Y(n18) );
  AOI221XLM U45 ( .A0(edge_count[4]), .A1(n1), .B0(edge_count[3]), .B1(n22), 
        .C0(n18), .Y(n20) );
  NOR2X1M U46 ( .A(edge_count[4]), .B(n1), .Y(n19) );
  OR4X1M U47 ( .A(n20), .B(n19), .C(N14), .D(N13), .Y(N15) );
endmodule


module data_sampling ( edge_count, data_sample_en, RX_IN, CLK, RST, rst_all, 
        prescale, sampled_bit );
  input [4:0] edge_count;
  input [5:0] prescale;
  input data_sample_en, RX_IN, CLK, RST, rst_all;
  output sampled_bit;
  wire   N14, N15, N16, N17, N18, N19, N20, N22, N23, N24, N25, N26, N27, N47,
         N49, N50, N51, N52, N53, N55, N56, N57, N58, N59, N60, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, \add_51_2/carry[2] ,
         \add_51_2/carry[3] , \add_51_2/carry[4] , \add_51/carry[4] ,
         \add_51/carry[3] , \add_31/carry[4] , \add_31/carry[3] ,
         \add_31/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59;
  wire   [2:0] sampled;
  assign N47 = prescale[1];

  DFFRQX2M \sampled_reg[2]  ( .D(n32), .CK(CLK), .RN(RST), .Q(sampled[2]) );
  DFFRQX2M \sampled_reg[1]  ( .D(n31), .CK(CLK), .RN(RST), .Q(sampled[1]) );
  DFFRQX2M \sampled_reg[0]  ( .D(n30), .CK(CLK), .RN(RST), .Q(sampled[0]) );
  ADDHX1M U3 ( .A(prescale[2]), .B(N47), .CO(\add_31/carry[2] ), .S(N22) );
  INVX2M U4 ( .A(RST), .Y(n3) );
  ADDHX1M U5 ( .A(prescale[3]), .B(\add_31/carry[2] ), .CO(\add_31/carry[3] ), 
        .S(N23) );
  ADDHX1M U6 ( .A(prescale[4]), .B(\add_31/carry[3] ), .CO(\add_31/carry[4] ), 
        .S(N24) );
  INVX2M U7 ( .A(N47), .Y(n1) );
  INVX2M U8 ( .A(prescale[2]), .Y(n2) );
  AND2X2M U9 ( .A(rst_all), .B(data_sample_en), .Y(n26) );
  INVX2M U10 ( .A(N19), .Y(n59) );
  NAND2X2M U11 ( .A(RX_IN), .B(n26), .Y(n25) );
  OAI2BB2X1M U12 ( .B0(n24), .B1(n25), .A0N(sampled[0]), .A1N(n24), .Y(n30) );
  NOR2BX2M U13 ( .AN(n26), .B(N19), .Y(n24) );
  OAI2BB2X1M U14 ( .B0(n28), .B1(n25), .A0N(sampled[2]), .A1N(n28), .Y(n32) );
  AND2X2M U15 ( .A(n26), .B(n29), .Y(n28) );
  NAND3BX2M U16 ( .AN(N20), .B(n59), .C(N27), .Y(n29) );
  OAI2BB2X1M U17 ( .B0(n27), .B1(n25), .A0N(sampled[1]), .A1N(n27), .Y(n31) );
  AOI21BX2M U18 ( .A0(n59), .A1(N20), .B0N(n26), .Y(n27) );
  AOI211X2M U19 ( .A0(n21), .A1(n22), .B0(n23), .C0(n3), .Y(sampled_bit) );
  NAND2X2M U20 ( .A(sampled[1]), .B(sampled[0]), .Y(n21) );
  OAI21X2M U21 ( .A0(sampled[0]), .A1(sampled[1]), .B0(sampled[2]), .Y(n22) );
  NOR2X2M U22 ( .A(N53), .B(N60), .Y(n23) );
  ADDHX1M U23 ( .A(prescale[5]), .B(\add_31/carry[4] ), .CO(N26), .S(N25) );
  AND2X1M U24 ( .A(\add_51_2/carry[4] ), .B(prescale[5]), .Y(N59) );
  CLKXOR2X2M U25 ( .A(prescale[5]), .B(\add_51_2/carry[4] ), .Y(N58) );
  AND2X1M U26 ( .A(\add_51_2/carry[3] ), .B(prescale[4]), .Y(
        \add_51_2/carry[4] ) );
  CLKXOR2X2M U27 ( .A(prescale[4]), .B(\add_51_2/carry[3] ), .Y(N57) );
  AND2X1M U28 ( .A(\add_51_2/carry[2] ), .B(prescale[3]), .Y(
        \add_51_2/carry[3] ) );
  CLKXOR2X2M U29 ( .A(prescale[3]), .B(\add_51_2/carry[2] ), .Y(N56) );
  OR2X1M U30 ( .A(prescale[2]), .B(N47), .Y(\add_51_2/carry[2] ) );
  XNOR2X1M U31 ( .A(N47), .B(prescale[2]), .Y(N55) );
  AND2X1M U32 ( .A(\add_51/carry[4] ), .B(prescale[5]), .Y(N52) );
  CLKXOR2X2M U33 ( .A(prescale[5]), .B(\add_51/carry[4] ), .Y(N51) );
  AND2X1M U34 ( .A(\add_51/carry[3] ), .B(prescale[4]), .Y(\add_51/carry[4] )
         );
  CLKXOR2X2M U35 ( .A(prescale[4]), .B(\add_51/carry[3] ), .Y(N50) );
  AND2X1M U36 ( .A(prescale[2]), .B(prescale[3]), .Y(\add_51/carry[3] ) );
  CLKXOR2X2M U37 ( .A(prescale[3]), .B(prescale[2]), .Y(N49) );
  NAND2BX1M U38 ( .AN(prescale[2]), .B(n1), .Y(n4) );
  OAI2BB1X1M U39 ( .A0N(N47), .A1N(prescale[2]), .B0(n4), .Y(N14) );
  OR2X1M U40 ( .A(n4), .B(prescale[3]), .Y(n5) );
  OAI2BB1X1M U41 ( .A0N(n4), .A1N(prescale[3]), .B0(n5), .Y(N15) );
  XNOR2X1M U42 ( .A(prescale[4]), .B(n5), .Y(N16) );
  NOR3X1M U43 ( .A(prescale[4]), .B(prescale[5]), .C(n5), .Y(N18) );
  OAI21X1M U44 ( .A0(prescale[4]), .A1(n5), .B0(prescale[5]), .Y(n6) );
  NAND2BX1M U45 ( .AN(N18), .B(n6), .Y(N17) );
  NOR2BX1M U46 ( .AN(n1), .B(edge_count[0]), .Y(n7) );
  OAI2B2X1M U47 ( .A1N(edge_count[1]), .A0(n7), .B0(N14), .B1(n7), .Y(n10) );
  NOR2BX1M U48 ( .AN(edge_count[0]), .B(n1), .Y(n8) );
  OAI2B2X1M U49 ( .A1N(N14), .A0(n8), .B0(edge_count[1]), .B1(n8), .Y(n9) );
  NAND3BX1M U50 ( .AN(N18), .B(n10), .C(n9), .Y(n14) );
  CLKXOR2X2M U51 ( .A(N17), .B(edge_count[4]), .Y(n13) );
  CLKXOR2X2M U52 ( .A(N15), .B(edge_count[2]), .Y(n12) );
  CLKXOR2X2M U53 ( .A(N16), .B(edge_count[3]), .Y(n11) );
  NOR4X1M U54 ( .A(n14), .B(n13), .C(n12), .D(n11), .Y(N19) );
  CLKXOR2X2M U55 ( .A(prescale[3]), .B(edge_count[2]), .Y(n34) );
  NOR2BX1M U56 ( .AN(N47), .B(edge_count[0]), .Y(n15) );
  OAI2B2X1M U57 ( .A1N(edge_count[1]), .A0(n15), .B0(prescale[2]), .B1(n15), 
        .Y(n18) );
  NOR2BX1M U58 ( .AN(edge_count[0]), .B(N47), .Y(n16) );
  OAI2B2X1M U59 ( .A1N(prescale[2]), .A0(n16), .B0(edge_count[1]), .B1(n16), 
        .Y(n17) );
  CLKNAND2X2M U60 ( .A(n18), .B(n17), .Y(n33) );
  CLKXOR2X2M U61 ( .A(prescale[4]), .B(edge_count[3]), .Y(n20) );
  CLKXOR2X2M U62 ( .A(prescale[5]), .B(edge_count[4]), .Y(n19) );
  NOR4X1M U63 ( .A(n34), .B(n33), .C(n20), .D(n19), .Y(N20) );
  NOR2BX1M U64 ( .AN(n1), .B(edge_count[0]), .Y(n35) );
  OAI2B2X1M U65 ( .A1N(edge_count[1]), .A0(n35), .B0(N22), .B1(n35), .Y(n38)
         );
  NOR2BX1M U66 ( .AN(edge_count[0]), .B(n1), .Y(n36) );
  OAI2B2X1M U67 ( .A1N(N22), .A0(n36), .B0(edge_count[1]), .B1(n36), .Y(n37)
         );
  NAND3BX1M U68 ( .AN(N26), .B(n38), .C(n37), .Y(n42) );
  CLKXOR2X2M U69 ( .A(N25), .B(edge_count[4]), .Y(n41) );
  CLKXOR2X2M U70 ( .A(N23), .B(edge_count[2]), .Y(n40) );
  CLKXOR2X2M U71 ( .A(N24), .B(edge_count[3]), .Y(n39) );
  NOR4X1M U72 ( .A(n42), .B(n41), .C(n40), .D(n39), .Y(N27) );
  NOR2BX1M U73 ( .AN(N47), .B(edge_count[0]), .Y(n43) );
  OAI2B2X1M U74 ( .A1N(edge_count[1]), .A0(n43), .B0(n2), .B1(n43), .Y(n46) );
  NOR2BX1M U75 ( .AN(edge_count[0]), .B(N47), .Y(n44) );
  OAI2B2X1M U76 ( .A1N(n2), .A0(n44), .B0(edge_count[1]), .B1(n44), .Y(n45) );
  NAND3BX1M U77 ( .AN(N52), .B(n46), .C(n45), .Y(n50) );
  CLKXOR2X2M U78 ( .A(N51), .B(edge_count[4]), .Y(n49) );
  CLKXOR2X2M U79 ( .A(N49), .B(edge_count[2]), .Y(n48) );
  CLKXOR2X2M U80 ( .A(N50), .B(edge_count[3]), .Y(n47) );
  NOR4X1M U81 ( .A(n50), .B(n49), .C(n48), .D(n47), .Y(N53) );
  NOR2BX1M U82 ( .AN(n1), .B(edge_count[0]), .Y(n51) );
  OAI2B2X1M U83 ( .A1N(edge_count[1]), .A0(n51), .B0(N55), .B1(n51), .Y(n54)
         );
  NOR2BX1M U84 ( .AN(edge_count[0]), .B(n1), .Y(n52) );
  OAI2B2X1M U85 ( .A1N(N55), .A0(n52), .B0(edge_count[1]), .B1(n52), .Y(n53)
         );
  NAND3BX1M U86 ( .AN(N59), .B(n54), .C(n53), .Y(n58) );
  CLKXOR2X2M U87 ( .A(N58), .B(edge_count[4]), .Y(n57) );
  CLKXOR2X2M U88 ( .A(N56), .B(edge_count[2]), .Y(n56) );
  CLKXOR2X2M U89 ( .A(N57), .B(edge_count[3]), .Y(n55) );
  NOR4X1M U90 ( .A(n58), .B(n57), .C(n56), .D(n55), .Y(N60) );
endmodule


module deserializer ( sampled_bit, CLK, RST, rst_all, deser_en, P_DATA );
  output [7:0] P_DATA;
  input sampled_bit, CLK, RST, rst_all, deser_en;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [2:0] bit;

  DFFRQX2M \P_DATA_reg[5]  ( .D(n34), .CK(CLK), .RN(RST), .Q(P_DATA[5]) );
  DFFRQX2M \P_DATA_reg[1]  ( .D(n30), .CK(CLK), .RN(RST), .Q(P_DATA[1]) );
  DFFRQX2M \P_DATA_reg[4]  ( .D(n33), .CK(CLK), .RN(RST), .Q(P_DATA[4]) );
  DFFRQX2M \P_DATA_reg[0]  ( .D(n29), .CK(CLK), .RN(RST), .Q(P_DATA[0]) );
  DFFRQX2M \P_DATA_reg[3]  ( .D(n32), .CK(CLK), .RN(RST), .Q(P_DATA[3]) );
  DFFRQX2M \P_DATA_reg[6]  ( .D(n35), .CK(CLK), .RN(RST), .Q(P_DATA[6]) );
  DFFRQX2M \P_DATA_reg[2]  ( .D(n31), .CK(CLK), .RN(RST), .Q(P_DATA[2]) );
  DFFRQX2M \bit_reg[2]  ( .D(n37), .CK(CLK), .RN(RST), .Q(bit[2]) );
  DFFRQX2M \P_DATA_reg[7]  ( .D(n36), .CK(CLK), .RN(RST), .Q(P_DATA[7]) );
  DFFRQX2M \bit_reg[0]  ( .D(n39), .CK(CLK), .RN(RST), .Q(bit[0]) );
  DFFRQX2M \bit_reg[1]  ( .D(n38), .CK(CLK), .RN(RST), .Q(bit[1]) );
  INVX2M U3 ( .A(n15), .Y(n1) );
  NOR2X2M U4 ( .A(n8), .B(n2), .Y(n15) );
  AOI31X2M U5 ( .A0(deser_en), .A1(n11), .A2(n10), .B0(n8), .Y(n25) );
  INVX2M U6 ( .A(deser_en), .Y(n2) );
  NAND2X2M U7 ( .A(rst_all), .B(n1), .Y(n28) );
  INVX2M U8 ( .A(rst_all), .Y(n8) );
  NAND2X2M U9 ( .A(sampled_bit), .B(n15), .Y(n9) );
  OAI221X1M U10 ( .A0(n5), .A1(n17), .B0(n27), .B1(n7), .C0(n20), .Y(n37) );
  NOR2BX2M U11 ( .AN(n28), .B(n23), .Y(n27) );
  OAI21BX1M U12 ( .A0(n5), .A1(n28), .B0N(n23), .Y(n39) );
  OAI2BB2X1M U13 ( .B0(n27), .B1(n6), .A0N(n15), .A1N(n14), .Y(n38) );
  OAI22X1M U14 ( .A0(n6), .A1(n5), .B0(n26), .B1(n7), .Y(n11) );
  CLKXOR2X2M U15 ( .A(n26), .B(n7), .Y(n10) );
  OAI32X1M U16 ( .A0(n9), .A1(n10), .A2(n11), .B0(n8), .B1(n12), .Y(n29) );
  OAI31X1M U17 ( .A0(n2), .A1(n10), .A2(n11), .B0(P_DATA[0]), .Y(n12) );
  OAI31X1M U18 ( .A0(n4), .A1(n3), .A2(n9), .B0(n24), .Y(n36) );
  INVX2M U19 ( .A(n10), .Y(n4) );
  INVX2M U20 ( .A(n11), .Y(n3) );
  NAND2X2M U21 ( .A(n25), .B(P_DATA[7]), .Y(n24) );
  NOR2X2M U22 ( .A(n1), .B(bit[0]), .Y(n23) );
  OAI2BB2X1M U23 ( .B0(n13), .B1(n9), .A0N(P_DATA[1]), .A1N(n13), .Y(n30) );
  AOI31X2M U24 ( .A0(n14), .A1(n7), .A2(n15), .B0(n8), .Y(n13) );
  OAI2BB2X1M U25 ( .B0(n16), .B1(n9), .A0N(P_DATA[2]), .A1N(n16), .Y(n31) );
  AOI2BB1X2M U26 ( .A0N(n17), .A1N(bit[0]), .B0(n8), .Y(n16) );
  OAI2BB2X1M U27 ( .B0(n18), .B1(n9), .A0N(P_DATA[3]), .A1N(n18), .Y(n32) );
  AOI2BB1X2M U28 ( .A0N(n17), .A1N(n5), .B0(n8), .Y(n18) );
  OAI2BB2X1M U29 ( .B0(n19), .B1(n9), .A0N(P_DATA[4]), .A1N(n19), .Y(n33) );
  AOI2BB1X2M U30 ( .A0N(n20), .A1N(bit[0]), .B0(n8), .Y(n19) );
  OAI2BB2X1M U31 ( .B0(n21), .B1(n9), .A0N(P_DATA[5]), .A1N(n21), .Y(n34) );
  AOI2BB1X2M U32 ( .A0N(n20), .A1N(n5), .B0(n8), .Y(n21) );
  OAI2BB2X1M U33 ( .B0(n22), .B1(n9), .A0N(P_DATA[6]), .A1N(n22), .Y(n35) );
  AOI31X2M U34 ( .A0(n23), .A1(bit[1]), .A2(bit[2]), .B0(n8), .Y(n22) );
  NAND3X2M U35 ( .A(bit[1]), .B(n7), .C(n15), .Y(n17) );
  NAND3X2M U36 ( .A(bit[2]), .B(n6), .C(n15), .Y(n20) );
  AOI21X2M U37 ( .A0(n5), .A1(bit[1]), .B0(n14), .Y(n26) );
  NOR2X2M U38 ( .A(n5), .B(bit[1]), .Y(n14) );
  INVX2M U39 ( .A(bit[0]), .Y(n5) );
  INVX2M U40 ( .A(bit[1]), .Y(n6) );
  INVX2M U41 ( .A(bit[2]), .Y(n7) );
endmodule


module parity_check ( Data, CLK, RST, rst_all, par_check_en, par_type, sampled, 
        par_error );
  input [7:0] Data;
  input CLK, RST, rst_all, par_check_en, par_type, sampled;
  output par_error;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n1;

  DFFRHQX8M par_error_reg ( .D(n9), .CK(CLK), .RN(RST), .Q(par_error) );
  XOR3XLM U3 ( .A(Data[5]), .B(Data[4]), .C(n8), .Y(n5) );
  XNOR2X2M U4 ( .A(sampled), .B(Data[6]), .Y(n8) );
  NOR2BX2M U5 ( .AN(rst_all), .B(n2), .Y(n9) );
  AOI22X1M U6 ( .A0(par_check_en), .A1(n3), .B0(par_error), .B1(n1), .Y(n2) );
  XOR3XLM U7 ( .A(n4), .B(n5), .C(n6), .Y(n3) );
  INVX2M U8 ( .A(par_check_en), .Y(n1) );
  XOR3XLM U9 ( .A(Data[1]), .B(Data[0]), .C(n7), .Y(n6) );
  XNOR2X2M U10 ( .A(Data[3]), .B(Data[2]), .Y(n7) );
  CLKXOR2X2M U11 ( .A(par_type), .B(Data[7]), .Y(n4) );
endmodule


module UART_RX ( RX_IN, CLK, RST, PAR_EN, PAR_TYPE, prescale, DATA_VALID, 
        P_DATA, STOP_ERROR, PARITY_ERROR, START_GLITCH );
  input [5:0] prescale;
  output [7:0] P_DATA;
  input RX_IN, CLK, RST, PAR_EN, PAR_TYPE;
  output DATA_VALID, STOP_ERROR, PARITY_ERROR, START_GLITCH;
  wire   start_check_en, rst_all, sampled_bit, stop_check_en, data_sample_en,
         par_chk_en, deser_en, enable, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12;
  wire   [3:0] bit_count;
  wire   [4:0] edge_count;

  start_check Sr ( .start_check_en(start_check_en), .CLK(CLK), .RST(n11), 
        .rst_all(rst_all), .start_bit(sampled_bit), .start_glitch(START_GLITCH) );
  stop_check Sp ( .stop_check_en(stop_check_en), .CLK(CLK), .RST(n11), 
        .rst_all(rst_all), .stop_bit(sampled_bit), .stop_error(STOP_ERROR) );
  FSM_RX F ( .RX_IN(RX_IN), .CLK(CLK), .RST(n11), .PAR_EN(PAR_EN), .par_error(
        PARITY_ERROR), .strt_glitch(START_GLITCH), .stp_error(STOP_ERROR), 
        .bit_count(bit_count), .edge_count({edge_count[4:2], n1, edge_count[0]}), .prescale({prescale[5], n9, n7, n5, n3, prescale[0]}), .data_sample_en(
        data_sample_en), .par_chk_en(par_chk_en), .strt_chk_en(start_check_en), 
        .stp_chk_en(stop_check_en), .data_valid(DATA_VALID), .deser_en(
        deser_en), .enable(enable), .rst_all(rst_all) );
  edge_bit_counter EBC ( .enable(enable), .RST(n11), .CLK(CLK), .rst_all(
        rst_all), .prescale({prescale[5], n9, n7, n5, n3, prescale[0]}), 
        .bit_count(bit_count), .edge_count(edge_count) );
  data_sampling DS ( .edge_count({edge_count[4:2], n1, edge_count[0]}), 
        .data_sample_en(data_sample_en), .RX_IN(RX_IN), .CLK(CLK), .RST(n11), 
        .rst_all(rst_all), .prescale({prescale[5], n9, n7, n5, n3, prescale[0]}), .sampled_bit(sampled_bit) );
  deserializer DZ ( .sampled_bit(sampled_bit), .CLK(CLK), .RST(n11), .rst_all(
        rst_all), .deser_en(deser_en), .P_DATA(P_DATA) );
  parity_check P ( .Data(P_DATA), .CLK(CLK), .RST(n11), .rst_all(rst_all), 
        .par_check_en(par_chk_en), .par_type(PAR_TYPE), .sampled(sampled_bit), 
        .par_error(PARITY_ERROR) );
  INVX2M U1 ( .A(n12), .Y(n11) );
  INVX2M U2 ( .A(RST), .Y(n12) );
  INVX2M U3 ( .A(n6), .Y(n5) );
  INVX2M U4 ( .A(prescale[2]), .Y(n6) );
  INVX2M U5 ( .A(n8), .Y(n7) );
  INVX2M U6 ( .A(prescale[3]), .Y(n8) );
  INVX2M U7 ( .A(n10), .Y(n9) );
  INVX2M U8 ( .A(prescale[4]), .Y(n10) );
  INVX2M U9 ( .A(n4), .Y(n3) );
  INVX2M U10 ( .A(prescale[1]), .Y(n4) );
  INVX2M U11 ( .A(n2), .Y(n1) );
  INVX2M U12 ( .A(edge_count[1]), .Y(n2) );
endmodule


module FSM ( Data_valid, Par_en, Ser_done, CLK, RST, mux, busy, capture, 
        Ser_en );
  output [1:0] mux;
  input Data_valid, Par_en, Ser_done, CLK, RST;
  output busy, capture, Ser_en;
  wire   n6, n7, n8, n9, n1, n2, n3, n4;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  NOR3X2M U3 ( .A(current_state[1]), .B(current_state[2]), .C(n2), .Y(capture)
         );
  NAND2BX2M U4 ( .AN(Ser_en), .B(n8), .Y(next_state[0]) );
  NAND3X2M U5 ( .A(n4), .B(n3), .C(Data_valid), .Y(n8) );
  NAND2X2M U6 ( .A(n6), .B(n7), .Y(mux[1]) );
  OAI21BX1M U7 ( .A0(Ser_done), .A1(n6), .B0N(capture), .Y(Ser_en) );
  NAND3X2M U8 ( .A(current_state[0]), .B(n3), .C(current_state[1]), .Y(n6) );
  NAND3X2M U9 ( .A(n2), .B(n3), .C(current_state[1]), .Y(n7) );
  INVX2M U10 ( .A(current_state[2]), .Y(n3) );
  INVX2M U11 ( .A(current_state[0]), .Y(n2) );
  INVX2M U12 ( .A(n9), .Y(busy) );
  AOI211X2M U13 ( .A0(n2), .A1(current_state[1]), .B0(capture), .C0(mux[1]), 
        .Y(n9) );
  OAI31X1M U14 ( .A0(n1), .A1(Par_en), .A2(n6), .B0(n7), .Y(next_state[2]) );
  INVX2M U15 ( .A(Ser_done), .Y(n1) );
  AOI21X2M U16 ( .A0(n2), .A1(n4), .B0(current_state[2]), .Y(next_state[1]) );
  NAND2X2M U17 ( .A(current_state[0]), .B(n3), .Y(mux[0]) );
  INVX2M U18 ( .A(current_state[1]), .Y(n4) );
endmodule


module Serializer ( Data, Ser_en, CLK, RST, capture, Ser_done, Ser_data );
  input [7:0] Data;
  input Ser_en, CLK, RST, capture;
  output Ser_done, Ser_data;
  wire   N3, N4, N5, N6, N25, N26, N27, N37, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n1, n2, n3, n4, n5;
  wire   [7:0] internal;

  EDFFHQX2M Ser_data_reg ( .D(n3), .E(RST), .CK(CLK), .Q(Ser_data) );
  DFFRQX2M \counter_reg[2]  ( .D(N27), .CK(CLK), .RN(RST), .Q(N5) );
  DFFRQX2M \internal_reg[5]  ( .D(n14), .CK(CLK), .RN(RST), .Q(internal[5]) );
  DFFRQX2M \internal_reg[1]  ( .D(n18), .CK(CLK), .RN(RST), .Q(internal[1]) );
  DFFRQX2M \internal_reg[0]  ( .D(n19), .CK(CLK), .RN(RST), .Q(internal[0]) );
  DFFRQX2M \internal_reg[7]  ( .D(n12), .CK(CLK), .RN(RST), .Q(internal[7]) );
  DFFRQX2M \internal_reg[3]  ( .D(n16), .CK(CLK), .RN(RST), .Q(internal[3]) );
  DFFRQX2M \internal_reg[6]  ( .D(n13), .CK(CLK), .RN(RST), .Q(internal[6]) );
  DFFRQX2M \internal_reg[2]  ( .D(n17), .CK(CLK), .RN(RST), .Q(internal[2]) );
  DFFRQX2M \internal_reg[4]  ( .D(n15), .CK(CLK), .RN(RST), .Q(internal[4]) );
  DFFRQX2M Ser_done_reg ( .D(N37), .CK(CLK), .RN(RST), .Q(Ser_done) );
  DFFRQX2M \counter_reg[1]  ( .D(N26), .CK(CLK), .RN(RST), .Q(N4) );
  DFFRQX2M \counter_reg[0]  ( .D(N25), .CK(CLK), .RN(RST), .Q(N3) );
  NOR2X2M U3 ( .A(n5), .B(n6), .Y(n7) );
  INVX2M U4 ( .A(n6), .Y(n4) );
  NOR2X2M U5 ( .A(n5), .B(capture), .Y(n6) );
  INVX2M U6 ( .A(Ser_en), .Y(n5) );
  OAI2BB2X1M U7 ( .B0(N3), .B1(n4), .A0N(Ser_en), .A1N(capture), .Y(N25) );
  MX4X1M U8 ( .A(internal[0]), .B(internal[1]), .C(internal[2]), .D(
        internal[3]), .S0(N3), .S1(N4), .Y(n2) );
  NOR2X2M U9 ( .A(n8), .B(n4), .Y(N27) );
  CLKXOR2X2M U10 ( .A(n9), .B(N5), .Y(n8) );
  NAND2X2M U11 ( .A(N4), .B(N3), .Y(n9) );
  NOR2X2M U12 ( .A(n10), .B(n4), .Y(N26) );
  XNOR2X2M U13 ( .A(N3), .B(N4), .Y(n10) );
  INVX2M U14 ( .A(n11), .Y(n3) );
  AOI32X1M U15 ( .A0(capture), .A1(Ser_en), .A2(Data[0]), .B0(n6), .B1(N6), 
        .Y(n11) );
  MX2X2M U16 ( .A(n2), .B(n1), .S0(N5), .Y(N6) );
  MX4X1M U17 ( .A(internal[4]), .B(internal[5]), .C(internal[6]), .D(
        internal[7]), .S0(N3), .S1(N4), .Y(n1) );
  AO22X1M U18 ( .A0(n7), .A1(Data[0]), .B0(internal[0]), .B1(n6), .Y(n19) );
  AO22X1M U19 ( .A0(internal[1]), .A1(n6), .B0(Data[1]), .B1(n7), .Y(n18) );
  AO22X1M U20 ( .A0(internal[2]), .A1(n6), .B0(Data[2]), .B1(n7), .Y(n17) );
  AO22X1M U21 ( .A0(internal[3]), .A1(n6), .B0(Data[3]), .B1(n7), .Y(n16) );
  AO22X1M U22 ( .A0(internal[4]), .A1(n6), .B0(Data[4]), .B1(n7), .Y(n15) );
  AO22X1M U23 ( .A0(internal[5]), .A1(n6), .B0(Data[5]), .B1(n7), .Y(n14) );
  AO22X1M U24 ( .A0(internal[6]), .A1(n6), .B0(Data[6]), .B1(n7), .Y(n13) );
  AO22X1M U25 ( .A0(internal[7]), .A1(n6), .B0(Data[7]), .B1(n7), .Y(n12) );
  AND4X2M U26 ( .A(n6), .B(N3), .C(N4), .D(N5), .Y(N37) );
endmodule


module parity_checker ( P_DATA, PAR_TYPE, CLK, RST, capture, parity );
  input [7:0] P_DATA;
  input PAR_TYPE, CLK, RST, capture;
  output parity;
  wire   n1, n3, n4, n5, n6, n7, n2;

  DFFRQX2M parity_reg ( .D(n7), .CK(CLK), .RN(RST), .Q(parity) );
  XNOR2X2M U2 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n5) );
  XOR3XLM U3 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U4 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  OAI2BB2X1M U5 ( .B0(n1), .B1(n2), .A0N(parity), .A1N(n2), .Y(n7) );
  INVX2M U6 ( .A(capture), .Y(n2) );
  XOR3XLM U7 ( .A(n3), .B(PAR_TYPE), .C(n4), .Y(n1) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n5), .Y(n4) );
endmodule


module MUX ( mux_sel, ser_data, parity, CLK, RST, TX_OUT );
  input [1:0] mux_sel;
  input ser_data, parity, CLK, RST;
  output TX_OUT;
  wire   n6, out, n2, n3, n1, n5;

  DFFSQX2M TX_OUT_reg ( .D(out), .CK(CLK), .SN(RST), .Q(n6) );
  INVXLM U3 ( .A(n6), .Y(n1) );
  INVX8M U4 ( .A(n1), .Y(TX_OUT) );
  OAI21X2M U5 ( .A0(n2), .A1(n5), .B0(n3), .Y(out) );
  NAND3X2M U6 ( .A(mux_sel[1]), .B(n5), .C(ser_data), .Y(n3) );
  NOR2BX2M U7 ( .AN(mux_sel[1]), .B(parity), .Y(n2) );
  INVX2M U8 ( .A(mux_sel[0]), .Y(n5) );
endmodule


module UART_TX ( Data, valid, par_en, par_type, CLK, RST, Tx_out, busy );
  input [7:0] Data;
  input valid, par_en, par_type, CLK, RST;
  output Tx_out, busy;
  wire   ser_done, capture, ser_en, ser_data, parity, n1, n2;
  wire   [1:0] mux;

  FSM F1 ( .Data_valid(valid), .Par_en(par_en), .Ser_done(ser_done), .CLK(CLK), 
        .RST(n1), .mux(mux), .busy(busy), .capture(capture), .Ser_en(ser_en)
         );
  Serializer S1 ( .Data(Data), .Ser_en(ser_en), .CLK(CLK), .RST(n1), .capture(
        capture), .Ser_done(ser_done), .Ser_data(ser_data) );
  parity_checker P1 ( .P_DATA(Data), .PAR_TYPE(par_type), .CLK(CLK), .RST(n1), 
        .capture(capture), .parity(parity) );
  MUX M1 ( .mux_sel(mux), .ser_data(ser_data), .parity(parity), .CLK(CLK), 
        .RST(n1), .TX_OUT(Tx_out) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART_TOP ( TX_CLK, RX_CLK, RST, PAR_TYP, PAR_EN, Prescale, TX_IN_P, 
        TX_IN_V, RX_IN_S, TX_OUT_S, TX_OUT_V, RX_OUT_P, RX_OUT_V, STOP_ERROR, 
        PARITY_ERROR, START_GLITCH );
  input [5:0] Prescale;
  input [7:0] TX_IN_P;
  output [7:0] RX_OUT_P;
  input TX_CLK, RX_CLK, RST, PAR_TYP, PAR_EN, TX_IN_V, RX_IN_S;
  output TX_OUT_S, TX_OUT_V, RX_OUT_V, STOP_ERROR, PARITY_ERROR, START_GLITCH;
  wire   n1, n2, n3, n4, n5, n6;

  UART_RX RX ( .RX_IN(RX_IN_S), .CLK(RX_CLK), .RST(n5), .PAR_EN(PAR_EN), 
        .PAR_TYPE(PAR_TYP), .prescale({Prescale[5], n4, n3, n2, n1, 
        Prescale[0]}), .DATA_VALID(RX_OUT_V), .P_DATA(RX_OUT_P), .STOP_ERROR(
        STOP_ERROR), .PARITY_ERROR(PARITY_ERROR), .START_GLITCH(START_GLITCH)
         );
  UART_TX TX ( .Data(TX_IN_P), .valid(TX_IN_V), .par_en(PAR_EN), .par_type(
        PAR_TYP), .CLK(TX_CLK), .RST(n5), .Tx_out(TX_OUT_S), .busy(TX_OUT_V)
         );
  INVX2M U1 ( .A(n6), .Y(n5) );
  INVX2M U2 ( .A(RST), .Y(n6) );
  BUFX2M U3 ( .A(Prescale[2]), .Y(n2) );
  BUFX2M U4 ( .A(Prescale[3]), .Y(n3) );
  BUFX2M U5 ( .A(Prescale[4]), .Y(n4) );
  BUFX2M U6 ( .A(Prescale[1]), .Y(n1) );
endmodule


module SYS_CTRL ( ALU_OUT, ALU_Valid, RdData_REG_FILE, RdData_Valid_REG_FILE, 
        RX_P_DATA, RX_D_VLD, CLK, RST, FIFO_FULL, ALU_FUN, EN_ALU, 
        CLK_GATING_ALU_EN, Address_REG_FILE, WrEn_REG_FILE, RdEn_REG_FILE, 
        WrData_REG_FILE, FIFO_WRITE_DATA, FIFO_WRITE_INC, clk_div_en );
  input [15:0] ALU_OUT;
  input [7:0] RdData_REG_FILE;
  input [7:0] RX_P_DATA;
  output [3:0] ALU_FUN;
  output [3:0] Address_REG_FILE;
  output [7:0] WrData_REG_FILE;
  output [7:0] FIFO_WRITE_DATA;
  input ALU_Valid, RdData_Valid_REG_FILE, RX_D_VLD, CLK, RST, FIFO_FULL;
  output EN_ALU, CLK_GATING_ALU_EN, WrEn_REG_FILE, RdEn_REG_FILE,
         FIFO_WRITE_INC, clk_div_en;
  wire   n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n75, n76, n77, n78;
  wire   [3:0] current;
  wire   [3:0] next;

  DFFRQX2M \Address_REG_FILE_reg[1]  ( .D(n72), .CK(CLK), .RN(RST), .Q(
        Address_REG_FILE[1]) );
  DFFRQX2M \Address_REG_FILE_reg[2]  ( .D(n73), .CK(CLK), .RN(RST), .Q(
        Address_REG_FILE[2]) );
  DFFRQX2M \Address_REG_FILE_reg[3]  ( .D(n74), .CK(CLK), .RN(RST), .Q(
        Address_REG_FILE[3]) );
  DFFRQX2M \Address_REG_FILE_reg[0]  ( .D(n71), .CK(CLK), .RN(RST), .Q(
        Address_REG_FILE[0]) );
  DFFRQX2M \current_reg[0]  ( .D(next[0]), .CK(CLK), .RN(RST), .Q(current[0])
         );
  DFFRQX2M \current_reg[3]  ( .D(next[3]), .CK(CLK), .RN(RST), .Q(current[3])
         );
  DFFRQX2M \current_reg[2]  ( .D(next[2]), .CK(CLK), .RN(RST), .Q(current[2])
         );
  DFFRQX2M \current_reg[1]  ( .D(next[1]), .CK(CLK), .RN(RST), .Q(current[1])
         );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
  NOR2X2M U5 ( .A(n15), .B(n52), .Y(ALU_FUN[1]) );
  NOR2X2M U6 ( .A(n16), .B(n52), .Y(ALU_FUN[0]) );
  NOR2X2M U7 ( .A(n14), .B(n52), .Y(ALU_FUN[2]) );
  OR3X2M U8 ( .A(n61), .B(n62), .C(n29), .Y(FIFO_WRITE_INC) );
  AND2X2M U9 ( .A(n17), .B(n45), .Y(n60) );
  AND2X2M U10 ( .A(n47), .B(n55), .Y(n17) );
  OAI21X2M U11 ( .A0(n8), .A1(n53), .B0(n55), .Y(n41) );
  NOR2BX2M U12 ( .AN(n30), .B(n31), .Y(n61) );
  NOR2BX2M U13 ( .AN(n19), .B(n20), .Y(n62) );
  OAI21X2M U14 ( .A0(FIFO_FULL), .A1(n45), .B0(n17), .Y(WrEn_REG_FILE) );
  NOR2X2M U15 ( .A(n20), .B(n44), .Y(n29) );
  INVX2M U16 ( .A(n3), .Y(n8) );
  INVX2M U17 ( .A(FIFO_FULL), .Y(n6) );
  AOI32X1M U18 ( .A0(n51), .A1(n12), .A2(n50), .B0(n4), .B1(RdEn_REG_FILE), 
        .Y(n56) );
  INVX2M U19 ( .A(n4), .Y(n12) );
  OAI222X1M U20 ( .A0(n4), .A1(n24), .B0(n5), .B1(n44), .C0(n45), .C1(n6), .Y(
        n32) );
  INVX2M U21 ( .A(n20), .Y(n5) );
  NOR3BX2M U22 ( .AN(n51), .B(n11), .C(n3), .Y(n30) );
  NOR3X2M U23 ( .A(n53), .B(n8), .C(n11), .Y(RdEn_REG_FILE) );
  NOR2X2M U24 ( .A(n60), .B(n78), .Y(WrData_REG_FILE[0]) );
  NOR2X2M U25 ( .A(n60), .B(n77), .Y(WrData_REG_FILE[1]) );
  NOR2X2M U26 ( .A(n60), .B(n76), .Y(WrData_REG_FILE[2]) );
  NOR2X2M U27 ( .A(n60), .B(n75), .Y(WrData_REG_FILE[3]) );
  NOR2X2M U28 ( .A(n60), .B(n16), .Y(WrData_REG_FILE[4]) );
  NOR2X2M U29 ( .A(n60), .B(n15), .Y(WrData_REG_FILE[5]) );
  NOR2X2M U30 ( .A(n60), .B(n14), .Y(WrData_REG_FILE[6]) );
  NOR2X2M U31 ( .A(n60), .B(n13), .Y(WrData_REG_FILE[7]) );
  OAI211X2M U32 ( .A0(n4), .A1(n24), .B0(n25), .C0(n26), .Y(next[2]) );
  AOI22X1M U33 ( .A0(n19), .A1(n20), .B0(n30), .B1(n31), .Y(n25) );
  NOR4BX1M U34 ( .AN(n27), .B(n28), .C(RdEn_REG_FILE), .D(n29), .Y(n26) );
  NAND2X2M U35 ( .A(n10), .B(n9), .Y(n53) );
  NAND3X2M U36 ( .A(n59), .B(n10), .C(n3), .Y(n55) );
  AOI21BX2M U37 ( .A0(n10), .A1(n59), .B0N(n56), .Y(n58) );
  NAND3X2M U38 ( .A(n3), .B(n11), .C(n51), .Y(n45) );
  NAND4BX1M U39 ( .AN(n32), .B(n33), .C(n34), .D(n7), .Y(next[1]) );
  AOI22X1M U40 ( .A0(n4), .A1(n41), .B0(n30), .B1(n31), .Y(n34) );
  NOR2X2M U41 ( .A(n13), .B(n52), .Y(ALU_FUN[3]) );
  NAND3X2M U42 ( .A(n8), .B(n10), .C(n59), .Y(n47) );
  NOR4X1M U43 ( .A(n13), .B(n16), .C(n75), .D(n78), .Y(n40) );
  NOR3X2M U44 ( .A(n53), .B(n3), .C(n11), .Y(n28) );
  NOR2BX2M U45 ( .AN(n50), .B(n53), .Y(n39) );
  NAND2X2M U46 ( .A(n52), .B(n44), .Y(EN_ALU) );
  NAND4X2M U47 ( .A(n39), .B(n40), .C(n77), .D(n15), .Y(n37) );
  AOI21BX2M U48 ( .A0(n50), .A1(n51), .B0N(n52), .Y(n33) );
  NOR2X2M U49 ( .A(n9), .B(current[2]), .Y(n59) );
  NAND3X2M U50 ( .A(n59), .B(n8), .C(current[1]), .Y(n52) );
  NAND2X2M U51 ( .A(ALU_Valid), .B(n6), .Y(n20) );
  BUFX2M U52 ( .A(current[0]), .Y(n3) );
  INVX2M U53 ( .A(current[3]), .Y(n9) );
  NAND2X2M U54 ( .A(RdData_Valid_REG_FILE), .B(n6), .Y(n31) );
  NOR4X1M U55 ( .A(n11), .B(n9), .C(n3), .D(current[1]), .Y(n19) );
  NOR2X2M U56 ( .A(n10), .B(current[3]), .Y(n51) );
  OAI211X2M U57 ( .A0(n56), .A1(n16), .B0(n55), .C0(n57), .Y(n71) );
  NAND2X2M U58 ( .A(Address_REG_FILE[0]), .B(n58), .Y(n57) );
  OAI2B11X2M U59 ( .A1N(n41), .A0(n4), .B0(n27), .C0(n42), .Y(next[0]) );
  AOI21X2M U60 ( .A0(n4), .A1(n43), .B0(n32), .Y(n42) );
  NAND4BX1M U61 ( .AN(n28), .B(n33), .C(n46), .D(n47), .Y(n43) );
  NAND4BX1M U62 ( .AN(n23), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .D(n48), .Y(
        n46) );
  OAI2BB2X1M U63 ( .B0(n56), .B1(n15), .A0N(Address_REG_FILE[1]), .A1N(n58), 
        .Y(n72) );
  OAI2BB2X1M U64 ( .B0(n56), .B1(n14), .A0N(Address_REG_FILE[2]), .A1N(n58), 
        .Y(n73) );
  OAI2BB2X1M U65 ( .B0(n56), .B1(n13), .A0N(Address_REG_FILE[3]), .A1N(n58), 
        .Y(n74) );
  INVX2M U66 ( .A(current[1]), .Y(n10) );
  INVX2M U67 ( .A(current[2]), .Y(n11) );
  NAND3X2M U68 ( .A(n3), .B(n59), .C(current[1]), .Y(n44) );
  OAI2BB1X2M U69 ( .A0N(ALU_OUT[0]), .A1N(n29), .B0(n70), .Y(
        FIFO_WRITE_DATA[0]) );
  AOI22X1M U70 ( .A0(RdData_REG_FILE[0]), .A1(n61), .B0(ALU_OUT[8]), .B1(n62), 
        .Y(n70) );
  OAI2BB1X2M U71 ( .A0N(ALU_OUT[1]), .A1N(n29), .B0(n69), .Y(
        FIFO_WRITE_DATA[1]) );
  AOI22X1M U72 ( .A0(RdData_REG_FILE[1]), .A1(n61), .B0(ALU_OUT[9]), .B1(n62), 
        .Y(n69) );
  OAI2BB1X2M U73 ( .A0N(ALU_OUT[2]), .A1N(n29), .B0(n68), .Y(
        FIFO_WRITE_DATA[2]) );
  AOI22X1M U74 ( .A0(RdData_REG_FILE[2]), .A1(n61), .B0(ALU_OUT[10]), .B1(n62), 
        .Y(n68) );
  OAI2BB1X2M U75 ( .A0N(ALU_OUT[3]), .A1N(n29), .B0(n67), .Y(
        FIFO_WRITE_DATA[3]) );
  AOI22X1M U76 ( .A0(RdData_REG_FILE[3]), .A1(n61), .B0(ALU_OUT[11]), .B1(n62), 
        .Y(n67) );
  OAI2BB1X2M U77 ( .A0N(ALU_OUT[4]), .A1N(n29), .B0(n66), .Y(
        FIFO_WRITE_DATA[4]) );
  AOI22X1M U78 ( .A0(RdData_REG_FILE[4]), .A1(n61), .B0(ALU_OUT[12]), .B1(n62), 
        .Y(n66) );
  OAI2BB1X2M U79 ( .A0N(ALU_OUT[5]), .A1N(n29), .B0(n65), .Y(
        FIFO_WRITE_DATA[5]) );
  AOI22X1M U80 ( .A0(RdData_REG_FILE[5]), .A1(n61), .B0(ALU_OUT[13]), .B1(n62), 
        .Y(n65) );
  OAI2BB1X2M U81 ( .A0N(ALU_OUT[6]), .A1N(n29), .B0(n64), .Y(
        FIFO_WRITE_DATA[6]) );
  AOI22X1M U82 ( .A0(RdData_REG_FILE[6]), .A1(n61), .B0(ALU_OUT[14]), .B1(n62), 
        .Y(n64) );
  OAI2BB1X2M U83 ( .A0N(ALU_OUT[7]), .A1N(n29), .B0(n63), .Y(
        FIFO_WRITE_DATA[7]) );
  AOI22X1M U84 ( .A0(RdData_REG_FILE[7]), .A1(n61), .B0(ALU_OUT[15]), .B1(n62), 
        .Y(n63) );
  INVX2M U85 ( .A(RX_P_DATA[5]), .Y(n15) );
  INVX2M U86 ( .A(RX_P_DATA[7]), .Y(n13) );
  INVX2M U87 ( .A(RX_P_DATA[4]), .Y(n16) );
  INVX2M U88 ( .A(RX_P_DATA[6]), .Y(n14) );
  NAND3X2M U89 ( .A(n7), .B(n17), .C(n18), .Y(next[3]) );
  AOI221XLM U90 ( .A0(n19), .A1(n20), .B0(n4), .B1(n21), .C0(EN_ALU), .Y(n18)
         );
  OAI31X1M U91 ( .A0(n22), .A1(n14), .A2(n23), .B0(n24), .Y(n21) );
  NAND3X2M U92 ( .A(n77), .B(n15), .C(RX_P_DATA[2]), .Y(n22) );
  INVX2M U93 ( .A(n35), .Y(n7) );
  OAI32X1M U94 ( .A0(n36), .A1(n8), .A2(n11), .B0(n37), .B1(n38), .Y(n35) );
  NAND3X2M U95 ( .A(RX_P_DATA[2]), .B(n4), .C(RX_P_DATA[6]), .Y(n38) );
  NAND2X2M U96 ( .A(current[3]), .B(n10), .Y(n36) );
  NOR2X2M U97 ( .A(n3), .B(current[2]), .Y(n50) );
  NAND3X2M U98 ( .A(current[2]), .B(n3), .C(n51), .Y(n24) );
  NAND4X2M U99 ( .A(RX_P_DATA[1]), .B(n4), .C(RX_P_DATA[5]), .D(n54), .Y(n27)
         );
  AND4X2M U100 ( .A(n14), .B(n76), .C(n40), .D(n39), .Y(n54) );
  INVX2M U101 ( .A(RX_P_DATA[3]), .Y(n75) );
  INVX2M U102 ( .A(RX_P_DATA[1]), .Y(n77) );
  BUFX2M U103 ( .A(RX_D_VLD), .Y(n4) );
  NOR2X2M U104 ( .A(RX_P_DATA[6]), .B(RX_P_DATA[2]), .Y(n48) );
  INVX2M U105 ( .A(RX_P_DATA[0]), .Y(n78) );
  NAND3X2M U106 ( .A(n39), .B(RX_P_DATA[7]), .C(n49), .Y(n23) );
  NOR3X2M U107 ( .A(n75), .B(RX_P_DATA[4]), .C(RX_P_DATA[0]), .Y(n49) );
  INVX2M U108 ( .A(RX_P_DATA[2]), .Y(n76) );
  NAND3BX2M U109 ( .AN(EN_ALU), .B(n24), .C(n17), .Y(CLK_GATING_ALU_EN) );
endmodule


module RAM ( CLK, RST, Address, WrE, RdEn, WrData, RdData, RdData_Valid, REG0, 
        REG1, REG2, REG3 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrE, RdEn;
  output RdData_Valid;
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
         \Reg_File[4][0] , N35, N36, N37, N38, N39, N40, N41, N42, N59, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225;
  assign N10 = Address[0];
  assign N11 = Address[1];
  assign N12 = Address[2];
  assign N13 = Address[3];

  DFFSQX2M \Reg_File_reg[3][0]  ( .D(n70), .CK(CLK), .SN(n203), .Q(REG3[0]) );
  DFFRQX2M \Reg_File_reg[13][7]  ( .D(n157), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][7] ) );
  DFFRQX2M \Reg_File_reg[13][6]  ( .D(n156), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][6] ) );
  DFFRQX2M \Reg_File_reg[13][5]  ( .D(n155), .CK(CLK), .RN(n210), .Q(
        \Reg_File[13][5] ) );
  DFFRQX2M \Reg_File_reg[13][4]  ( .D(n154), .CK(CLK), .RN(n210), .Q(
        \Reg_File[13][4] ) );
  DFFRQX2M \Reg_File_reg[13][3]  ( .D(n153), .CK(CLK), .RN(n210), .Q(
        \Reg_File[13][3] ) );
  DFFRQX2M \Reg_File_reg[13][2]  ( .D(n152), .CK(CLK), .RN(n210), .Q(
        \Reg_File[13][2] ) );
  DFFRQX2M \Reg_File_reg[13][1]  ( .D(n151), .CK(CLK), .RN(n210), .Q(
        \Reg_File[13][1] ) );
  DFFRQX2M \Reg_File_reg[13][0]  ( .D(n150), .CK(CLK), .RN(n210), .Q(
        \Reg_File[13][0] ) );
  DFFRQX2M \Reg_File_reg[9][7]  ( .D(n125), .CK(CLK), .RN(n208), .Q(
        \Reg_File[9][7] ) );
  DFFRQX2M \Reg_File_reg[9][6]  ( .D(n124), .CK(CLK), .RN(n208), .Q(
        \Reg_File[9][6] ) );
  DFFRQX2M \Reg_File_reg[9][5]  ( .D(n123), .CK(CLK), .RN(n208), .Q(
        \Reg_File[9][5] ) );
  DFFRQX2M \Reg_File_reg[9][4]  ( .D(n122), .CK(CLK), .RN(n208), .Q(
        \Reg_File[9][4] ) );
  DFFRQX2M \Reg_File_reg[9][3]  ( .D(n121), .CK(CLK), .RN(n208), .Q(
        \Reg_File[9][3] ) );
  DFFRQX2M \Reg_File_reg[9][2]  ( .D(n120), .CK(CLK), .RN(n208), .Q(
        \Reg_File[9][2] ) );
  DFFRQX2M \Reg_File_reg[9][1]  ( .D(n119), .CK(CLK), .RN(n208), .Q(
        \Reg_File[9][1] ) );
  DFFRQX2M \Reg_File_reg[9][0]  ( .D(n118), .CK(CLK), .RN(n208), .Q(
        \Reg_File[9][0] ) );
  DFFRQX2M \Reg_File_reg[5][7]  ( .D(n93), .CK(CLK), .RN(n206), .Q(
        \Reg_File[5][7] ) );
  DFFRQX2M \Reg_File_reg[5][6]  ( .D(n92), .CK(CLK), .RN(n206), .Q(
        \Reg_File[5][6] ) );
  DFFRQX2M \Reg_File_reg[5][5]  ( .D(n91), .CK(CLK), .RN(n206), .Q(
        \Reg_File[5][5] ) );
  DFFRQX2M \Reg_File_reg[5][4]  ( .D(n90), .CK(CLK), .RN(n206), .Q(
        \Reg_File[5][4] ) );
  DFFRQX2M \Reg_File_reg[5][3]  ( .D(n89), .CK(CLK), .RN(n206), .Q(
        \Reg_File[5][3] ) );
  DFFRQX2M \Reg_File_reg[5][2]  ( .D(n88), .CK(CLK), .RN(n206), .Q(
        \Reg_File[5][2] ) );
  DFFRQX2M \Reg_File_reg[5][1]  ( .D(n87), .CK(CLK), .RN(n206), .Q(
        \Reg_File[5][1] ) );
  DFFRQX2M \Reg_File_reg[5][0]  ( .D(n86), .CK(CLK), .RN(n206), .Q(
        \Reg_File[5][0] ) );
  DFFRQX2M \Reg_File_reg[15][7]  ( .D(n173), .CK(CLK), .RN(n203), .Q(
        \Reg_File[15][7] ) );
  DFFRQX2M \Reg_File_reg[15][6]  ( .D(n172), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][6] ) );
  DFFRQX2M \Reg_File_reg[15][5]  ( .D(n171), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][5] ) );
  DFFRQX2M \Reg_File_reg[15][4]  ( .D(n170), .CK(CLK), .RN(n211), .Q(
        \Reg_File[15][4] ) );
  DFFRQX2M \Reg_File_reg[15][3]  ( .D(n169), .CK(CLK), .RN(n211), .Q(
        \Reg_File[15][3] ) );
  DFFRQX2M \Reg_File_reg[15][2]  ( .D(n168), .CK(CLK), .RN(n211), .Q(
        \Reg_File[15][2] ) );
  DFFRQX2M \Reg_File_reg[15][1]  ( .D(n167), .CK(CLK), .RN(n211), .Q(
        \Reg_File[15][1] ) );
  DFFRQX2M \Reg_File_reg[15][0]  ( .D(n166), .CK(CLK), .RN(n211), .Q(
        \Reg_File[15][0] ) );
  DFFRQX2M \Reg_File_reg[11][7]  ( .D(n141), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][7] ) );
  DFFRQX2M \Reg_File_reg[11][6]  ( .D(n140), .CK(CLK), .RN(n209), .Q(
        \Reg_File[11][6] ) );
  DFFRQX2M \Reg_File_reg[11][5]  ( .D(n139), .CK(CLK), .RN(n209), .Q(
        \Reg_File[11][5] ) );
  DFFRQX2M \Reg_File_reg[11][4]  ( .D(n138), .CK(CLK), .RN(n209), .Q(
        \Reg_File[11][4] ) );
  DFFRQX2M \Reg_File_reg[11][3]  ( .D(n137), .CK(CLK), .RN(n209), .Q(
        \Reg_File[11][3] ) );
  DFFRQX2M \Reg_File_reg[11][2]  ( .D(n136), .CK(CLK), .RN(n209), .Q(
        \Reg_File[11][2] ) );
  DFFRQX2M \Reg_File_reg[11][1]  ( .D(n135), .CK(CLK), .RN(n209), .Q(
        \Reg_File[11][1] ) );
  DFFRQX2M \Reg_File_reg[11][0]  ( .D(n134), .CK(CLK), .RN(n209), .Q(
        \Reg_File[11][0] ) );
  DFFRQX2M \Reg_File_reg[7][7]  ( .D(n109), .CK(CLK), .RN(n207), .Q(
        \Reg_File[7][7] ) );
  DFFRQX2M \Reg_File_reg[7][6]  ( .D(n108), .CK(CLK), .RN(n207), .Q(
        \Reg_File[7][6] ) );
  DFFRQX2M \Reg_File_reg[7][5]  ( .D(n107), .CK(CLK), .RN(n207), .Q(
        \Reg_File[7][5] ) );
  DFFRQX2M \Reg_File_reg[7][4]  ( .D(n106), .CK(CLK), .RN(n207), .Q(
        \Reg_File[7][4] ) );
  DFFRQX2M \Reg_File_reg[7][3]  ( .D(n105), .CK(CLK), .RN(n207), .Q(
        \Reg_File[7][3] ) );
  DFFRQX2M \Reg_File_reg[7][2]  ( .D(n104), .CK(CLK), .RN(n207), .Q(
        \Reg_File[7][2] ) );
  DFFRQX2M \Reg_File_reg[7][1]  ( .D(n103), .CK(CLK), .RN(n207), .Q(
        \Reg_File[7][1] ) );
  DFFRQX2M \Reg_File_reg[7][0]  ( .D(n102), .CK(CLK), .RN(n207), .Q(
        \Reg_File[7][0] ) );
  DFFRQX2M \Reg_File_reg[14][7]  ( .D(n165), .CK(CLK), .RN(n211), .Q(
        \Reg_File[14][7] ) );
  DFFRQX2M \Reg_File_reg[14][6]  ( .D(n164), .CK(CLK), .RN(n211), .Q(
        \Reg_File[14][6] ) );
  DFFRQX2M \Reg_File_reg[14][5]  ( .D(n163), .CK(CLK), .RN(n211), .Q(
        \Reg_File[14][5] ) );
  DFFRQX2M \Reg_File_reg[14][4]  ( .D(n162), .CK(CLK), .RN(n211), .Q(
        \Reg_File[14][4] ) );
  DFFRQX2M \Reg_File_reg[14][3]  ( .D(n161), .CK(CLK), .RN(n211), .Q(
        \Reg_File[14][3] ) );
  DFFRQX2M \Reg_File_reg[14][2]  ( .D(n160), .CK(CLK), .RN(n211), .Q(
        \Reg_File[14][2] ) );
  DFFRQX2M \Reg_File_reg[14][1]  ( .D(n159), .CK(CLK), .RN(n211), .Q(
        \Reg_File[14][1] ) );
  DFFRQX2M \Reg_File_reg[14][0]  ( .D(n158), .CK(CLK), .RN(n211), .Q(
        \Reg_File[14][0] ) );
  DFFRQX2M \Reg_File_reg[10][7]  ( .D(n133), .CK(CLK), .RN(n209), .Q(
        \Reg_File[10][7] ) );
  DFFRQX2M \Reg_File_reg[10][6]  ( .D(n132), .CK(CLK), .RN(n209), .Q(
        \Reg_File[10][6] ) );
  DFFRQX2M \Reg_File_reg[10][5]  ( .D(n131), .CK(CLK), .RN(n209), .Q(
        \Reg_File[10][5] ) );
  DFFRQX2M \Reg_File_reg[10][4]  ( .D(n130), .CK(CLK), .RN(n209), .Q(
        \Reg_File[10][4] ) );
  DFFRQX2M \Reg_File_reg[10][3]  ( .D(n129), .CK(CLK), .RN(n209), .Q(
        \Reg_File[10][3] ) );
  DFFRQX2M \Reg_File_reg[10][2]  ( .D(n128), .CK(CLK), .RN(n209), .Q(
        \Reg_File[10][2] ) );
  DFFRQX2M \Reg_File_reg[10][1]  ( .D(n127), .CK(CLK), .RN(n209), .Q(
        \Reg_File[10][1] ) );
  DFFRQX2M \Reg_File_reg[10][0]  ( .D(n126), .CK(CLK), .RN(n209), .Q(
        \Reg_File[10][0] ) );
  DFFRQX2M \Reg_File_reg[6][7]  ( .D(n101), .CK(CLK), .RN(n207), .Q(
        \Reg_File[6][7] ) );
  DFFRQX2M \Reg_File_reg[6][6]  ( .D(n100), .CK(CLK), .RN(n207), .Q(
        \Reg_File[6][6] ) );
  DFFRQX2M \Reg_File_reg[6][5]  ( .D(n99), .CK(CLK), .RN(n207), .Q(
        \Reg_File[6][5] ) );
  DFFRQX2M \Reg_File_reg[6][4]  ( .D(n98), .CK(CLK), .RN(n207), .Q(
        \Reg_File[6][4] ) );
  DFFRQX2M \Reg_File_reg[6][3]  ( .D(n97), .CK(CLK), .RN(n207), .Q(
        \Reg_File[6][3] ) );
  DFFRQX2M \Reg_File_reg[6][2]  ( .D(n96), .CK(CLK), .RN(n206), .Q(
        \Reg_File[6][2] ) );
  DFFRQX2M \Reg_File_reg[6][1]  ( .D(n95), .CK(CLK), .RN(n206), .Q(
        \Reg_File[6][1] ) );
  DFFRQX2M \Reg_File_reg[6][0]  ( .D(n94), .CK(CLK), .RN(n206), .Q(
        \Reg_File[6][0] ) );
  DFFRQX2M \Reg_File_reg[12][7]  ( .D(n149), .CK(CLK), .RN(n210), .Q(
        \Reg_File[12][7] ) );
  DFFRQX2M \Reg_File_reg[12][6]  ( .D(n148), .CK(CLK), .RN(n210), .Q(
        \Reg_File[12][6] ) );
  DFFRQX2M \Reg_File_reg[12][5]  ( .D(n147), .CK(CLK), .RN(n210), .Q(
        \Reg_File[12][5] ) );
  DFFRQX2M \Reg_File_reg[12][4]  ( .D(n146), .CK(CLK), .RN(n210), .Q(
        \Reg_File[12][4] ) );
  DFFRQX2M \Reg_File_reg[12][3]  ( .D(n145), .CK(CLK), .RN(n210), .Q(
        \Reg_File[12][3] ) );
  DFFRQX2M \Reg_File_reg[12][2]  ( .D(n144), .CK(CLK), .RN(n210), .Q(
        \Reg_File[12][2] ) );
  DFFRQX2M \Reg_File_reg[12][1]  ( .D(n143), .CK(CLK), .RN(n210), .Q(
        \Reg_File[12][1] ) );
  DFFRQX2M \Reg_File_reg[12][0]  ( .D(n142), .CK(CLK), .RN(n210), .Q(
        \Reg_File[12][0] ) );
  DFFRQX2M \Reg_File_reg[8][7]  ( .D(n117), .CK(CLK), .RN(n208), .Q(
        \Reg_File[8][7] ) );
  DFFRQX2M \Reg_File_reg[8][6]  ( .D(n116), .CK(CLK), .RN(n208), .Q(
        \Reg_File[8][6] ) );
  DFFRQX2M \Reg_File_reg[8][5]  ( .D(n115), .CK(CLK), .RN(n208), .Q(
        \Reg_File[8][5] ) );
  DFFRQX2M \Reg_File_reg[8][4]  ( .D(n114), .CK(CLK), .RN(n208), .Q(
        \Reg_File[8][4] ) );
  DFFRQX2M \Reg_File_reg[8][3]  ( .D(n113), .CK(CLK), .RN(n208), .Q(
        \Reg_File[8][3] ) );
  DFFRQX2M \Reg_File_reg[8][2]  ( .D(n112), .CK(CLK), .RN(n208), .Q(
        \Reg_File[8][2] ) );
  DFFRQX2M \Reg_File_reg[8][1]  ( .D(n111), .CK(CLK), .RN(n208), .Q(
        \Reg_File[8][1] ) );
  DFFRQX2M \Reg_File_reg[8][0]  ( .D(n110), .CK(CLK), .RN(n207), .Q(
        \Reg_File[8][0] ) );
  DFFRQX2M \Reg_File_reg[4][7]  ( .D(n85), .CK(CLK), .RN(n206), .Q(
        \Reg_File[4][7] ) );
  DFFRQX2M \Reg_File_reg[4][6]  ( .D(n84), .CK(CLK), .RN(n206), .Q(
        \Reg_File[4][6] ) );
  DFFRQX2M \Reg_File_reg[4][5]  ( .D(n83), .CK(CLK), .RN(n206), .Q(
        \Reg_File[4][5] ) );
  DFFRQX2M \Reg_File_reg[4][4]  ( .D(n82), .CK(CLK), .RN(n206), .Q(
        \Reg_File[4][4] ) );
  DFFRQX2M \Reg_File_reg[4][3]  ( .D(n81), .CK(CLK), .RN(n205), .Q(
        \Reg_File[4][3] ) );
  DFFRQX2M \Reg_File_reg[4][2]  ( .D(n80), .CK(CLK), .RN(n205), .Q(
        \Reg_File[4][2] ) );
  DFFRQX2M \Reg_File_reg[4][1]  ( .D(n79), .CK(CLK), .RN(n205), .Q(
        \Reg_File[4][1] ) );
  DFFRQX2M \Reg_File_reg[4][0]  ( .D(n78), .CK(CLK), .RN(n205), .Q(
        \Reg_File[4][0] ) );
  DFFRQX2M \RdData_reg[7]  ( .D(n45), .CK(CLK), .RN(n203), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n44), .CK(CLK), .RN(n203), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n43), .CK(CLK), .RN(n203), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n42), .CK(CLK), .RN(n203), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n41), .CK(CLK), .RN(n203), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n40), .CK(CLK), .RN(n203), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n39), .CK(CLK), .RN(n203), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n38), .CK(CLK), .RN(n203), .Q(RdData[0]) );
  DFFRQX2M \Reg_File_reg[3][4]  ( .D(n74), .CK(CLK), .RN(n205), .Q(REG3[4]) );
  DFFRQX2M \Reg_File_reg[3][2]  ( .D(n72), .CK(CLK), .RN(n205), .Q(REG3[2]) );
  DFFRQX2M \Reg_File_reg[3][3]  ( .D(n73), .CK(CLK), .RN(n205), .Q(REG3[3]) );
  DFFRQX2M \Reg_File_reg[3][6]  ( .D(n76), .CK(CLK), .RN(n205), .Q(REG3[6]) );
  DFFRQX2M \Reg_File_reg[3][7]  ( .D(n77), .CK(CLK), .RN(n205), .Q(REG3[7]) );
  DFFRQX2M \Reg_File_reg[2][1]  ( .D(n63), .CK(CLK), .RN(n204), .Q(REG2[1]) );
  DFFRQX2M \Reg_File_reg[3][5]  ( .D(n75), .CK(CLK), .RN(n205), .Q(REG3[5]) );
  DFFRQX2M \Reg_File_reg[2][0]  ( .D(n62), .CK(CLK), .RN(n204), .Q(REG2[0]) );
  DFFRQX2M \Reg_File_reg[3][1]  ( .D(n71), .CK(CLK), .RN(n205), .Q(REG3[1]) );
  DFFRQX2M \Reg_File_reg[2][6]  ( .D(n68), .CK(CLK), .RN(n205), .Q(REG2[6]) );
  DFFRQX2M \Reg_File_reg[2][5]  ( .D(n67), .CK(CLK), .RN(n205), .Q(REG2[5]) );
  DFFRQX2M \Reg_File_reg[2][4]  ( .D(n66), .CK(CLK), .RN(n205), .Q(REG2[4]) );
  DFFRQX2M \Reg_File_reg[2][3]  ( .D(n65), .CK(CLK), .RN(n204), .Q(REG2[3]) );
  DFFRQX2M \Reg_File_reg[2][2]  ( .D(n64), .CK(CLK), .RN(n205), .Q(REG2[2]) );
  DFFRQX2M RdData_Valid_reg ( .D(N59), .CK(CLK), .RN(n207), .Q(RdData_Valid)
         );
  DFFRQX2M \Reg_File_reg[0][1]  ( .D(n47), .CK(CLK), .RN(n203), .Q(REG0[1]) );
  DFFRQX2M \Reg_File_reg[0][0]  ( .D(n46), .CK(CLK), .RN(n203), .Q(REG0[0]) );
  DFFRQX2M \Reg_File_reg[0][2]  ( .D(n48), .CK(CLK), .RN(n203), .Q(REG0[2]) );
  DFFRQX2M \Reg_File_reg[0][3]  ( .D(n49), .CK(CLK), .RN(n204), .Q(REG0[3]) );
  DFFRQX2M \Reg_File_reg[0][4]  ( .D(n50), .CK(CLK), .RN(n204), .Q(REG0[4]) );
  DFFRQX2M \Reg_File_reg[0][5]  ( .D(n51), .CK(CLK), .RN(n203), .Q(REG0[5]) );
  DFFRQX2M \Reg_File_reg[0][7]  ( .D(n53), .CK(CLK), .RN(n204), .Q(REG0[7]) );
  DFFRQX2M \Reg_File_reg[0][6]  ( .D(n52), .CK(CLK), .RN(n204), .Q(REG0[6]) );
  DFFRQX2M \Reg_File_reg[1][5]  ( .D(n59), .CK(CLK), .RN(n204), .Q(REG1[5]) );
  DFFRQX2M \Reg_File_reg[1][4]  ( .D(n58), .CK(CLK), .RN(n204), .Q(REG1[4]) );
  DFFRQX2M \Reg_File_reg[1][7]  ( .D(n61), .CK(CLK), .RN(n204), .Q(REG1[7]) );
  DFFRQX2M \Reg_File_reg[1][1]  ( .D(n55), .CK(CLK), .RN(n204), .Q(REG1[1]) );
  DFFRQX2M \Reg_File_reg[1][3]  ( .D(n57), .CK(CLK), .RN(n204), .Q(REG1[3]) );
  DFFRQX2M \Reg_File_reg[1][2]  ( .D(n56), .CK(CLK), .RN(n204), .Q(REG1[2]) );
  DFFRQX2M \Reg_File_reg[1][6]  ( .D(n60), .CK(CLK), .RN(n204), .Q(REG1[6]) );
  DFFRQX2M \Reg_File_reg[1][0]  ( .D(n54), .CK(CLK), .RN(n204), .Q(REG1[0]) );
  DFFSQX2M \Reg_File_reg[2][7]  ( .D(n69), .CK(CLK), .SN(n203), .Q(REG2[7]) );
  NOR2X2M U3 ( .A(n202), .B(N12), .Y(n18) );
  NOR2X2M U4 ( .A(n197), .B(N12), .Y(n13) );
  NOR2BX2M U5 ( .AN(N12), .B(n197), .Y(n21) );
  NOR2BX2M U6 ( .AN(N12), .B(n202), .Y(n24) );
  INVX2M U7 ( .A(n198), .Y(n199) );
  INVX2M U8 ( .A(n196), .Y(n197) );
  INVX2M U9 ( .A(n198), .Y(n200) );
  BUFX2M U10 ( .A(n201), .Y(n198) );
  BUFX2M U11 ( .A(n202), .Y(n196) );
  NOR2BX2M U12 ( .AN(WrE), .B(RdEn), .Y(n11) );
  NOR2BX2M U13 ( .AN(RdEn), .B(WrE), .Y(N59) );
  BUFX2M U14 ( .A(n217), .Y(n203) );
  BUFX2M U15 ( .A(n217), .Y(n204) );
  BUFX2M U16 ( .A(n216), .Y(n205) );
  BUFX2M U17 ( .A(n216), .Y(n206) );
  BUFX2M U18 ( .A(n215), .Y(n207) );
  BUFX2M U19 ( .A(n215), .Y(n208) );
  BUFX2M U20 ( .A(n214), .Y(n209) );
  BUFX2M U21 ( .A(n214), .Y(n210) );
  BUFX2M U22 ( .A(n213), .Y(n211) );
  BUFX2M U23 ( .A(n213), .Y(n212) );
  NOR2BX2M U24 ( .AN(n25), .B(N10), .Y(n14) );
  NOR2BX2M U25 ( .AN(n25), .B(n201), .Y(n16) );
  NAND2X2M U26 ( .A(n16), .B(n13), .Y(n15) );
  NAND2X2M U27 ( .A(n18), .B(n14), .Y(n17) );
  NAND2X2M U28 ( .A(n18), .B(n16), .Y(n19) );
  NOR2BX2M U29 ( .AN(n36), .B(N10), .Y(n28) );
  NOR2BX2M U30 ( .AN(n36), .B(n201), .Y(n30) );
  NAND2X2M U31 ( .A(n28), .B(n13), .Y(n27) );
  NAND2X2M U32 ( .A(n30), .B(n13), .Y(n29) );
  NAND2X2M U33 ( .A(n28), .B(n18), .Y(n31) );
  NAND2X2M U34 ( .A(n30), .B(n18), .Y(n32) );
  NAND2X2M U35 ( .A(n21), .B(n14), .Y(n20) );
  NAND2X2M U36 ( .A(n21), .B(n16), .Y(n22) );
  NAND2X2M U37 ( .A(n24), .B(n14), .Y(n23) );
  NAND2X2M U38 ( .A(n24), .B(n16), .Y(n26) );
  NAND2X2M U39 ( .A(n28), .B(n21), .Y(n33) );
  NAND2X2M U40 ( .A(n30), .B(n21), .Y(n34) );
  NAND2X2M U41 ( .A(n28), .B(n24), .Y(n35) );
  NAND2X2M U42 ( .A(n30), .B(n24), .Y(n37) );
  NAND2X2M U43 ( .A(n13), .B(n14), .Y(n12) );
  INVX2M U44 ( .A(WrData[0]), .Y(n218) );
  INVX2M U45 ( .A(WrData[1]), .Y(n219) );
  INVX2M U46 ( .A(WrData[2]), .Y(n220) );
  INVX2M U47 ( .A(WrData[3]), .Y(n221) );
  INVX2M U48 ( .A(WrData[4]), .Y(n222) );
  INVX2M U49 ( .A(WrData[5]), .Y(n223) );
  INVX2M U50 ( .A(WrData[6]), .Y(n224) );
  INVX2M U51 ( .A(WrData[7]), .Y(n225) );
  BUFX2M U52 ( .A(RST), .Y(n216) );
  BUFX2M U53 ( .A(RST), .Y(n215) );
  BUFX2M U54 ( .A(RST), .Y(n214) );
  BUFX2M U55 ( .A(RST), .Y(n213) );
  BUFX2M U56 ( .A(RST), .Y(n217) );
  OAI2BB2X1M U57 ( .B0(n218), .B1(n15), .A0N(REG1[0]), .A1N(n15), .Y(n54) );
  OAI2BB2X1M U58 ( .B0(n219), .B1(n15), .A0N(REG1[1]), .A1N(n15), .Y(n55) );
  OAI2BB2X1M U59 ( .B0(n220), .B1(n15), .A0N(REG1[2]), .A1N(n15), .Y(n56) );
  OAI2BB2X1M U60 ( .B0(n221), .B1(n15), .A0N(REG1[3]), .A1N(n15), .Y(n57) );
  OAI2BB2X1M U61 ( .B0(n222), .B1(n15), .A0N(REG1[4]), .A1N(n15), .Y(n58) );
  OAI2BB2X1M U62 ( .B0(n223), .B1(n15), .A0N(REG1[5]), .A1N(n15), .Y(n59) );
  OAI2BB2X1M U63 ( .B0(n224), .B1(n15), .A0N(REG1[6]), .A1N(n15), .Y(n60) );
  OAI2BB2X1M U64 ( .B0(n225), .B1(n15), .A0N(REG1[7]), .A1N(n15), .Y(n61) );
  NOR2BX2M U65 ( .AN(n11), .B(N13), .Y(n25) );
  OAI2BB2X1M U66 ( .B0(n225), .B1(n17), .A0N(REG2[7]), .A1N(n17), .Y(n69) );
  OAI2BB2X1M U67 ( .B0(n218), .B1(n19), .A0N(REG3[0]), .A1N(n19), .Y(n70) );
  OAI2BB2X1M U68 ( .B0(n12), .B1(n218), .A0N(REG0[0]), .A1N(n12), .Y(n46) );
  OAI2BB2X1M U69 ( .B0(n12), .B1(n219), .A0N(REG0[1]), .A1N(n12), .Y(n47) );
  OAI2BB2X1M U70 ( .B0(n12), .B1(n220), .A0N(REG0[2]), .A1N(n12), .Y(n48) );
  OAI2BB2X1M U71 ( .B0(n12), .B1(n221), .A0N(REG0[3]), .A1N(n12), .Y(n49) );
  OAI2BB2X1M U72 ( .B0(n12), .B1(n222), .A0N(REG0[4]), .A1N(n12), .Y(n50) );
  OAI2BB2X1M U73 ( .B0(n12), .B1(n223), .A0N(REG0[5]), .A1N(n12), .Y(n51) );
  OAI2BB2X1M U74 ( .B0(n12), .B1(n224), .A0N(REG0[6]), .A1N(n12), .Y(n52) );
  OAI2BB2X1M U75 ( .B0(n12), .B1(n225), .A0N(REG0[7]), .A1N(n12), .Y(n53) );
  OAI2BB2X1M U76 ( .B0(n218), .B1(n20), .A0N(\Reg_File[4][0] ), .A1N(n20), .Y(
        n78) );
  OAI2BB2X1M U77 ( .B0(n219), .B1(n20), .A0N(\Reg_File[4][1] ), .A1N(n20), .Y(
        n79) );
  OAI2BB2X1M U78 ( .B0(n220), .B1(n20), .A0N(\Reg_File[4][2] ), .A1N(n20), .Y(
        n80) );
  OAI2BB2X1M U79 ( .B0(n221), .B1(n20), .A0N(\Reg_File[4][3] ), .A1N(n20), .Y(
        n81) );
  OAI2BB2X1M U80 ( .B0(n222), .B1(n20), .A0N(\Reg_File[4][4] ), .A1N(n20), .Y(
        n82) );
  OAI2BB2X1M U81 ( .B0(n223), .B1(n20), .A0N(\Reg_File[4][5] ), .A1N(n20), .Y(
        n83) );
  OAI2BB2X1M U82 ( .B0(n224), .B1(n20), .A0N(\Reg_File[4][6] ), .A1N(n20), .Y(
        n84) );
  OAI2BB2X1M U83 ( .B0(n225), .B1(n20), .A0N(\Reg_File[4][7] ), .A1N(n20), .Y(
        n85) );
  OAI2BB2X1M U84 ( .B0(n218), .B1(n22), .A0N(\Reg_File[5][0] ), .A1N(n22), .Y(
        n86) );
  OAI2BB2X1M U85 ( .B0(n219), .B1(n22), .A0N(\Reg_File[5][1] ), .A1N(n22), .Y(
        n87) );
  OAI2BB2X1M U86 ( .B0(n220), .B1(n22), .A0N(\Reg_File[5][2] ), .A1N(n22), .Y(
        n88) );
  OAI2BB2X1M U87 ( .B0(n221), .B1(n22), .A0N(\Reg_File[5][3] ), .A1N(n22), .Y(
        n89) );
  OAI2BB2X1M U88 ( .B0(n222), .B1(n22), .A0N(\Reg_File[5][4] ), .A1N(n22), .Y(
        n90) );
  OAI2BB2X1M U89 ( .B0(n223), .B1(n22), .A0N(\Reg_File[5][5] ), .A1N(n22), .Y(
        n91) );
  OAI2BB2X1M U90 ( .B0(n224), .B1(n22), .A0N(\Reg_File[5][6] ), .A1N(n22), .Y(
        n92) );
  OAI2BB2X1M U91 ( .B0(n225), .B1(n22), .A0N(\Reg_File[5][7] ), .A1N(n22), .Y(
        n93) );
  OAI2BB2X1M U92 ( .B0(n218), .B1(n23), .A0N(\Reg_File[6][0] ), .A1N(n23), .Y(
        n94) );
  OAI2BB2X1M U93 ( .B0(n219), .B1(n23), .A0N(\Reg_File[6][1] ), .A1N(n23), .Y(
        n95) );
  OAI2BB2X1M U94 ( .B0(n220), .B1(n23), .A0N(\Reg_File[6][2] ), .A1N(n23), .Y(
        n96) );
  OAI2BB2X1M U95 ( .B0(n221), .B1(n23), .A0N(\Reg_File[6][3] ), .A1N(n23), .Y(
        n97) );
  OAI2BB2X1M U96 ( .B0(n222), .B1(n23), .A0N(\Reg_File[6][4] ), .A1N(n23), .Y(
        n98) );
  OAI2BB2X1M U97 ( .B0(n223), .B1(n23), .A0N(\Reg_File[6][5] ), .A1N(n23), .Y(
        n99) );
  OAI2BB2X1M U98 ( .B0(n224), .B1(n23), .A0N(\Reg_File[6][6] ), .A1N(n23), .Y(
        n100) );
  OAI2BB2X1M U99 ( .B0(n225), .B1(n23), .A0N(\Reg_File[6][7] ), .A1N(n23), .Y(
        n101) );
  OAI2BB2X1M U100 ( .B0(n218), .B1(n26), .A0N(\Reg_File[7][0] ), .A1N(n26), 
        .Y(n102) );
  OAI2BB2X1M U101 ( .B0(n219), .B1(n26), .A0N(\Reg_File[7][1] ), .A1N(n26), 
        .Y(n103) );
  OAI2BB2X1M U102 ( .B0(n220), .B1(n26), .A0N(\Reg_File[7][2] ), .A1N(n26), 
        .Y(n104) );
  OAI2BB2X1M U103 ( .B0(n221), .B1(n26), .A0N(\Reg_File[7][3] ), .A1N(n26), 
        .Y(n105) );
  OAI2BB2X1M U104 ( .B0(n222), .B1(n26), .A0N(\Reg_File[7][4] ), .A1N(n26), 
        .Y(n106) );
  OAI2BB2X1M U105 ( .B0(n223), .B1(n26), .A0N(\Reg_File[7][5] ), .A1N(n26), 
        .Y(n107) );
  OAI2BB2X1M U106 ( .B0(n224), .B1(n26), .A0N(\Reg_File[7][6] ), .A1N(n26), 
        .Y(n108) );
  OAI2BB2X1M U107 ( .B0(n225), .B1(n26), .A0N(\Reg_File[7][7] ), .A1N(n26), 
        .Y(n109) );
  OAI2BB2X1M U108 ( .B0(n218), .B1(n27), .A0N(\Reg_File[8][0] ), .A1N(n27), 
        .Y(n110) );
  OAI2BB2X1M U109 ( .B0(n219), .B1(n27), .A0N(\Reg_File[8][1] ), .A1N(n27), 
        .Y(n111) );
  OAI2BB2X1M U110 ( .B0(n220), .B1(n27), .A0N(\Reg_File[8][2] ), .A1N(n27), 
        .Y(n112) );
  OAI2BB2X1M U111 ( .B0(n221), .B1(n27), .A0N(\Reg_File[8][3] ), .A1N(n27), 
        .Y(n113) );
  OAI2BB2X1M U112 ( .B0(n222), .B1(n27), .A0N(\Reg_File[8][4] ), .A1N(n27), 
        .Y(n114) );
  OAI2BB2X1M U113 ( .B0(n223), .B1(n27), .A0N(\Reg_File[8][5] ), .A1N(n27), 
        .Y(n115) );
  OAI2BB2X1M U114 ( .B0(n224), .B1(n27), .A0N(\Reg_File[8][6] ), .A1N(n27), 
        .Y(n116) );
  OAI2BB2X1M U115 ( .B0(n225), .B1(n27), .A0N(\Reg_File[8][7] ), .A1N(n27), 
        .Y(n117) );
  OAI2BB2X1M U116 ( .B0(n218), .B1(n29), .A0N(\Reg_File[9][0] ), .A1N(n29), 
        .Y(n118) );
  OAI2BB2X1M U117 ( .B0(n219), .B1(n29), .A0N(\Reg_File[9][1] ), .A1N(n29), 
        .Y(n119) );
  OAI2BB2X1M U118 ( .B0(n220), .B1(n29), .A0N(\Reg_File[9][2] ), .A1N(n29), 
        .Y(n120) );
  OAI2BB2X1M U119 ( .B0(n221), .B1(n29), .A0N(\Reg_File[9][3] ), .A1N(n29), 
        .Y(n121) );
  OAI2BB2X1M U120 ( .B0(n222), .B1(n29), .A0N(\Reg_File[9][4] ), .A1N(n29), 
        .Y(n122) );
  OAI2BB2X1M U121 ( .B0(n223), .B1(n29), .A0N(\Reg_File[9][5] ), .A1N(n29), 
        .Y(n123) );
  OAI2BB2X1M U122 ( .B0(n224), .B1(n29), .A0N(\Reg_File[9][6] ), .A1N(n29), 
        .Y(n124) );
  OAI2BB2X1M U123 ( .B0(n225), .B1(n29), .A0N(\Reg_File[9][7] ), .A1N(n29), 
        .Y(n125) );
  OAI2BB2X1M U124 ( .B0(n218), .B1(n31), .A0N(\Reg_File[10][0] ), .A1N(n31), 
        .Y(n126) );
  OAI2BB2X1M U125 ( .B0(n219), .B1(n31), .A0N(\Reg_File[10][1] ), .A1N(n31), 
        .Y(n127) );
  OAI2BB2X1M U126 ( .B0(n220), .B1(n31), .A0N(\Reg_File[10][2] ), .A1N(n31), 
        .Y(n128) );
  OAI2BB2X1M U127 ( .B0(n221), .B1(n31), .A0N(\Reg_File[10][3] ), .A1N(n31), 
        .Y(n129) );
  OAI2BB2X1M U128 ( .B0(n222), .B1(n31), .A0N(\Reg_File[10][4] ), .A1N(n31), 
        .Y(n130) );
  OAI2BB2X1M U129 ( .B0(n223), .B1(n31), .A0N(\Reg_File[10][5] ), .A1N(n31), 
        .Y(n131) );
  OAI2BB2X1M U130 ( .B0(n224), .B1(n31), .A0N(\Reg_File[10][6] ), .A1N(n31), 
        .Y(n132) );
  OAI2BB2X1M U131 ( .B0(n225), .B1(n31), .A0N(\Reg_File[10][7] ), .A1N(n31), 
        .Y(n133) );
  OAI2BB2X1M U132 ( .B0(n218), .B1(n32), .A0N(\Reg_File[11][0] ), .A1N(n32), 
        .Y(n134) );
  OAI2BB2X1M U133 ( .B0(n219), .B1(n32), .A0N(\Reg_File[11][1] ), .A1N(n32), 
        .Y(n135) );
  OAI2BB2X1M U134 ( .B0(n220), .B1(n32), .A0N(\Reg_File[11][2] ), .A1N(n32), 
        .Y(n136) );
  OAI2BB2X1M U135 ( .B0(n221), .B1(n32), .A0N(\Reg_File[11][3] ), .A1N(n32), 
        .Y(n137) );
  OAI2BB2X1M U136 ( .B0(n222), .B1(n32), .A0N(\Reg_File[11][4] ), .A1N(n32), 
        .Y(n138) );
  OAI2BB2X1M U137 ( .B0(n223), .B1(n32), .A0N(\Reg_File[11][5] ), .A1N(n32), 
        .Y(n139) );
  OAI2BB2X1M U138 ( .B0(n224), .B1(n32), .A0N(\Reg_File[11][6] ), .A1N(n32), 
        .Y(n140) );
  OAI2BB2X1M U139 ( .B0(n225), .B1(n32), .A0N(\Reg_File[11][7] ), .A1N(n32), 
        .Y(n141) );
  OAI2BB2X1M U140 ( .B0(n218), .B1(n33), .A0N(\Reg_File[12][0] ), .A1N(n33), 
        .Y(n142) );
  OAI2BB2X1M U141 ( .B0(n219), .B1(n33), .A0N(\Reg_File[12][1] ), .A1N(n33), 
        .Y(n143) );
  OAI2BB2X1M U142 ( .B0(n220), .B1(n33), .A0N(\Reg_File[12][2] ), .A1N(n33), 
        .Y(n144) );
  OAI2BB2X1M U143 ( .B0(n221), .B1(n33), .A0N(\Reg_File[12][3] ), .A1N(n33), 
        .Y(n145) );
  OAI2BB2X1M U144 ( .B0(n222), .B1(n33), .A0N(\Reg_File[12][4] ), .A1N(n33), 
        .Y(n146) );
  OAI2BB2X1M U145 ( .B0(n223), .B1(n33), .A0N(\Reg_File[12][5] ), .A1N(n33), 
        .Y(n147) );
  OAI2BB2X1M U146 ( .B0(n224), .B1(n33), .A0N(\Reg_File[12][6] ), .A1N(n33), 
        .Y(n148) );
  OAI2BB2X1M U147 ( .B0(n225), .B1(n33), .A0N(\Reg_File[12][7] ), .A1N(n33), 
        .Y(n149) );
  OAI2BB2X1M U148 ( .B0(n218), .B1(n34), .A0N(\Reg_File[13][0] ), .A1N(n34), 
        .Y(n150) );
  OAI2BB2X1M U149 ( .B0(n219), .B1(n34), .A0N(\Reg_File[13][1] ), .A1N(n34), 
        .Y(n151) );
  OAI2BB2X1M U150 ( .B0(n220), .B1(n34), .A0N(\Reg_File[13][2] ), .A1N(n34), 
        .Y(n152) );
  OAI2BB2X1M U151 ( .B0(n221), .B1(n34), .A0N(\Reg_File[13][3] ), .A1N(n34), 
        .Y(n153) );
  OAI2BB2X1M U152 ( .B0(n222), .B1(n34), .A0N(\Reg_File[13][4] ), .A1N(n34), 
        .Y(n154) );
  OAI2BB2X1M U153 ( .B0(n223), .B1(n34), .A0N(\Reg_File[13][5] ), .A1N(n34), 
        .Y(n155) );
  OAI2BB2X1M U154 ( .B0(n224), .B1(n34), .A0N(\Reg_File[13][6] ), .A1N(n34), 
        .Y(n156) );
  OAI2BB2X1M U155 ( .B0(n225), .B1(n34), .A0N(\Reg_File[13][7] ), .A1N(n34), 
        .Y(n157) );
  OAI2BB2X1M U156 ( .B0(n218), .B1(n35), .A0N(\Reg_File[14][0] ), .A1N(n35), 
        .Y(n158) );
  OAI2BB2X1M U157 ( .B0(n219), .B1(n35), .A0N(\Reg_File[14][1] ), .A1N(n35), 
        .Y(n159) );
  OAI2BB2X1M U158 ( .B0(n220), .B1(n35), .A0N(\Reg_File[14][2] ), .A1N(n35), 
        .Y(n160) );
  OAI2BB2X1M U159 ( .B0(n221), .B1(n35), .A0N(\Reg_File[14][3] ), .A1N(n35), 
        .Y(n161) );
  OAI2BB2X1M U160 ( .B0(n222), .B1(n35), .A0N(\Reg_File[14][4] ), .A1N(n35), 
        .Y(n162) );
  OAI2BB2X1M U161 ( .B0(n223), .B1(n35), .A0N(\Reg_File[14][5] ), .A1N(n35), 
        .Y(n163) );
  OAI2BB2X1M U162 ( .B0(n224), .B1(n35), .A0N(\Reg_File[14][6] ), .A1N(n35), 
        .Y(n164) );
  OAI2BB2X1M U163 ( .B0(n225), .B1(n35), .A0N(\Reg_File[14][7] ), .A1N(n35), 
        .Y(n165) );
  OAI2BB2X1M U164 ( .B0(n218), .B1(n37), .A0N(\Reg_File[15][0] ), .A1N(n37), 
        .Y(n166) );
  OAI2BB2X1M U165 ( .B0(n219), .B1(n37), .A0N(\Reg_File[15][1] ), .A1N(n37), 
        .Y(n167) );
  OAI2BB2X1M U166 ( .B0(n220), .B1(n37), .A0N(\Reg_File[15][2] ), .A1N(n37), 
        .Y(n168) );
  OAI2BB2X1M U167 ( .B0(n221), .B1(n37), .A0N(\Reg_File[15][3] ), .A1N(n37), 
        .Y(n169) );
  OAI2BB2X1M U168 ( .B0(n222), .B1(n37), .A0N(\Reg_File[15][4] ), .A1N(n37), 
        .Y(n170) );
  OAI2BB2X1M U169 ( .B0(n223), .B1(n37), .A0N(\Reg_File[15][5] ), .A1N(n37), 
        .Y(n171) );
  OAI2BB2X1M U170 ( .B0(n224), .B1(n37), .A0N(\Reg_File[15][6] ), .A1N(n37), 
        .Y(n172) );
  OAI2BB2X1M U171 ( .B0(n225), .B1(n37), .A0N(\Reg_File[15][7] ), .A1N(n37), 
        .Y(n173) );
  OAI2BB2X1M U172 ( .B0(n218), .B1(n17), .A0N(REG2[0]), .A1N(n17), .Y(n62) );
  OAI2BB2X1M U173 ( .B0(n219), .B1(n17), .A0N(REG2[1]), .A1N(n17), .Y(n63) );
  OAI2BB2X1M U174 ( .B0(n220), .B1(n17), .A0N(REG2[2]), .A1N(n17), .Y(n64) );
  OAI2BB2X1M U175 ( .B0(n221), .B1(n17), .A0N(REG2[3]), .A1N(n17), .Y(n65) );
  OAI2BB2X1M U176 ( .B0(n222), .B1(n17), .A0N(REG2[4]), .A1N(n17), .Y(n66) );
  OAI2BB2X1M U177 ( .B0(n223), .B1(n17), .A0N(REG2[5]), .A1N(n17), .Y(n67) );
  OAI2BB2X1M U178 ( .B0(n224), .B1(n17), .A0N(REG2[6]), .A1N(n17), .Y(n68) );
  OAI2BB2X1M U179 ( .B0(n219), .B1(n19), .A0N(REG3[1]), .A1N(n19), .Y(n71) );
  OAI2BB2X1M U180 ( .B0(n220), .B1(n19), .A0N(REG3[2]), .A1N(n19), .Y(n72) );
  OAI2BB2X1M U181 ( .B0(n221), .B1(n19), .A0N(REG3[3]), .A1N(n19), .Y(n73) );
  OAI2BB2X1M U182 ( .B0(n222), .B1(n19), .A0N(REG3[4]), .A1N(n19), .Y(n74) );
  OAI2BB2X1M U183 ( .B0(n223), .B1(n19), .A0N(REG3[5]), .A1N(n19), .Y(n75) );
  OAI2BB2X1M U184 ( .B0(n224), .B1(n19), .A0N(REG3[6]), .A1N(n19), .Y(n76) );
  OAI2BB2X1M U185 ( .B0(n225), .B1(n19), .A0N(REG3[7]), .A1N(n19), .Y(n77) );
  MX4X1M U186 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n199), 
        .S1(n197), .Y(n8) );
  MX4X1M U187 ( .A(\Reg_File[4][0] ), .B(\Reg_File[5][0] ), .C(
        \Reg_File[6][0] ), .D(\Reg_File[7][0] ), .S0(N10), .S1(n197), .Y(n3)
         );
  MX4X1M U188 ( .A(\Reg_File[4][1] ), .B(\Reg_File[5][1] ), .C(
        \Reg_File[6][1] ), .D(\Reg_File[7][1] ), .S0(n199), .S1(n197), .Y(n7)
         );
  MX4X1M U189 ( .A(\Reg_File[4][2] ), .B(\Reg_File[5][2] ), .C(
        \Reg_File[6][2] ), .D(\Reg_File[7][2] ), .S0(n199), .S1(N11), .Y(n174)
         );
  MX4X1M U190 ( .A(\Reg_File[4][3] ), .B(\Reg_File[5][3] ), .C(
        \Reg_File[6][3] ), .D(\Reg_File[7][3] ), .S0(n199), .S1(N11), .Y(n178)
         );
  MX4X1M U191 ( .A(\Reg_File[4][4] ), .B(\Reg_File[5][4] ), .C(
        \Reg_File[6][4] ), .D(\Reg_File[7][4] ), .S0(n199), .S1(N11), .Y(n182)
         );
  MX4X1M U192 ( .A(\Reg_File[4][5] ), .B(\Reg_File[5][5] ), .C(
        \Reg_File[6][5] ), .D(\Reg_File[7][5] ), .S0(n200), .S1(N11), .Y(n186)
         );
  MX4X1M U193 ( .A(\Reg_File[4][6] ), .B(\Reg_File[5][6] ), .C(
        \Reg_File[6][6] ), .D(\Reg_File[7][6] ), .S0(n200), .S1(N11), .Y(n190)
         );
  MX4X1M U194 ( .A(\Reg_File[4][7] ), .B(\Reg_File[5][7] ), .C(
        \Reg_File[6][7] ), .D(\Reg_File[7][7] ), .S0(n200), .S1(N11), .Y(n194)
         );
  MX4X1M U195 ( .A(\Reg_File[12][0] ), .B(\Reg_File[13][0] ), .C(
        \Reg_File[14][0] ), .D(\Reg_File[15][0] ), .S0(n200), .S1(n197), .Y(n1) );
  MX4X1M U196 ( .A(\Reg_File[12][2] ), .B(\Reg_File[13][2] ), .C(
        \Reg_File[14][2] ), .D(\Reg_File[15][2] ), .S0(n199), .S1(n197), .Y(n9) );
  MX4X1M U197 ( .A(\Reg_File[12][3] ), .B(\Reg_File[13][3] ), .C(
        \Reg_File[14][3] ), .D(\Reg_File[15][3] ), .S0(n199), .S1(n197), .Y(
        n176) );
  MX4X1M U198 ( .A(\Reg_File[12][4] ), .B(\Reg_File[13][4] ), .C(
        \Reg_File[14][4] ), .D(\Reg_File[15][4] ), .S0(n199), .S1(N11), .Y(
        n180) );
  MX4X1M U199 ( .A(\Reg_File[12][5] ), .B(\Reg_File[13][5] ), .C(
        \Reg_File[14][5] ), .D(\Reg_File[15][5] ), .S0(n200), .S1(n197), .Y(
        n184) );
  MX4X1M U200 ( .A(\Reg_File[12][6] ), .B(\Reg_File[13][6] ), .C(
        \Reg_File[14][6] ), .D(\Reg_File[15][6] ), .S0(n200), .S1(n197), .Y(
        n188) );
  MX4X1M U201 ( .A(\Reg_File[12][7] ), .B(\Reg_File[13][7] ), .C(
        \Reg_File[14][7] ), .D(\Reg_File[15][7] ), .S0(n200), .S1(n197), .Y(
        n192) );
  AND2X2M U202 ( .A(N13), .B(n11), .Y(n36) );
  AO22X1M U203 ( .A0(RdData[0]), .A1(n11), .B0(N42), .B1(N59), .Y(n38) );
  MX4X1M U204 ( .A(n4), .B(n2), .C(n3), .D(n1), .S0(N13), .S1(N12), .Y(N42) );
  MX4X1M U205 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N10), 
        .S1(n197), .Y(n4) );
  MX4X1M U206 ( .A(\Reg_File[8][0] ), .B(\Reg_File[9][0] ), .C(
        \Reg_File[10][0] ), .D(\Reg_File[11][0] ), .S0(N10), .S1(n197), .Y(n2)
         );
  AO22X1M U207 ( .A0(RdData[1]), .A1(n11), .B0(N41), .B1(N59), .Y(n39) );
  MX4X1M U208 ( .A(n8), .B(n6), .C(n7), .D(n5), .S0(N13), .S1(N12), .Y(N41) );
  MX4X1M U209 ( .A(\Reg_File[8][1] ), .B(\Reg_File[9][1] ), .C(
        \Reg_File[10][1] ), .D(\Reg_File[11][1] ), .S0(N10), .S1(n197), .Y(n6)
         );
  MX4X1M U210 ( .A(\Reg_File[12][1] ), .B(\Reg_File[13][1] ), .C(
        \Reg_File[14][1] ), .D(\Reg_File[15][1] ), .S0(n199), .S1(n197), .Y(n5) );
  AO22X1M U211 ( .A0(RdData[2]), .A1(n11), .B0(N40), .B1(N59), .Y(n40) );
  MX4X1M U212 ( .A(n175), .B(n10), .C(n174), .D(n9), .S0(N13), .S1(N12), .Y(
        N40) );
  MX4X1M U213 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n199), 
        .S1(N11), .Y(n175) );
  MX4X1M U214 ( .A(\Reg_File[8][2] ), .B(\Reg_File[9][2] ), .C(
        \Reg_File[10][2] ), .D(\Reg_File[11][2] ), .S0(n199), .S1(N11), .Y(n10) );
  AO22X1M U215 ( .A0(RdData[3]), .A1(n11), .B0(N39), .B1(N59), .Y(n41) );
  MX4X1M U216 ( .A(n179), .B(n177), .C(n178), .D(n176), .S0(N13), .S1(N12), 
        .Y(N39) );
  MX4X1M U217 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n199), 
        .S1(N11), .Y(n179) );
  MX4X1M U218 ( .A(\Reg_File[8][3] ), .B(\Reg_File[9][3] ), .C(
        \Reg_File[10][3] ), .D(\Reg_File[11][3] ), .S0(n199), .S1(N11), .Y(
        n177) );
  AO22X1M U219 ( .A0(RdData[4]), .A1(n11), .B0(N38), .B1(N59), .Y(n42) );
  MX4X1M U220 ( .A(n183), .B(n181), .C(n182), .D(n180), .S0(N13), .S1(N12), 
        .Y(N38) );
  MX4X1M U221 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n200), 
        .S1(N11), .Y(n183) );
  MX4X1M U222 ( .A(\Reg_File[8][4] ), .B(\Reg_File[9][4] ), .C(
        \Reg_File[10][4] ), .D(\Reg_File[11][4] ), .S0(n199), .S1(N11), .Y(
        n181) );
  AO22X1M U223 ( .A0(RdData[5]), .A1(n11), .B0(N37), .B1(N59), .Y(n43) );
  MX4X1M U224 ( .A(n187), .B(n185), .C(n186), .D(n184), .S0(N13), .S1(N12), 
        .Y(N37) );
  MX4X1M U225 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n200), 
        .S1(N11), .Y(n187) );
  MX4X1M U226 ( .A(\Reg_File[8][5] ), .B(\Reg_File[9][5] ), .C(
        \Reg_File[10][5] ), .D(\Reg_File[11][5] ), .S0(n200), .S1(N11), .Y(
        n185) );
  AO22X1M U227 ( .A0(RdData[6]), .A1(n11), .B0(N36), .B1(N59), .Y(n44) );
  MX4X1M U228 ( .A(n191), .B(n189), .C(n190), .D(n188), .S0(N13), .S1(N12), 
        .Y(N36) );
  MX4X1M U229 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n200), 
        .S1(N11), .Y(n191) );
  MX4X1M U230 ( .A(\Reg_File[8][6] ), .B(\Reg_File[9][6] ), .C(
        \Reg_File[10][6] ), .D(\Reg_File[11][6] ), .S0(n200), .S1(N11), .Y(
        n189) );
  AO22X1M U231 ( .A0(RdData[7]), .A1(n11), .B0(N35), .B1(N59), .Y(n45) );
  MX4X1M U232 ( .A(n195), .B(n193), .C(n194), .D(n192), .S0(N13), .S1(N12), 
        .Y(N35) );
  MX4X1M U233 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n200), 
        .S1(N11), .Y(n195) );
  MX4X1M U234 ( .A(\Reg_File[8][7] ), .B(\Reg_File[9][7] ), .C(
        \Reg_File[10][7] ), .D(\Reg_File[11][7] ), .S0(n200), .S1(N11), .Y(
        n193) );
  INVX2M U235 ( .A(N10), .Y(n201) );
  INVX2M U236 ( .A(N11), .Y(n202) );
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

  ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_DW01_add_1 FS_1 ( .A(
        {1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , \A1[8] , \A1[7] , 
        \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , \A1[1] , \A1[0] }), 
        .B({n10, n16, n15, n14, n13, n11, n12, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n6), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
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
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n5), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n4), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
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
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n7), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n3), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  AND2X2M U2 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n7) );
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
  XNOR2X2M U31 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U32 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U33 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U34 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U35 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
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
endmodule


module ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16 ( A, B, ALU_FUN, 
        CLK, RST, ALU_Enable, ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input CLK, RST, ALU_Enable;
  output OUT_VALID;
  wire   sub_16, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103, N104,
         N105, N106, N107, N108, N109, N111, N112, N113, N114, N115, N116,
         N117, N118, N151, N152, N153, N171, N172, N173, N174, N175, N176,
         N177, N178, N179, N180, N181, N182, N183, N184, N185, N186, N187, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151;
  wire   [8:0] sum;
  wire   [7:0] sub;

  ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_DW_div_uns_0 div_29 ( 
        .a({n11, n10, n9, n8, n7, n6, n5, n4}), .b(B), .quotient({N118, N117, 
        N116, N115, N114, N113, N112, N111}) );
  ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_DW01_sub_0 sub_10 ( 
        .A({1'b0, n11, n10, n9, n8, n7, n6, n5, n4}), .B({1'b0, B}), .CI(1'b0), 
        .DIFF({sub_16, sub}) );
  ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_DW01_add_0 add_9 ( 
        .A({1'b0, n11, n10, n9, n8, n7, n6, n5, n4}), .B({1'b0, B}), .CI(1'b0), 
        .SUM(sum) );
  ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16_DW02_mult_0 mult_26 ( 
        .A({n11, n10, n9, n8, n7, n6, n5, n4}), .B(B), .TC(1'b0), .PRODUCT({
        N109, N108, N107, N106, N105, N104, N103, N102, N101, N100, N99, N98, 
        N97, N96, N95, N94}) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(N179), .CK(CLK), .RN(RST), .Q(ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(N178), .CK(CLK), .RN(RST), .Q(ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(N177), .CK(CLK), .RN(RST), .Q(ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(N176), .CK(CLK), .RN(RST), .Q(ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(N175), .CK(CLK), .RN(RST), .Q(ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(N174), .CK(CLK), .RN(RST), .Q(ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(N173), .CK(CLK), .RN(RST), .Q(ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(N172), .CK(CLK), .RN(RST), .Q(ALU_OUT[0]) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(N187), .CK(CLK), .RN(RST), .Q(ALU_OUT[15])
         );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(N186), .CK(CLK), .RN(RST), .Q(ALU_OUT[14])
         );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(N185), .CK(CLK), .RN(RST), .Q(ALU_OUT[13])
         );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(N184), .CK(CLK), .RN(RST), .Q(ALU_OUT[12])
         );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(N183), .CK(CLK), .RN(RST), .Q(ALU_OUT[11])
         );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(N182), .CK(CLK), .RN(RST), .Q(ALU_OUT[10])
         );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(N181), .CK(CLK), .RN(RST), .Q(ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(N180), .CK(CLK), .RN(RST), .Q(ALU_OUT[8]) );
  DFFRQX2M OUT_VALID_reg ( .D(N171), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  NOR4X1M U3 ( .A(n150), .B(ALU_FUN[0]), .C(ALU_FUN[1]), .D(ALU_FUN[2]), .Y(
        n56) );
  INVX2M U4 ( .A(n47), .Y(n143) );
  INVX2M U5 ( .A(n52), .Y(n142) );
  OAI2BB1X2M U8 ( .A0N(N108), .A1N(n38), .B0(n39), .Y(N186) );
  OAI2BB1X2M U9 ( .A0N(N109), .A1N(n38), .B0(n39), .Y(N187) );
  OAI2BB1X2M U10 ( .A0N(N106), .A1N(n38), .B0(n39), .Y(N184) );
  OAI2BB1X2M U11 ( .A0N(N107), .A1N(n38), .B0(n39), .Y(N185) );
  OAI2BB1X2M U12 ( .A0N(N103), .A1N(n38), .B0(n39), .Y(N181) );
  OAI2BB1X2M U13 ( .A0N(N104), .A1N(n38), .B0(n39), .Y(N182) );
  OAI2BB1X2M U14 ( .A0N(N105), .A1N(n38), .B0(n39), .Y(N183) );
  OAI21X2M U15 ( .A0(n147), .A1(n148), .B0(n112), .Y(n47) );
  INVX2M U16 ( .A(n57), .Y(n145) );
  INVX2M U17 ( .A(n121), .Y(n148) );
  NOR3X2M U18 ( .A(n149), .B(n147), .C(n150), .Y(n104) );
  AND3X2M U19 ( .A(n113), .B(n149), .C(n150), .Y(n46) );
  INVX2M U20 ( .A(n56), .Y(n146) );
  NAND2X2M U21 ( .A(n113), .B(n121), .Y(n52) );
  AND2X2M U22 ( .A(n120), .B(n144), .Y(n41) );
  AND2X2M U23 ( .A(n104), .B(n144), .Y(n44) );
  OAI2BB2X1M U24 ( .B0(n135), .B1(n52), .A0N(N101), .A1N(n41), .Y(n51) );
  NOR3X2M U25 ( .A(n147), .B(ALU_FUN[0]), .C(n148), .Y(n57) );
  OAI21X2M U26 ( .A0(ALU_FUN[1]), .A1(n148), .B0(n112), .Y(n55) );
  NOR2X2M U27 ( .A(n144), .B(ALU_FUN[1]), .Y(n113) );
  INVX2M U28 ( .A(ALU_FUN[1]), .Y(n147) );
  NOR2X2M U29 ( .A(n149), .B(n3), .Y(n121) );
  INVX2M U30 ( .A(ALU_FUN[2]), .Y(n149) );
  INVX2M U31 ( .A(ALU_FUN[0]), .Y(n144) );
  NAND2BX2M U32 ( .AN(n40), .B(ALU_Enable), .Y(n39) );
  NAND3X2M U33 ( .A(n113), .B(n149), .C(n3), .Y(n112) );
  NOR4X1M U34 ( .A(ALU_FUN[0]), .B(ALU_FUN[1]), .C(ALU_FUN[2]), .D(n3), .Y(n45) );
  NOR3X2M U35 ( .A(ALU_FUN[2]), .B(n3), .C(n147), .Y(n120) );
  AND3X2M U36 ( .A(n113), .B(ALU_FUN[2]), .C(n3), .Y(n61) );
  AOI21X2M U37 ( .A0(n104), .A1(ALU_FUN[0]), .B0(n151), .Y(N171) );
  INVX2M U38 ( .A(n3), .Y(n150) );
  AND2X2M U39 ( .A(n41), .B(ALU_Enable), .Y(n38) );
  INVX2M U40 ( .A(ALU_Enable), .Y(n151) );
  AOI31X2M U41 ( .A0(n105), .A1(n106), .A2(n107), .B0(n151), .Y(N172) );
  AOI22X1M U42 ( .A0(sub[0]), .A1(n46), .B0(sum[0]), .B1(n45), .Y(n105) );
  AOI222X1M U43 ( .A0(N94), .A1(n41), .B0(n57), .B1(n141), .C0(n4), .C1(n142), 
        .Y(n106) );
  AOI211X2M U44 ( .A0(n5), .A1(n61), .B0(n108), .C0(n109), .Y(n107) );
  OAI2BB1X2M U45 ( .A0N(N111), .A1N(n126), .B0(n114), .Y(n108) );
  AOI31X2M U46 ( .A0(N151), .A1(n3), .A2(n115), .B0(n103), .Y(n114) );
  NOR3X2M U47 ( .A(n147), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n115) );
  AOI31X2M U48 ( .A0(n94), .A1(n95), .A2(n96), .B0(n151), .Y(N173) );
  AOI222X1M U49 ( .A0(sum[1]), .A1(n45), .B0(N95), .B1(n41), .C0(sub[1]), .C1(
        n46), .Y(n94) );
  AOI222X1M U50 ( .A0(n5), .A1(n142), .B0(n6), .B1(n61), .C0(n57), .C1(n122), 
        .Y(n95) );
  AOI211X2M U51 ( .A0(n4), .A1(n44), .B0(n97), .C0(n98), .Y(n96) );
  OAI2BB1X2M U52 ( .A0N(N112), .A1N(n126), .B0(n101), .Y(n97) );
  AOI31X2M U53 ( .A0(N152), .A1(n3), .A2(n102), .B0(n103), .Y(n101) );
  NOR3X2M U54 ( .A(n144), .B(ALU_FUN[2]), .C(n147), .Y(n102) );
  AOI31X2M U55 ( .A0(n87), .A1(n88), .A2(n89), .B0(n151), .Y(N174) );
  AOI22X1M U56 ( .A0(sub[2]), .A1(n46), .B0(sum[2]), .B1(n45), .Y(n87) );
  AOI222X1M U57 ( .A0(N96), .A1(n41), .B0(n57), .B1(n140), .C0(n6), .C1(n142), 
        .Y(n88) );
  AOI221XLM U58 ( .A0(n5), .A1(n44), .B0(n7), .B1(n61), .C0(n90), .Y(n89) );
  OAI21X2M U59 ( .A0(n91), .A1(n132), .B0(n92), .Y(n90) );
  AOI221XLM U60 ( .A0(n56), .A1(n140), .B0(n6), .B1(n55), .C0(n142), .Y(n91)
         );
  AOI22X1M U61 ( .A0(N113), .A1(n126), .B0(n93), .B1(n132), .Y(n92) );
  OAI221X1M U62 ( .A0(n6), .A1(n143), .B0(n146), .B1(n140), .C0(n145), .Y(n93)
         );
  AOI31X2M U63 ( .A0(n80), .A1(n81), .A2(n82), .B0(n151), .Y(N175) );
  AOI22X1M U64 ( .A0(sub[3]), .A1(n46), .B0(sum[3]), .B1(n45), .Y(n80) );
  AOI222X1M U65 ( .A0(N97), .A1(n41), .B0(n57), .B1(n139), .C0(n7), .C1(n142), 
        .Y(n81) );
  AOI221XLM U66 ( .A0(n6), .A1(n44), .B0(n8), .B1(n61), .C0(n83), .Y(n82) );
  OAI21X2M U67 ( .A0(n84), .A1(n131), .B0(n85), .Y(n83) );
  AOI221XLM U68 ( .A0(n56), .A1(n139), .B0(n7), .B1(n55), .C0(n142), .Y(n84)
         );
  AOI22X1M U69 ( .A0(N114), .A1(n126), .B0(n86), .B1(n131), .Y(n85) );
  OAI221X1M U70 ( .A0(n7), .A1(n143), .B0(n146), .B1(n139), .C0(n145), .Y(n86)
         );
  OAI21X2M U71 ( .A0(n77), .A1(n130), .B0(n78), .Y(n76) );
  AOI221XLM U72 ( .A0(n56), .A1(n138), .B0(n8), .B1(n55), .C0(n142), .Y(n77)
         );
  AOI22X1M U73 ( .A0(N115), .A1(n126), .B0(n79), .B1(n130), .Y(n78) );
  OAI221X1M U74 ( .A0(n8), .A1(n143), .B0(n146), .B1(n138), .C0(n145), .Y(n79)
         );
  AOI31X2M U75 ( .A0(n73), .A1(n74), .A2(n75), .B0(n151), .Y(N176) );
  AOI22X1M U76 ( .A0(sub[4]), .A1(n46), .B0(sum[4]), .B1(n45), .Y(n73) );
  AOI222X1M U77 ( .A0(N98), .A1(n41), .B0(n57), .B1(n138), .C0(n8), .C1(n142), 
        .Y(n74) );
  AOI221XLM U78 ( .A0(n7), .A1(n44), .B0(n61), .B1(n9), .C0(n76), .Y(n75) );
  AOI31X2M U79 ( .A0(n66), .A1(n67), .A2(n68), .B0(n151), .Y(N177) );
  AOI22X1M U80 ( .A0(sub[5]), .A1(n46), .B0(sum[5]), .B1(n45), .Y(n66) );
  AOI222X1M U81 ( .A0(N99), .A1(n41), .B0(n57), .B1(n137), .C0(n9), .C1(n142), 
        .Y(n67) );
  AOI221XLM U82 ( .A0(n8), .A1(n44), .B0(n61), .B1(n10), .C0(n69), .Y(n68) );
  AOI31X2M U83 ( .A0(n58), .A1(n59), .A2(n60), .B0(n151), .Y(N178) );
  AOI22X1M U84 ( .A0(sub[6]), .A1(n46), .B0(sum[6]), .B1(n45), .Y(n58) );
  AOI221XLM U85 ( .A0(n9), .A1(n44), .B0(n61), .B1(n11), .C0(n62), .Y(n60) );
  AOI222X1M U86 ( .A0(N100), .A1(n41), .B0(n57), .B1(n136), .C0(n142), .C1(n10), .Y(n59) );
  OAI21X2M U87 ( .A0(n70), .A1(n129), .B0(n71), .Y(n69) );
  AOI221XLM U88 ( .A0(n56), .A1(n137), .B0(n9), .B1(n55), .C0(n142), .Y(n70)
         );
  AOI22X1M U89 ( .A0(N116), .A1(n126), .B0(n72), .B1(n129), .Y(n71) );
  OAI221X1M U90 ( .A0(n9), .A1(n143), .B0(n146), .B1(n137), .C0(n145), .Y(n72)
         );
  AOI31X2M U91 ( .A0(n40), .A1(n42), .A2(n43), .B0(n151), .Y(N180) );
  NAND2X2M U92 ( .A(sum[8]), .B(n45), .Y(n42) );
  AOI22X1M U93 ( .A0(n11), .A1(n44), .B0(N102), .B1(n41), .Y(n43) );
  INVX2M U94 ( .A(n54), .Y(n134) );
  AOI221XLM U95 ( .A0(n55), .A1(n11), .B0(n135), .B1(n56), .C0(n142), .Y(n54)
         );
  OAI221X1M U96 ( .A0(n11), .A1(n143), .B0(n135), .B1(n146), .C0(n145), .Y(n53) );
  AOI21X2M U97 ( .A0(sub_16), .A1(n46), .B0(n47), .Y(n40) );
  OAI21X2M U98 ( .A0(n63), .A1(n128), .B0(n64), .Y(n62) );
  AOI221XLM U99 ( .A0(n56), .A1(n136), .B0(n10), .B1(n55), .C0(n142), .Y(n63)
         );
  AOI22X1M U100 ( .A0(N117), .A1(n126), .B0(n65), .B1(n128), .Y(n64) );
  OAI221X1M U101 ( .A0(n10), .A1(n143), .B0(n146), .B1(n136), .C0(n145), .Y(
        n65) );
  AND4X2M U102 ( .A(N153), .B(n3), .C(n116), .D(ALU_FUN[2]), .Y(n103) );
  NOR2X2M U103 ( .A(ALU_FUN[1]), .B(ALU_FUN[0]), .Y(n116) );
  INVX2M U104 ( .A(n5), .Y(n122) );
  BUFX2M U105 ( .A(ALU_FUN[3]), .Y(n3) );
  INVX2M U106 ( .A(n117), .Y(n126) );
  OAI211X2M U107 ( .A0(n118), .A1(n119), .B0(n120), .C0(ALU_FUN[0]), .Y(n117)
         );
  NAND4X2M U108 ( .A(n130), .B(n129), .C(n128), .D(n127), .Y(n118) );
  NAND4X2M U109 ( .A(n123), .B(n133), .C(n132), .D(n131), .Y(n119) );
  INVX2M U110 ( .A(n11), .Y(n135) );
  INVX2M U111 ( .A(n10), .Y(n136) );
  INVX2M U112 ( .A(n4), .Y(n141) );
  INVX2M U113 ( .A(n6), .Y(n140) );
  INVX2M U114 ( .A(n7), .Y(n139) );
  INVX2M U115 ( .A(n9), .Y(n137) );
  INVX2M U116 ( .A(n8), .Y(n138) );
  BUFX2M U117 ( .A(A[6]), .Y(n10) );
  BUFX2M U118 ( .A(A[7]), .Y(n11) );
  BUFX2M U119 ( .A(A[5]), .Y(n9) );
  BUFX2M U120 ( .A(A[4]), .Y(n8) );
  BUFX2M U121 ( .A(A[3]), .Y(n7) );
  BUFX2M U122 ( .A(A[2]), .Y(n6) );
  BUFX2M U123 ( .A(A[1]), .Y(n5) );
  BUFX2M U124 ( .A(A[0]), .Y(n4) );
  AOI31X2M U125 ( .A0(n48), .A1(n49), .A2(n50), .B0(n151), .Y(N179) );
  AOI22X1M U126 ( .A0(n10), .A1(n44), .B0(n57), .B1(n135), .Y(n48) );
  AOI222X1M U127 ( .A0(B[7]), .A1(n134), .B0(N118), .B1(n126), .C0(n53), .C1(
        n127), .Y(n49) );
  AOI221XLM U128 ( .A0(sub[7]), .A1(n46), .B0(sum[7]), .B1(n45), .C0(n51), .Y(
        n50) );
  INVX2M U129 ( .A(n12), .Y(n124) );
  OAI22X1M U130 ( .A0(n110), .A1(n123), .B0(B[0]), .B1(n111), .Y(n109) );
  AOI221XLM U131 ( .A0(n56), .A1(n141), .B0(n4), .B1(n55), .C0(n142), .Y(n110)
         );
  AOI221XLM U132 ( .A0(n4), .A1(n56), .B0(n47), .B1(n141), .C0(n57), .Y(n111)
         );
  OAI22X1M U133 ( .A0(n99), .A1(n133), .B0(B[1]), .B1(n100), .Y(n98) );
  AOI221XLM U134 ( .A0(n56), .A1(n122), .B0(n5), .B1(n55), .C0(n142), .Y(n99)
         );
  AOI221XLM U135 ( .A0(n5), .A1(n56), .B0(n47), .B1(n122), .C0(n57), .Y(n100)
         );
  INVX2M U136 ( .A(n23), .Y(n125) );
  INVX2M U137 ( .A(B[0]), .Y(n123) );
  INVX2M U138 ( .A(B[6]), .Y(n128) );
  INVX2M U139 ( .A(B[3]), .Y(n131) );
  INVX2M U140 ( .A(B[2]), .Y(n132) );
  INVX2M U141 ( .A(B[4]), .Y(n130) );
  INVX2M U142 ( .A(B[5]), .Y(n129) );
  INVX2M U143 ( .A(B[1]), .Y(n133) );
  INVX2M U144 ( .A(B[7]), .Y(n127) );
  NOR2X1M U145 ( .A(n135), .B(B[7]), .Y(n34) );
  NAND2BX1M U146 ( .AN(B[4]), .B(n8), .Y(n27) );
  NAND2BX1M U147 ( .AN(n8), .B(B[4]), .Y(n16) );
  CLKNAND2X2M U148 ( .A(n27), .B(n16), .Y(n29) );
  NOR2X1M U149 ( .A(n131), .B(n7), .Y(n24) );
  NOR2X1M U150 ( .A(n132), .B(n6), .Y(n15) );
  NOR2X1M U151 ( .A(n123), .B(n4), .Y(n12) );
  CLKNAND2X2M U152 ( .A(n6), .B(n132), .Y(n26) );
  NAND2BX1M U153 ( .AN(n15), .B(n26), .Y(n21) );
  AOI21X1M U154 ( .A0(n12), .A1(n122), .B0(B[1]), .Y(n13) );
  AOI211X1M U155 ( .A0(n5), .A1(n124), .B0(n21), .C0(n13), .Y(n14) );
  CLKNAND2X2M U156 ( .A(n7), .B(n131), .Y(n25) );
  OAI31X1M U157 ( .A0(n24), .A1(n15), .A2(n14), .B0(n25), .Y(n17) );
  NAND2BX1M U158 ( .AN(n9), .B(B[5]), .Y(n32) );
  OAI211X1M U159 ( .A0(n29), .A1(n17), .B0(n16), .C0(n32), .Y(n18) );
  NAND2BX1M U160 ( .AN(B[5]), .B(n9), .Y(n28) );
  XNOR2X1M U161 ( .A(n10), .B(B[6]), .Y(n31) );
  AOI32X1M U162 ( .A0(n18), .A1(n28), .A2(n31), .B0(B[6]), .B1(n136), .Y(n19)
         );
  CLKNAND2X2M U163 ( .A(B[7]), .B(n135), .Y(n35) );
  OAI21X1M U164 ( .A0(n34), .A1(n19), .B0(n35), .Y(N153) );
  CLKNAND2X2M U165 ( .A(n4), .B(n123), .Y(n22) );
  OA21X1M U166 ( .A0(n22), .A1(n122), .B0(B[1]), .Y(n20) );
  AOI211X1M U167 ( .A0(n22), .A1(n122), .B0(n21), .C0(n20), .Y(n23) );
  AOI31X1M U168 ( .A0(n125), .A1(n26), .A2(n25), .B0(n24), .Y(n30) );
  OAI2B11X1M U169 ( .A1N(n30), .A0(n29), .B0(n28), .C0(n27), .Y(n33) );
  AOI32X1M U170 ( .A0(n33), .A1(n32), .A2(n31), .B0(n10), .B1(n128), .Y(n36)
         );
  AOI2B1X1M U171 ( .A1N(n36), .A0(n35), .B0(n34), .Y(n37) );
  CLKINVX1M U172 ( .A(n37), .Y(N152) );
  NOR2X1M U173 ( .A(N153), .B(N152), .Y(N151) );
endmodule


module CLK_GATING ( CLK, CLK_EN, test_mode, GATED_CLK );
  input CLK, CLK_EN, test_mode;
  output GATED_CLK;
  wire   _0_net_;

  TLATNCAX4M U0_TLATNCAX4M ( .E(_0_net_), .CK(CLK), .ECK(GATED_CLK) );
  OR2X2M U1 ( .A(CLK_EN), .B(test_mode), .Y(_0_net_) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error );
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   D1_SYNC_RST, D2_SYNC_RST, RX_VALID, SYNC_RX_VALID, FIFO_WRITE_INC,
         TX_CLK, READ_INC, FIFO_FULL, FIFO_EMPTY, TX_BUSY, RX_CLK, ALU_VALID,
         REG_FILE_READ_OUT_VALID, ALU_EN, CLK_GATING_ALU_EN, REG_FILE_WRITE_EN,
         REG_FILE_READ_EN, ALU_CLK, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15;
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

  RST_Sync_NUM_STAGES2_0 D1 ( .CLK(REF_CLK), .RST(RST_N), .SYNC_RST(
        D1_SYNC_RST) );
  RST_Sync_NUM_STAGES2_1 D2 ( .CLK(UART_CLK), .RST(RST_N), .SYNC_RST(
        D2_SYNC_RST) );
  Data_Sync_NUM_STAGES2_BUS_WIDTH8 DATA_SYNC ( .bus_enable(RX_VALID), .CLK(
        REF_CLK), .RST(n14), .unsync_bus(RX_OUT), .enable_pulse(SYNC_RX_VALID), 
        .sync_bus(SYNC_RX_OUT) );
  fifo_top_width8 FIFO ( .W_CLK(REF_CLK), .W_RST(n14), .W_INC(FIFO_WRITE_INC), 
        .R_CLK(TX_CLK), .R_RST(n12), .R_INC(READ_INC), .WR_DATA(FIFO_DATA_IN), 
        .RD_DATA(READ_FIFO_DATA), .FULL(FIFO_FULL), .EMPTY(FIFO_EMPTY) );
  PULSE_GEN PULSE_GENERATOR ( .clk(TX_CLK), .rst(n12), .lvl_sig(TX_BUSY), 
        .pulse_sig(READ_INC) );
  ClkDiv_0 TX_CLK_DIV ( .i_ref_clk(UART_CLK), .i_rst(n12), .i_clk_en(1'b1), 
        .i_div_ratio(DIV_RATIO), .o_div_clk(TX_CLK) );
  CLKDIV_MUX CLK_DIV_N ( .IN({UART_Config[7], n10, n8, n6, n4, UART_Config[2]}), .OUT({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, RX_DIV_Ratio[3:0]})
         );
  ClkDiv_1 RX_CLK_DIV ( .i_ref_clk(UART_CLK), .i_rst(n12), .i_clk_en(1'b1), 
        .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, RX_DIV_Ratio[3:0]}), .o_div_clk(
        RX_CLK) );
  UART_TOP UART ( .TX_CLK(TX_CLK), .RX_CLK(RX_CLK), .RST(n12), .PAR_TYP(
        UART_Config[1]), .PAR_EN(UART_Config[0]), .Prescale({UART_Config[7], 
        n10, n8, n6, n4, UART_Config[2]}), .TX_IN_P(READ_FIFO_DATA), .TX_IN_V(
        n1), .RX_IN_S(UART_RX_IN), .TX_OUT_S(UART_TX_O), .TX_OUT_V(TX_BUSY), 
        .RX_OUT_P(RX_OUT), .RX_OUT_V(RX_VALID), .STOP_ERROR(framing_error), 
        .PARITY_ERROR(parity_error) );
  SYS_CTRL CTRL_UNIT ( .ALU_OUT(ALU_OUT), .ALU_Valid(ALU_VALID), 
        .RdData_REG_FILE(REG_FILE_READ_OUT), .RdData_Valid_REG_FILE(
        REG_FILE_READ_OUT_VALID), .RX_P_DATA(SYNC_RX_OUT), .RX_D_VLD(
        SYNC_RX_VALID), .CLK(REF_CLK), .RST(n14), .FIFO_FULL(FIFO_FULL), 
        .ALU_FUN(ALU_FUN), .EN_ALU(ALU_EN), .CLK_GATING_ALU_EN(
        CLK_GATING_ALU_EN), .Address_REG_FILE(REG_FILE_ADDRESS), 
        .WrEn_REG_FILE(REG_FILE_WRITE_EN), .RdEn_REG_FILE(REG_FILE_READ_EN), 
        .WrData_REG_FILE(REG_FILE_WRITE_DATA_IN), .FIFO_WRITE_DATA(
        FIFO_DATA_IN), .FIFO_WRITE_INC(FIFO_WRITE_INC) );
  RAM REG_FILE ( .CLK(REF_CLK), .RST(n14), .Address({REG_FILE_ADDRESS[3:2], n3, 
        n2}), .WrE(REG_FILE_WRITE_EN), .RdEn(REG_FILE_READ_EN), .WrData(
        REG_FILE_WRITE_DATA_IN), .RdData(REG_FILE_READ_OUT), .RdData_Valid(
        REG_FILE_READ_OUT_VALID), .REG0(OP_A), .REG1(OP_B), .REG2(UART_Config), 
        .REG3(DIV_RATIO) );
  ALU_16_bit_OPERAND_WIDTH8_OPCODE_WIDTH4_RESULT_WIDTH16 ALU ( .A(OP_A), .B(
        OP_B), .ALU_FUN(ALU_FUN), .CLK(ALU_CLK), .RST(n14), .ALU_Enable(ALU_EN), .ALU_OUT(ALU_OUT), .OUT_VALID(ALU_VALID) );
  CLK_GATING ALU_GATING_CLK ( .CLK(REF_CLK), .CLK_EN(CLK_GATING_ALU_EN), 
        .test_mode(1'b0), .GATED_CLK(ALU_CLK) );
  INVX2M U2 ( .A(n13), .Y(n12) );
  INVX2M U3 ( .A(FIFO_EMPTY), .Y(n1) );
  INVX4M U4 ( .A(n15), .Y(n14) );
  INVX2M U5 ( .A(D1_SYNC_RST), .Y(n15) );
  BUFX2M U6 ( .A(REG_FILE_ADDRESS[0]), .Y(n2) );
  BUFX2M U7 ( .A(REG_FILE_ADDRESS[1]), .Y(n3) );
  INVX2M U8 ( .A(D2_SYNC_RST), .Y(n13) );
  INVX2M U9 ( .A(n7), .Y(n6) );
  INVX2M U10 ( .A(UART_Config[4]), .Y(n7) );
  INVX2M U11 ( .A(n9), .Y(n8) );
  INVX2M U12 ( .A(UART_Config[5]), .Y(n9) );
  INVX2M U13 ( .A(n11), .Y(n10) );
  INVX2M U14 ( .A(UART_Config[6]), .Y(n11) );
  INVX2M U15 ( .A(n5), .Y(n4) );
  INVX2M U16 ( .A(UART_Config[3]), .Y(n5) );
endmodule


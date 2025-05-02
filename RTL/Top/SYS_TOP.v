module SYS_TOP 
(
 input   wire                          RST_N,
 input   wire                          UART_CLK,
 input   wire                          REF_CLK,
 input   wire                          UART_RX_IN,
 output  wire                          UART_TX_O,
 output  wire                          parity_error,
 output  wire                          framing_error
);

wire D1_SYNC_RST ; //REF_CLK (REG_FILE / ALU / SYS_CTRL / FIFO )
wire D2_SYNC_RST ; //UART_CLK (CLK_DIV / UART / DATA SYNC)
wire RX_VALID    ;  
wire RX_CLK , TX_CLK , ALU_CLK;
wire [7:0] RX_OUT;
wire SYNC_RX_VALID;
wire [7:0] SYNC_RX_OUT;
wire READ_INC;
wire [7:0] READ_FIFO_DATA;
wire FIFO_FULL;
wire FIFO_EMPTY;
wire TX_BUSY;

wire [7:0] OP_A;
wire [7:0] OP_B;
wire [7:0] DIV_RATIO;
wire CLK_DIV_EN;


wire [7:0] UART_Config; 
wire START_ERROR_TEMP;
wire [7:0] RX_DIV_Ratio;

wire [7:0] REG_FILE_READ_OUT;
wire REG_FILE_READ_OUT_VALID;
wire [3:0] ALU_FUN;
wire ALU_EN;
wire ALU_VALID;
wire CLK_GATING_ALU_EN;
wire [3:0] REG_FILE_ADDRESS;
wire REG_FILE_WRITE_EN;
wire REG_FILE_READ_EN;
wire [7:0] REG_FILE_WRITE_DATA_IN;
wire [7:0] FIFO_DATA_IN;
wire FIFO_WRITE_INC;

wire [15:0] ALU_OUT;


///********************************************************///
//////////////////// Reset synchronizers /////////////////////
///********************************************************///
RST_Sync #(.NUM_STAGES (2))  D1 (.CLK(REF_CLK)  , .RST(RST_N) , .SYNC_RST(D1_SYNC_RST) );
RST_Sync #(.NUM_STAGES (2))  D2 (.CLK(UART_CLK) , .RST(RST_N) , .SYNC_RST(D2_SYNC_RST) );


///********************************************************///
///////////////////// Data Synchronizers /////////////////////
///********************************************************///
Data_Sync #( .NUM_STAGES (2), .BUS_WIDTH(8))  DATA_SYNC (.bus_enable(RX_VALID), .CLK(REF_CLK) , .RST(D1_SYNC_RST) , .unsync_bus(RX_OUT),
                                                         .enable_pulse(SYNC_RX_VALID) , .sync_bus(SYNC_RX_OUT));


///********************************************************///
///////////////////////// Async FIFO /////////////////////////
///********************************************************///

 fifo_top #(.width(8)) FIFO ( .W_CLK(REF_CLK) , .W_RST(D1_SYNC_RST) , .W_INC(FIFO_WRITE_INC) , .R_CLK(TX_CLK) , .R_RST(D2_SYNC_RST) , .R_INC(READ_INC) , 
                             .WR_DATA(FIFO_DATA_IN) ,.RD_DATA(READ_FIFO_DATA) ,  .FULL(FIFO_FULL) , .EMPTY(FIFO_EMPTY));

///********************************************************///
//////////////////////// Pulse Generator /////////////////////
///********************************************************///
PULSE_GEN PULSE_GENERATOR (.clk(TX_CLK) , .rst(D2_SYNC_RST) , .lvl_sig(TX_BUSY) , .pulse_sig(READ_INC));


///********************************************************///
//////////// Clock Divider for UART_TX Clock /////////////////
///********************************************************///
ClkDiv TX_CLK_DIV (.i_ref_clk(UART_CLK) , .i_rst(D2_SYNC_RST) , .i_clk_en(CLK_DIV_EN) , .i_div_ratio(DIV_RATIO) , .o_div_clk(TX_CLK) );

//Clk_Div TX_CLK_DIV ( .I_ref_clk(UART_CLK) , .I_rst_n(D2_SYNC_RST) , .I_clk_en(CLK_DIV_EN) ,.I_div_ratio(DIV_RATIO) ,.o_div_clk(TX_CLK));


///********************************************************///
/////////////////////// Custom Mux Clock /////////////////////
///********************************************************///

CLKDIV_MUX CLK_DIV_N (.IN(UART_Config[7:2]),.OUT(RX_DIV_Ratio) );

///********************************************************///
//////////// Clock Divider for UART_RX Clock /////////////////
///********************************************************///

ClkDiv RX_CLK_DIV (.i_ref_clk(UART_CLK) , .i_rst(D2_SYNC_RST) , .i_clk_en(CLK_DIV_EN) , .i_div_ratio(RX_DIV_Ratio) , .o_div_clk(RX_CLK) );

//Clk_Div RX_CLK_DIV ( .I_ref_clk(UART_CLK) , .I_rst_n(D2_SYNC_RST) , .I_clk_en(CLK_DIV_EN) ,.I_div_ratio(RX_DIV_Ratio) ,.o_div_clk(RX_CLK));

///********************************************************///
/////////////////////////// UART /////////////////////////////
///********************************************************///

UART_TOP UART (.TX_CLK(TX_CLK) , .RX_CLK(RX_CLK) , .RST(D2_SYNC_RST) , .PAR_TYP(UART_Config[1]) , .PAR_EN(UART_Config[0]) ,.Prescale(UART_Config[7:2]) ,
               .TX_IN_P(READ_FIFO_DATA), .TX_IN_V(!FIFO_EMPTY), .RX_IN_S(UART_RX_IN),
               .TX_OUT_S(UART_TX_O) , .TX_OUT_V(TX_BUSY) , .RX_OUT_P(RX_OUT) , .RX_OUT_V(RX_VALID) , .STOP_ERROR(framing_error) , 
               .PARITY_ERROR(parity_error) , .START_GLITCH(START_ERROR_TEMP));

///********************************************************///
//////////////////// System Controller ///////////////////////
///********************************************************///


SYS_CTRL CTRL_UNIT (.ALU_OUT(ALU_OUT)        ,  .ALU_Valid(ALU_VALID)     ,     .RdData_REG_FILE(REG_FILE_READ_OUT)   , .RdData_Valid_REG_FILE(REG_FILE_READ_OUT_VALID), 
                    .RX_P_DATA(SYNC_RX_OUT)  ,  .RX_D_VLD(SYNC_RX_VALID)  ,     .CLK(REF_CLK)                         , .RST(D1_SYNC_RST)   , .FIFO_FULL(FIFO_FULL)    , 
                    .ALU_FUN(ALU_FUN)        ,  .EN_ALU(ALU_EN)           ,     .CLK_GATING_ALU_EN(CLK_GATING_ALU_EN) , .Address_REG_FILE(REG_FILE_ADDRESS)            , 
                    .WrEn_REG_FILE(REG_FILE_WRITE_EN)                     ,     .RdEn_REG_FILE(REG_FILE_READ_EN)      , .WrData_REG_FILE(REG_FILE_WRITE_DATA_IN)       , 
                    .FIFO_WRITE_DATA(FIFO_DATA_IN)                        ,     .FIFO_WRITE_INC(FIFO_WRITE_INC)       , .clk_div_en(CLK_DIV_EN)                       );



///********************************************************///
/////////////////////// Register File ////////////////////////
///********************************************************///

//UART_Config

RAM REG_FILE (.CLK(REF_CLK) , .RST(D1_SYNC_RST) , .Address(REG_FILE_ADDRESS) , .WrE(REG_FILE_WRITE_EN) , .RdEn(REG_FILE_READ_EN) , .WrData(REG_FILE_WRITE_DATA_IN) ,  
              .RdData(REG_FILE_READ_OUT)        , .RdData_Valid(REG_FILE_READ_OUT_VALID)               , .REG0(OP_A)             , .REG1(OP_B),
              .REG2(UART_Config)                , .REG3(DIV_RATIO) );


///********************************************************///
//////////////////////////// ALU /////////////////////////////
///********************************************************///
 
ALU_16_bit #(.OPERAND_WIDTH (8), .OPCODE_WIDTH (4) , .RESULT_WIDTH (16) )  ALU ( .A(OP_A) , .B(OP_B) , .ALU_FUN(ALU_FUN) , .CLK(ALU_CLK) , .RST(D1_SYNC_RST), 
                                                                                .ALU_Enable(ALU_EN) , .ALU_OUT(ALU_OUT) , .OUT_VALID(ALU_VALID));

                                                                                

///********************************************************///
///////////////////////// Clock Gating ///////////////////////
///********************************************************///

CLK_GATING ALU_GATING_CLK (.CLK(REF_CLK) , .CLK_EN(CLK_GATING_ALU_EN) , .GATED_CLK(ALU_CLK));


endmodule
 


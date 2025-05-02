module UART_TOP (input TX_CLK , RX_CLK , RST , PAR_TYP , PAR_EN , input [5:0] Prescale , input [7:0] TX_IN_P, input TX_IN_V, RX_IN_S,
                 output TX_OUT_S , TX_OUT_V , output [7:0] RX_OUT_P , output RX_OUT_V , STOP_ERROR , PARITY_ERROR , START_GLITCH);

              
UART_RX RX (.RX_IN(RX_IN_S) , .CLK(RX_CLK) , .RST(RST) , .PAR_EN(PAR_EN) , .PAR_TYPE(PAR_TYP), .prescale(Prescale) ,.DATA_VALID(RX_OUT_V),
            .P_DATA(RX_OUT_P), .STOP_ERROR(STOP_ERROR) , .PARITY_ERROR(PARITY_ERROR) , .START_GLITCH(START_GLITCH) );
UART_TX TX (.Data(TX_IN_P) , .valid(TX_IN_V) , .par_en(PAR_EN) , .par_type(PAR_TYP) , .CLK(TX_CLK) , .RST(RST) ,  .Tx_out(TX_OUT_S) , .busy(TX_OUT_V));

endmodule
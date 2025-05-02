module UART_RX (input RX_IN , CLK , RST , PAR_EN , PAR_TYPE,input [5:0] prescale ,output DATA_VALID, output [7:0] P_DATA, output STOP_ERROR , PARITY_ERROR , START_GLITCH );

wire start_check_en , sampled_bit  , stop_check_en , data_sample_en , par_chk_en , deser_en , enable , rst_all ;

wire [3:0] bit_count;

wire [4:0] edge_count;

start_check Sr (start_check_en, CLK , RST , rst_all , sampled_bit , START_GLITCH);

stop_check  Sp (stop_check_en, CLK , RST , rst_all , sampled_bit , STOP_ERROR);

FSM_RX  F ( RX_IN , CLK , RST , PAR_EN , PARITY_ERROR , START_GLITCH , STOP_ERROR , bit_count ,  edge_count , prescale,
              data_sample_en , par_chk_en , start_check_en , stop_check_en , DATA_VALID , deser_en , enable , rst_all);

edge_bit_counter EBC ( enable , RST , CLK , rst_all , prescale ,bit_count , edge_count );

data_sampling DS (edge_count , data_sample_en , RX_IN, CLK , RST , rst_all , prescale ,sampled_bit);

deserializer DZ ( sampled_bit ,  CLK , RST , rst_all , deser_en , P_DATA);

parity_check P ( P_DATA , CLK , RST , rst_all ,  par_chk_en , PAR_TYPE, sampled_bit , PARITY_ERROR);

endmodule
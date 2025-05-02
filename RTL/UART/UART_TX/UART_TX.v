module UART_TX (input [7:0] Data , input valid , par_en , par_type , CLK , RST , output Tx_out , busy);

wire capture , ser_done , ser_en , ser_data , parity;
wire [1:0] mux;

FSM F1 (valid , par_en , ser_done , CLK , RST ,mux , busy , capture , ser_en);
Serializer S1 (Data , ser_en , CLK , RST , capture , ser_done , ser_data);
parity_checker P1 (Data, par_type, CLK , RST , capture ,parity);
MUX M1 (mux , ser_data, parity , CLK , RST,  Tx_out);

endmodule

//module FSM (input Data_valid , Par_en , Ser_done , CLK , RST ,output reg [1:0] mux , reg busy , capture , Ser_en);
//module serializer (input [7:0] Data , input Ser_en , CLK , capture , output reg Ser_done , Ser_data);
//module parity_checker (input [7:0]P_DATA, input PAR_TYPE , input capture , output reg parity);
//module MUX (input [1:0] mux_sel,input ser_data, parity, CLK , output reg TX_OUT);

    
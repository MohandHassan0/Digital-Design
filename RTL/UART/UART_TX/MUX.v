module MUX (input [1:0] mux_sel,input ser_data, parity ,CLK , RST, output reg TX_OUT);
reg out;
always @(*) 
begin
	case (mux_sel) 
		2'b00  : out=0;
		2'b01  : out=1;
		2'b10  : out=ser_data;
		2'b11  : out=parity;
	endcase
end

always @(posedge CLK or negedge RST)
begin 
	if (!RST)
	TX_OUT<=1;
	else 
	TX_OUT<=out;
end 


endmodule 


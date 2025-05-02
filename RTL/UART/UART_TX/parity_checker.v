module parity_checker (input [7:0]P_DATA, input PAR_TYPE , CLK , RST, input capture , output reg parity);

always @(posedge CLK or negedge RST) 
begin
	if (!RST)
	 parity<=0;
	else if (capture) 
		begin
			if (PAR_TYPE)
				parity<=~(^P_DATA);
			else 
				parity<=(^P_DATA);
		end
	else parity<=parity;
end

endmodule


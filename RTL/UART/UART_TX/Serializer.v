module Serializer (input [7:0] Data , input Ser_en ,CLK , RST , capture , output reg Ser_done , Ser_data);

reg [2:0] counter;
reg [7:0] internal;
always @(posedge CLK or negedge RST)
begin
	if (!RST)
	begin
		 counter <=0; Ser_done<=0; internal<=0;  
	end
	else if (Ser_en) begin
		if (capture) begin
			counter<=1;
			internal<=Data;
			Ser_done<=0;
			Ser_data<=Data[0];
		end
		else if (counter<7)
		begin
			Ser_data<=internal[counter];
			counter<=counter+1;
			Ser_done<=0;
		end
		else begin
			Ser_data<=internal[counter];
			counter<=0;
			Ser_done<=1;
		end
	end
	else begin Ser_done<=0; Ser_data<=0; counter <=0; internal <=0 ; end
end


endmodule

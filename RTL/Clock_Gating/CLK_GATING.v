module CLK_GATING (input CLK ,input CLK_EN ,input test_mode , output GATED_CLK);

/*
reg FF;

assign GATED_CLK= FF && CLK;

always@(CLK)
begin
   if (!CLK)
   FF <= CLK_EN;
end
*/

TLATNCAX4M U0_TLATNCAX4M (
.E(CLK_EN|test_mode),
.CK(CLK),
.ECK(GATED_CLK)
);

endmodule 

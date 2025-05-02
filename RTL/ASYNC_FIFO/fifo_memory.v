module fifo_memory #(parameter data_width = 8) (input [data_width-1:0] w_data ,input full , w_inc, CLK , RST ,input [2:0] w_address , input [2:0] r_address,output [data_width-1:0] r_data);
//only one parameter because data in = data out assumption 
reg [4:0] i;
reg [data_width-1:0] Memory [7:0];
assign r_data = Memory [r_address];
wire w_en;
assign w_en = w_inc & (!full);
always@(posedge CLK or negedge RST)
begin

if (!RST) 
    begin
        for(i=0;i<data_width;i=i+1)
            Memory[i]<=0;
    end

else if (w_en)
    Memory[w_address]<=w_data;
end





endmodule
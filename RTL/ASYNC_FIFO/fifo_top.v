module fifo_top #(parameter width=8)(input W_CLK , W_RST , W_INC , R_CLK , R_RST , R_INC , input [width-1:0] WR_DATA ,output [width-1:0] RD_DATA , output FULL , EMPTY);

//fifo_wptr_full (input w_inc , CLK , RST , input [2:0] r_ptr_syncronized , output [2:0] w_address,  output [3:0] w_ptr,output w_full);
//fifo_rptr_empty (input r_inc , CLK , RST , input [3:0] r_ptr_syncronized , output [2:0] r_address, output [3:0] r_ptr,output r_empty);
//fifo_memory #(parameter data_width = 8) (input [data_width-1:0] w_data ,input full , w_inc, CLK , RST ,input [2:0] w_address , input [2:0] r_address,output [data_width-1:0] r_data);
//data_sync (input [3:0] insertion , output reg [3:0] out , input CLK , RST);

wire [3:0] rptr,wptr,rptr_s,wptr_s;
wire [2:0] w_address,r_address;

fifo_wptr_full Write_Full (.w_inc(W_INC), .CLK(W_CLK) , .RST(W_RST) , .r_ptr_syncronized(rptr_s) , .w_address(w_address), .w_ptr(wptr) ,.w_full(FULL));
data_sync_fifo Data_Sync_Write_Block (.insertion(rptr) , .out(rptr_s) , .CLK(W_CLK) , .RST(W_RST)); 

fifo_rptr_empty Read_Empty( .r_inc(R_INC) , .CLK(R_CLK) , .RST(R_RST) , .w_ptr_syncronized(wptr_s) , .r_address(r_address),  .r_ptr(rptr) , .r_empty(EMPTY));
data_sync_fifo Data_Sync_Read_Block (.insertion(wptr) , .out(wptr_s) , .CLK(R_CLK) , .RST(R_RST)); 

fifo_memory #(.data_width(8)) Memory(.w_data(WR_DATA) , .full(FULL) ,  .w_inc(W_INC), .CLK(W_CLK) , 
                                        .RST(W_RST) , .w_address(w_address) ,  .r_address(r_address), .r_data(RD_DATA));

endmodule
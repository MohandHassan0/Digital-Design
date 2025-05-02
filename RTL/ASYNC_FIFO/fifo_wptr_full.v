module fifo_wptr_full (input w_inc , CLK , RST , input [3:0] r_ptr_syncronized , output [2:0] w_address,  output [3:0] w_ptr,output w_full);

reg  [3:0] internal; 
wire [3:0] gray; 

assign w_full = (RST) ? ((gray[3]!=r_ptr_syncronized[3])&(gray[2]!=r_ptr_syncronized[2])&(gray[1:0]==r_ptr_syncronized[1:0])) : 0;
assign w_address=internal[2:0];
assign w_ptr= gray[3:0];
assign gray= {internal[3],(internal[3]^internal[2]),(internal[2]^internal[1]),(internal[1]^internal[0])};

always@(posedge CLK or negedge RST)
begin
  if (!RST)
    begin
        internal<=0;
    end
    else 
    begin
        if (w_inc) 
        begin 
            if (!w_full)
                begin
                    internal<=internal+1;
                end
        end
    end
end

endmodule
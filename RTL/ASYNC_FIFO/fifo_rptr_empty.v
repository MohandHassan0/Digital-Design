module fifo_rptr_empty (input r_inc , CLK , RST , input [3:0] w_ptr_syncronized , output [2:0] r_address, output [3:0] r_ptr,output r_empty);

reg  [3:0] internal; 
wire [3:0] gray; 

assign r_empty = (RST) ? (gray == w_ptr_syncronized) : 0;
assign r_address=internal[2:0];
assign r_ptr= gray[3:0];
assign gray= {internal[3],(internal[3]^internal[2]),(internal[2]^internal[1]),(internal[1]^internal[0])};

always@(posedge CLK or negedge RST)
begin
  if (!RST)
    begin
        internal<=0;
    end
    else 
    begin
        if (r_inc) 
        begin 
            if (!r_empty)
                begin
                    internal<=internal+1;
                end
        end
    end
end

endmodule
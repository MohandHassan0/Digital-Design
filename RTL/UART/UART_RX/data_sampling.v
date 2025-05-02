module data_sampling (input [4:0]edge_count ,input data_sample_en , RX_IN, CLK , RST , rst_all , input [5:0] prescale , output reg sampled_bit);

reg [2:0] sampled;
reg internal;

always @(posedge CLK or negedge RST) 
begin

if (!RST )
    begin 
        sampled<=0;
    end

else
 begin
    if (rst_all)
        begin 

            if (data_sample_en)
                begin
                          if (edge_count==((prescale>>1) -1))
                            begin
                                sampled[0] <= RX_IN;
                             end

                         else if (edge_count==(prescale>>1))
                           begin
                                sampled[1] <= RX_IN;
                            end

                        else if (edge_count==((prescale>>1) +1))
                            begin
                                sampled[2] <= RX_IN;
                            end 
                         end   
                        else begin sampled<=0; end 
        end
  else begin  sampled<=0; end
end
end 


always@(*)
begin
if (!RST )
    begin 
        sampled_bit=0;
    end
    else 
        begin
            if (edge_count==((prescale>>1) +2)||edge_count==((prescale>>1) +3)) 
            begin 
                    if (sampled[0] & sampled[1] & sampled[2] )              sampled_bit =1;
                    else if (~ (sampled[0] | sampled[1] | sampled[2]) )     sampled_bit =0;
                    else                                                    sampled_bit = ~(sampled[0] ^ sampled[1] ^ sampled[2]);
            end 
            else sampled_bit=0;

        end 
end

endmodule



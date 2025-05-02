module deserializer (input sampled_bit ,  CLK , RST, rst_all , deser_en , output reg [7:0]  P_DATA);
reg[2:0] bit;



always@(posedge CLK or negedge RST)
begin

    if(!RST)    
    begin
        bit<=0;
        P_DATA<=8'b0;
    end
    
    else 
    begin 
        if(!rst_all)
        begin
                bit<=0;
                P_DATA<=8'b0;
        end

        else if (deser_en)
        begin
                P_DATA[bit] <= sampled_bit;
                bit<=bit+1;
        end
    end
end

endmodule


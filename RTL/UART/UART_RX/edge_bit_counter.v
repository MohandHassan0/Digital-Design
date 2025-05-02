module edge_bit_counter (input enable , RST , CLK , rst_all , input [5:0] prescale, output reg [3:0] bit_count ,output reg [4:0] edge_count );

reg [5:0] prior;

always@(posedge CLK or negedge RST)
begin

    if(!RST)    
        begin 
            bit_count<=0;
            edge_count<=0;
            prior<=prescale;
        end 
    
    else 
    begin
            if (!rst_all)   
            begin
                bit_count<=0;
                edge_count<=0;
                prior<=prescale;
            end

            else if (enable)
            begin
    
        	    if (edge_count<(prescale-1))
	            begin
	                edge_count <=edge_count +1;
	                prior<=prescale;
	                bit_count <=bit_count;
	            end
           
                else
      	        begin 
                    bit_count <=bit_count+1;
                    edge_count <=0;
                    prior<=prescale;
      	        end
            end 
    
            else 
            begin  
                bit_count<=0;
                edge_count <=0;
                prior<=prescale;
            end

    end
end




endmodule


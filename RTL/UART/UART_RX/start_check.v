module  start_check (input start_check_en , CLK , RST , rst_all , start_bit , output reg start_glitch);


always@(posedge CLK or negedge RST)
begin

    if(!RST)    
    begin
         start_glitch<=0;
    end 
    
    else begin
          if (!rst_all) start_glitch<=0;
          
          else if (start_check_en) 
          begin
                if (start_bit == 0) start_glitch<=0;
    
                else start_glitch <= 1;
          end
    end
end

endmodule

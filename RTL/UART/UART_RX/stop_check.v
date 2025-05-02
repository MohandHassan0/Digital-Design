module  stop_check (input stop_check_en, CLK , RST , rst_all ,  stop_bit , output reg stop_error);


always@(posedge CLK or negedge RST)
begin

    if(!RST)    
    begin
         stop_error<=0;
    end 

    else 
    begin
            if(!rst_all) stop_error<=0;
            
            else if (stop_check_en) 
     
                if (stop_bit == 1) stop_error<=0;
     
                else stop_error <= 1;
	    
	    else stop_error<=stop_error;
    end
end

endmodule

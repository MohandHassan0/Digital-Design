module parity_check (input [7:0] Data , input CLK , RST , rst_all , par_check_en , par_type, sampled , output reg par_error);
reg comp;


always@(posedge CLK or negedge RST)
begin

    if(!RST)    
    begin
         comp=0;
         par_error=0;
    end 

    else
    begin
          
          if(!rst_all)
          begin
                comp=0;
                 par_error=0;
          end
          
          else if (par_check_en)
          begin 
              if (!par_type)
                    begin
                        comp = (^(Data));
                        if (sampled==comp) par_error=0;
                        else par_error=1;
                    end
              else 
                   begin
                        comp = !(^Data);
                        if (sampled==comp) par_error=0;
                        else par_error=1;
                    end
          end
    
    end
end
 

endmodule


module FSM_RX  (input RX_IN , CLK , RST , PAR_EN , par_error , strt_glitch , stp_error ,input [3:0] bit_count , input [4:0] edge_count , input [5:0] prescale,
             output reg data_sample_en , par_chk_en , strt_chk_en , stp_chk_en , data_valid , deser_en , enable, rst_all);
            
typedef enum bit [2:0] {
	IDLE                 = 3'b000,
	START_BIT            = 3'b001,
	DATA                 = 3'b011,
	PARITY_CHECK         = 3'b010,
	STOP_CHECK           = 3'b110,
    DATA_OUT             = 3'b111
} state_e;

state_e current_state,next_state;

wire [5:0] PRE_SCALE;
assign PRE_SCALE = prescale ? prescale : 32;

always @(posedge CLK or negedge RST) begin
if (!RST)
    begin 
        current_state<=IDLE;
    end
else 
    begin
        current_state <= next_state;
    end
end

always @(*) 
begin
case (current_state)
IDLE: begin
    data_sample_en=0;
    par_chk_en=0;
    strt_chk_en=0;
    stp_chk_en=0;
    data_valid=0;
    deser_en=0;
    enable=0;
    rst_all=0;

    if (~RX_IN)
    begin
    next_state = START_BIT;
    end
    else next_state = IDLE;
end

START_BIT: begin
    data_sample_en=0;
    par_chk_en=0;
    strt_chk_en=0;
    stp_chk_en=0;
    data_valid=0;
    deser_en=0;
    enable=1;
    rst_all=1;
    next_state=START_BIT;

    if (edge_count<((PRE_SCALE>>1) -1))  data_sample_en=0;
    
    else if (edge_count>=((PRE_SCALE>>1) +2)) 
    begin 
        data_sample_en=0;
    
        if (edge_count==((PRE_SCALE>>1) +2))
        begin 
            data_sample_en=1;
            strt_chk_en=1;
            deser_en=0;
            next_state=START_BIT;
        end 
    
      else if (edge_count==((PRE_SCALE>>1) +3))
        begin 
            strt_chk_en=0;
            deser_en=0;
            data_sample_en=0;
           
            if (strt_glitch==1) next_state = IDLE;
           
            else begin 
                if (PRE_SCALE==8) next_state = DATA;
                else next_state=START_BIT;
            end
        end 
       
       else if (edge_count==PRE_SCALE-1) begin next_state = DATA; data_sample_en=0; end 
       
       else begin next_state=START_BIT; data_sample_en=0; end;

    end
    
    else data_sample_en=1;
end


DATA: begin
    data_sample_en=0;
    par_chk_en=0;
    strt_chk_en=0;
    stp_chk_en=0;
    data_valid=0;
    deser_en=0;
    enable=1;
    next_state=DATA;
    rst_all=1;

    if (bit_count<9)
    begin
        if (edge_count<((PRE_SCALE>>1) -1)) data_sample_en=0;
        
        else if (edge_count>=((PRE_SCALE>>1) +2)) 
         begin 
            data_sample_en=0;
        
            if (edge_count==((PRE_SCALE>>1) +2))
            begin 
                data_sample_en=1;
            end

            else if (edge_count==((PRE_SCALE>>1) +3)) 
            begin 
                deser_en=1;
                if (PRE_SCALE==8)
                begin
                    if(bit_count==8) 
                    begin 
                        if(PAR_EN) next_state = PARITY_CHECK;
                        else next_state = STOP_CHECK;
                    end 
                    else next_state=DATA;
                end
                else  next_state=DATA;       
            end
        
            else if (edge_count==(PRE_SCALE-1) && bit_count==8)
              begin 
                if(PAR_EN) next_state = PARITY_CHECK;
                else next_state = STOP_CHECK; 
            end 
        
            else begin data_sample_en=0; deser_en=0; end
         end 
        
        else data_sample_en=1;
    end
    
    else next_state = IDLE; //there is an error bit count can't exceed 8 before go to the condition inside first if statement (no room of else execution only mmade to avoid latch)

    end
     
    
 

PARITY_CHECK: begin
    data_sample_en=0;
    par_chk_en=0;
    strt_chk_en=0;
    stp_chk_en=0;
    data_valid=0;
    deser_en=0;
    enable=1;
    rst_all=1;
    next_state = PARITY_CHECK;
    
    if (edge_count<((PRE_SCALE>>1) -1)) data_sample_en=0;
    
    else if (edge_count>((PRE_SCALE>>1) +1)) 
    begin 
        par_chk_en=0;
        if(edge_count==(PRE_SCALE>>1) +2) begin data_sample_en=1; par_chk_en=1; end
        else data_sample_en=0;
        
        
        if(edge_count == PRE_SCALE-1)
        begin
            par_chk_en=0;
            if (par_error==1) next_state = IDLE;
            else next_state=STOP_CHECK;
        end 
        else begin next_state=PARITY_CHECK; data_sample_en=1; end 
    end
         
     
    else begin
     
        data_sample_en=1;
        par_chk_en=0; 
        next_state=PARITY_CHECK; 
      
    end
   
 
end


STOP_CHECK: begin
    data_sample_en=0;
    par_chk_en=0;
    strt_chk_en=0;
    stp_chk_en=0;
    data_valid=0;
    deser_en=0;
    enable=1;
    rst_all=1;
    next_state = STOP_CHECK;
    
    if (edge_count<((PRE_SCALE>>1) -1)) data_sample_en=0;
   
    else if (edge_count>=((PRE_SCALE>>1) +2)) 
    begin 
        data_sample_en=0;
       
        if (edge_count==((PRE_SCALE>>1) +2))
        begin 
            stp_chk_en=0;
            data_sample_en=1;
        end 
       
       else if (edge_count==((PRE_SCALE>>1) +3))
        begin 
            stp_chk_en=1;
            data_sample_en=0;
            if (PRE_SCALE==8)
                    if (stp_error==1) next_state = IDLE;
                    else next_state=DATA_OUT;
            else next_state=STOP_CHECK;
             
        end 
     
      else begin
       
        if(edge_count==PRE_SCALE-1)
            begin  
               
                if (stp_error==1) next_state = IDLE;
               
                else next_state = DATA_OUT;
            end
       
        else next_state=STOP_CHECK;
    end
    
    end
   
    else data_sample_en=1;
end



DATA_OUT: begin
    data_sample_en=0;
    par_chk_en=0;
    strt_chk_en=0;
    stp_chk_en=0;
    data_valid=1;
    deser_en=0;
    enable=0;
    rst_all=1;

    if (RX_IN) next_state = IDLE;
    else next_state = START_BIT;
end

default: begin
    data_sample_en=0;
    par_chk_en=0;
    strt_chk_en=0;
    stp_chk_en=0;
    data_valid=0;
    deser_en=0;
    enable=0;
    rst_all=1;
    next_state = IDLE;
end

endcase
end
endmodule

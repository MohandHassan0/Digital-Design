module SYS_CTRL (input [15:0]ALU_OUT ,input ALU_Valid  ,input [7:0] RdData_REG_FILE , input RdData_Valid_REG_FILE , input [7:0] RX_P_DATA , 
                 input RX_D_VLD , CLK , RST , FIFO_FULL ,
                 output reg [3:0] ALU_FUN , output reg EN_ALU , output reg CLK_GATING_ALU_EN , 
                 output reg [3:0] Address_REG_FILE , output reg WrEn_REG_FILE , RdEn_REG_FILE , output reg [7:0] WrData_REG_FILE , FIFO_WRITE_DATA , 
                 output reg FIFO_WRITE_INC ,clk_div_en);

reg[3:0] ADDRESS_TEMP , FUN_TEMP;
reg one_inc;

typedef enum bit [3:0] {
	IDLE              = 4'b0000,
	
    WRITE_CMD         = 4'b0001,
    WRITE_ADDR        = 4'b0010,
    WRITE_DATA        = 4'b0011,

    READ_CMD          = 4'b0100,
    READ_ADDR         = 4'b0101,
    OUT_READ          = 4'b0110,

    ALU_W_OP_CMD      = 4'b0111,
    OP_A              = 4'b1000,
    OP_B              = 4'b1001,
    ALU_FUN_STATE     = 4'b1010,
    OUT_ALU_1         = 4'b1011,
    OUT_ALU_2         = 4'b1100,

    ALU_W_NOP_CMD     = 4'b1101
} state;

state current , next;


always@(posedge CLK or negedge RST )
begin 
    if(!RST)
        current<=IDLE;
    else 
        current<=next;
end 

always@(*)
begin 
case(current)

IDLE:begin 
    
    ALU_FUN=0;
    EN_ALU=0;
    CLK_GATING_ALU_EN=0;
    //Address_REG_FILE=0;
    WrEn_REG_FILE=0;
    RdEn_REG_FILE=0;
    WrData_REG_FILE=0;
    FIFO_WRITE_DATA=0;
    FIFO_WRITE_INC=0;
    clk_div_en=1;
    //ADDRESS_TEMP=0;
    FUN_TEMP=0;
    one_inc=0;
    

    if (RX_D_VLD)
    begin 
        if      (RX_P_DATA==8'b10101010) next= WRITE_CMD;
        else if (RX_P_DATA==8'b10111011) next= READ_ADDR;
        else if (RX_P_DATA==8'b11001100) next= OP_A;
        else if (RX_P_DATA==8'b11011101) next= ALU_FUN_STATE;
        else                       next= IDLE;
    end
    else                           next= IDLE;

end

WRITE_CMD:begin

    ALU_FUN=0;
    EN_ALU=0;
    CLK_GATING_ALU_EN=0;
    //Address_REG_FILE=0;
    WrEn_REG_FILE=0;
    RdEn_REG_FILE=0;
    WrData_REG_FILE=0;
    FIFO_WRITE_DATA=0;
    FIFO_WRITE_INC=0;
    clk_div_en=1;
    //ADDRESS_TEMP=0;
    FUN_TEMP=0;
    one_inc=0;
    
if (RX_D_VLD)
 next=WRITE_ADDR;
else next=WRITE_CMD;
end

WRITE_ADDR:begin
   
    ALU_FUN=0;
    EN_ALU=0;
    CLK_GATING_ALU_EN=0;
    //Address_REG_FILE=0;
    WrEn_REG_FILE=0;
    RdEn_REG_FILE=0;
    WrData_REG_FILE=0;
    FIFO_WRITE_DATA=0;
    FIFO_WRITE_INC=0;
    clk_div_en=1;
    FUN_TEMP=0;
    one_inc=0;
   
    
    if (!RX_D_VLD)
    begin
    //Address_REG_FILE=RX_P_DATA[7:4];
    //ADDRESS_TEMP=RX_P_DATA[7:4];
    next=WRITE_ADDR;
    end
    else next=WRITE_DATA;
   
end

WRITE_DATA:begin 
  
    ALU_FUN=0;
    EN_ALU=0;
    CLK_GATING_ALU_EN=0;
    //Address_REG_FILE=0;
    //WrEn_REG_FILE=0;
    RdEn_REG_FILE=0;
    //WrData_REG_FILE=0;
    FIFO_WRITE_DATA=0;
    FIFO_WRITE_INC=0;
    clk_div_en=1;
    FUN_TEMP=0;
    one_inc=0;
    

    //Address_REG_FILE=ADDRESS_TEMP;
    //ADDRESS_TEMP=0;
    WrData_REG_FILE=RX_P_DATA;
    if (!FIFO_FULL)
    begin
    WrEn_REG_FILE=1;
    next=IDLE;
    end
    else begin WrEn_REG_FILE=0; next=WRITE_DATA;end
    
    //if (RX_D_VLD)
    //next=IDLE;
    //else next=WRITE_DATA;

end

READ_CMD: begin
    
    ALU_FUN=0;
    EN_ALU=0;
    CLK_GATING_ALU_EN=0;
    //Address_REG_FILE=0;
    WrEn_REG_FILE=0;
    RdEn_REG_FILE=0;
    WrData_REG_FILE=0;
    FIFO_WRITE_DATA=0;
    FIFO_WRITE_INC=0;
    clk_div_en=1;
    //ADDRESS_TEMP=0;
    FUN_TEMP=0;
    one_inc=0;

    if (RX_D_VLD)
    next=READ_ADDR;
    else next=READ_CMD;
 
end 

READ_ADDR:begin

    ALU_FUN=0;
    EN_ALU=0;
    CLK_GATING_ALU_EN=0;
    //Address_REG_FILE=0;
    WrEn_REG_FILE=0;
    //RdEn_REG_FILE=0;
    WrData_REG_FILE=0;
    FIFO_WRITE_DATA=0;
    FIFO_WRITE_INC=0;
    clk_div_en=1;
    FUN_TEMP=0;
    one_inc=0;
    

    //Address_REG_FILE=RX_P_DATA[7:4];
    //ADDRESS_TEMP=RX_P_DATA[7:4];
    RdEn_REG_FILE=1;

    if (RX_D_VLD)   
    next=OUT_READ;
    else next=READ_ADDR; 
end

OUT_READ:begin

    ALU_FUN=0;
    EN_ALU=0;
    CLK_GATING_ALU_EN=0;
    //Address_REG_FILE=0;
    WrEn_REG_FILE=0;
    RdEn_REG_FILE=0;
    WrData_REG_FILE=0;
    FIFO_WRITE_DATA=0;
    FIFO_WRITE_INC=0;
    clk_div_en=1;
    //ADDRESS_TEMP=0;
    FUN_TEMP=0;
    

if (RdData_Valid_REG_FILE && !FIFO_FULL)
    begin 
        FIFO_WRITE_DATA= RdData_REG_FILE;
        FIFO_WRITE_INC=  1; 
        next=IDLE;
    end 
else begin 
         next=OUT_READ;
    end
end

ALU_W_OP_CMD:begin 

    ALU_FUN=0;
    EN_ALU=0;
    //CLK_GATING_ALU_EN=0;
    //Address_REG_FILE=0;
    WrEn_REG_FILE=0;
    RdEn_REG_FILE=0;
    WrData_REG_FILE=0;
    FIFO_WRITE_DATA=0;
    FIFO_WRITE_INC=0;
    clk_div_en=1;
    //ADDRESS_TEMP=0; 
    FUN_TEMP=0;  
    one_inc=0; 

CLK_GATING_ALU_EN=1;

 if (RX_D_VLD)   
         next=OP_A;
else next=ALU_W_OP_CMD;

end

OP_A:begin 

    ALU_FUN=0;
    EN_ALU=0;
    //CLK_GATING_ALU_EN=0;
    //Address_REG_FILE=0;
    //WrEn_REG_FILE=0;
    RdEn_REG_FILE=0;
    //WrData_REG_FILE=0;
    FIFO_WRITE_DATA=0;
    FIFO_WRITE_INC=0;
    clk_div_en=1;
    //ADDRESS_TEMP=0; 
    FUN_TEMP=0; 
    one_inc=0;

    CLK_GATING_ALU_EN=1;
    //Address_REG_FILE=0;
    WrEn_REG_FILE=1;
    WrData_REG_FILE=RX_P_DATA;
    
    if (RX_D_VLD)   
         next=OP_B;
    else next=OP_A;

end

OP_B:begin 
    
    ALU_FUN=0;
    EN_ALU=0;
    //CLK_GATING_ALU_EN=0;
    //Address_REG_FILE=0;
    //WrEn_REG_FILE=0;
    RdEn_REG_FILE=0;
    //WrData_REG_FILE=0;
    FIFO_WRITE_DATA=0;
    FIFO_WRITE_INC=0;
    clk_div_en=1;
    //ADDRESS_TEMP=0;
    FUN_TEMP=0;  
    one_inc=0;

    CLK_GATING_ALU_EN=1;
    //Address_REG_FILE=1;
    WrEn_REG_FILE=1;
    WrData_REG_FILE=RX_P_DATA;

    if (RX_D_VLD)   
         next=ALU_FUN_STATE;
    else next=OP_B;
  
end

ALU_FUN_STATE:begin
    
    //ALU_FUN=0;
    //EN_ALU=0;
    //CLK_GATING_ALU_EN=0;
    //Address_REG_FILE=0;
    WrEn_REG_FILE=0;
    RdEn_REG_FILE=0;
    WrData_REG_FILE=0;
    FIFO_WRITE_DATA=0;
    FIFO_WRITE_INC=0;
    clk_div_en=1;
    //ADDRESS_TEMP=0;
    one_inc=0;

    ALU_FUN=RX_P_DATA[7:4];
    FUN_TEMP=RX_P_DATA[7:4];
    EN_ALU=1;
    CLK_GATING_ALU_EN=1;

    if (RX_D_VLD)   
         next=OUT_ALU_1;
    else next=ALU_FUN_STATE;

end

OUT_ALU_1:begin 
   
    //ALU_FUN=0;
    //EN_ALU=0;
    //CLK_GATING_ALU_EN=0;
    //Address_REG_FILE=0;
    WrEn_REG_FILE=0;
    RdEn_REG_FILE=0;
    WrData_REG_FILE=0;
    FIFO_WRITE_DATA=0;
    FIFO_WRITE_INC=0;
    clk_div_en=1;
    //ADDRESS_TEMP=0;

    ALU_FUN=FUN_TEMP;
    FUN_TEMP=0;
    EN_ALU=1;
    CLK_GATING_ALU_EN=1;

if (ALU_Valid && !FIFO_FULL) 
begin
    FIFO_WRITE_DATA=ALU_OUT[7:0];
    FIFO_WRITE_INC=1;
    next=OUT_ALU_2;
end
else begin 
         next=OUT_ALU_1; 
end

end

OUT_ALU_2: begin

    ALU_FUN=0;
    EN_ALU=0;
    CLK_GATING_ALU_EN=0;
    //Address_REG_FILE=0;
    WrEn_REG_FILE=0;
    RdEn_REG_FILE=0;
    WrData_REG_FILE=0;
    FIFO_WRITE_DATA=0;
    FIFO_WRITE_INC=0;
    clk_div_en=1;
    //ADDRESS_TEMP=0;    
    FUN_TEMP=0;

if (ALU_Valid && !FIFO_FULL) 
begin
    FIFO_WRITE_DATA=ALU_OUT[15:8];
    FIFO_WRITE_INC=1;
    next=IDLE;
end

else begin 
   next=OUT_ALU_2;
end
end

ALU_W_NOP_CMD:begin

    ALU_FUN=0;
    EN_ALU=0;
    CLK_GATING_ALU_EN=0;
    //Address_REG_FILE=0;
    WrEn_REG_FILE=0;
    RdEn_REG_FILE=0;
    WrData_REG_FILE=0;
    FIFO_WRITE_DATA=0;
    FIFO_WRITE_INC=0;
    clk_div_en=1;
    //ADDRESS_TEMP=0;    
    FUN_TEMP=0;

next=ALU_FUN_STATE;
end

default: begin

    ALU_FUN=0;
    EN_ALU=0;
    CLK_GATING_ALU_EN=0;
    //Address_REG_FILE=0;
    WrEn_REG_FILE=0;
    RdEn_REG_FILE=0;
    WrData_REG_FILE=0;
    FIFO_WRITE_DATA=0;
    FIFO_WRITE_INC=0;
    clk_div_en=1;
    //ADDRESS_TEMP=0;    
    FUN_TEMP=0;

    next=IDLE;
end
endcase
end

always@(posedge CLK or negedge RST) begin
    if(!RST) 
        begin 
            Address_REG_FILE=0;
        end
    else 
        begin 
            if (current==OP_A) Address_REG_FILE=0;
            else if (current==OP_B) Address_REG_FILE=1;
            else if (current==READ_ADDR  &&  RX_D_VLD) Address_REG_FILE=RX_P_DATA[7:4];
            else if (current==WRITE_ADDR && !RX_D_VLD) Address_REG_FILE=RX_P_DATA[7:4];
        end
end
endmodule 







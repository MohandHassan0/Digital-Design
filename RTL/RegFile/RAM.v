module RAM #(parameter MEM_DEPTH=16 , MEM_WIDTH=8, ADDR_WIDTH=4)(

    input  wire                   		       CLK, RST,
    input  wire  [ADDR_WIDTH-1:0]		       Address,
    input  wire                  		       WrE, RdEn,
    input  wire  [MEM_WIDTH-1:0]               WrData,  
    output reg   [MEM_WIDTH-1:0]               RdData,
    output reg                                 RdData_Valid,
    output       [MEM_WIDTH-1:0]               REG0,
    output       [MEM_WIDTH-1:0]               REG1,
    output       [MEM_WIDTH-1:0]               REG2,
    output       [MEM_WIDTH-1:0]               REG3

);

    // 2D Array
    reg [MEM_WIDTH-1:0] Reg_File [MEM_DEPTH-1:0];        

    // Asssigned Regs
    assign REG0 = Reg_File[0]; //OP_A ALU
    assign REG1 = Reg_File[1]; //OP_B ALU
    assign REG2 = Reg_File[2]; //UART_Configuration
    assign REG3 = Reg_File[3]; //Clock Divider

    always @(posedge CLK or negedge RST) 
	  begin
        if (!RST) 
		  begin
            Reg_File[0] <= 'b0;
            Reg_File[1] <= 'b0;
            Reg_File[2] <= 'b10000000; //UART_Configuration
            Reg_File[3] <= 'b00000001; //Clock Divider
            Reg_File[4] <= 'b0;
            Reg_File[5] <= 'b0;
            Reg_File[6] <= 'b0;
            Reg_File[7] <= 'b0;
            Reg_File[8] <= 'b0;
            Reg_File[9] <= 'b0;
            Reg_File[10] <= 'b0;
            Reg_File[11] <= 'b0;
            Reg_File[12] <= 'b0;
            Reg_File[13] <= 'b0;
            Reg_File[14] <= 'b0;
            Reg_File[15] <= 'b0;
            RdData<='b0;
            RdData_Valid<='b0;
		  end
		
        else 
        begin
		  if (WrE&(~RdEn))
          begin
          Reg_File[Address]<=WrData;
          RdData_Valid<=0;
          end

         else if (RdEn&(~WrE))
          begin
          RdData<=Reg_File[Address];
          RdData_Valid<=1;
          end

          else begin RdData<=0; RdData_Valid<=0; end
        end
       end

endmodule


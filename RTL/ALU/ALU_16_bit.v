module ALU_16_bit #(parameter OPERAND_WIDTH = 8, OPCODE_WIDTH = 4 , RESULT_WIDTH = 16 ) 
				   (input  [OPERAND_WIDTH-1:0] A , B , input [OPCODE_WIDTH-1:0] ALU_FUN , input CLK , RST, ALU_Enable ,
				   output reg [RESULT_WIDTH-1:0] ALU_OUT ,  output reg OUT_VALID);



	wire [16:0] sum ;
	wire [16:0] sub;
	assign sum = A + B;
	assign sub = A - B;

	always @(posedge CLK or negedge RST) 
	begin
		if ((!RST)) begin ALU_OUT<=0; OUT_VALID<=0; end
		
		else 
			begin
				if(ALU_Enable)
					begin
						case (ALU_FUN) 

							4'b0000 : begin 			ALU_OUT<=sum[15:0];     OUT_VALID<=1;     	   	 end

							4'b0001 : begin             ALU_OUT<=sub[15:0];     OUT_VALID<=1;            end

							4'b0010 : begin             ALU_OUT<=(A*B);         OUT_VALID<=1;    		 end

							4'b0011 : begin 	if (B==0) begin    ALU_OUT<=0;           OUT_VALID<=1;   end
												else      begin    ALU_OUT<=(A/B);       OUT_VALID<=1;   end
									  end

							4'b0100 : begin             ALU_OUT<=(A&B);          OUT_VALID<=1;  		 end

							4'b0101 : begin         	ALU_OUT<=(A|B);          OUT_VALID<=1;     		 end

							4'b0110 : begin         	ALU_OUT<=(~(A&B));       OUT_VALID<=1;     		 end
	
							4'b0111 : begin             ALU_OUT<=(~(A|B));       OUT_VALID<=1;      	 end

							4'b1000 : begin             ALU_OUT<=A^B;            OUT_VALID<=1;    		 end

							4'b1001 : begin         	ALU_OUT<=(~(A^B));       OUT_VALID<=1;   		 end
	
							4'b1010 : begin         	ALU_OUT<=((A==B)? 1:0);  OUT_VALID<=1; 			 end

							4'b1011 : begin             ALU_OUT<=((A>B) ? 2:0);  OUT_VALID<=1; 			 end

							4'b1100 : begin 			ALU_OUT<=((A<B) ? 3:0);  OUT_VALID<=1; 		   	 end

							4'b1101 : begin             ALU_OUT<=(A>>1);         OUT_VALID<=1; 			 end
	
							4'b1110 : begin             ALU_OUT<=(A<<1);         OUT_VALID<=1; 			 end
	
							default : begin             ALU_OUT<=0;				 OUT_VALID<=0; 		     end

						endcase
		
					end
				else		 begin ALU_OUT<=0; OUT_VALID<=0; end

		end

	end



	

endmodule

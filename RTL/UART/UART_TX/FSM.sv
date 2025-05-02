module FSM (input Data_valid , Par_en , Ser_done , CLK , RST ,output reg [1:0] mux ,output reg busy , capture , Ser_en);

typedef enum bit [2:0] {
	IDLE   = 3'b000,
	START  = 3'b001,
	DATA   = 3'b011,
	PARITY = 3'b010,
	STOP   = 3'b110
} state_e;

state_e current_state , next_state;

always @(posedge CLK or negedge RST)
begin 
	if (!RST)
	current_state<=IDLE;
	else 
	current_state<=next_state;
end 

always @(*)
begin 
	case(current_state)
	IDLE: begin
		mux=2'b01;
		busy=0;
		capture=0;
		Ser_en=0;
		if(Data_valid)
			begin
			next_state=START;
			end
		else next_state=IDLE;
		end

	START : begin 
		mux=2'b00;
		Ser_en=1;
		busy=1;
		capture=1;
		next_state=DATA;
		end

	DATA : begin
		capture=0;
		busy=1;
		if(!Ser_done)
		begin
			next_state=DATA;
			mux=2'b10;
			Ser_en=1;
		end
		else begin
			Ser_en=0;
			capture=0;
			busy=1;
			mux=2'b10;
			if (Par_en)
			begin
				next_state=PARITY;
			end
			else begin
				next_state=STOP;
				end
	
		end
	end

	PARITY : begin
		capture=0;
		busy=1;
		Ser_en=0;
		mux=2'b11;
		next_state=STOP;
		end
	
	STOP : begin
		capture=0;
		busy=1;
		Ser_en=0;
		mux=2'b01;
		next_state=IDLE;
		end
	default : begin 
			  	capture=0;
				busy=0;
				Ser_en=0;
				mux=2'b01;
				next_state=IDLE;
			  end
		endcase
	end
endmodule
module data_sync_fifo (input [3:0] insertion , output reg [3:0] out , input CLK , RST);

reg  stage_one [3:0];
//reg  stage_two [3:0];

always @(posedge CLK or negedge RST)
begin

 if(~RST)
 begin
    out[0]<=0;
    out[1]<=0;
    out[2]<=0;
    out[3]<=0;

    stage_one[0]<=0;
    stage_one[1]<=0;
    stage_one[2]<=0;
    stage_one[3]<=0;
    
    //stage_two[0]<=0;
    //stage_two[1]<=0;
    //stage_two[2]<=0;
    //stage_two[3]<=0;
 end

    else 
        begin
	     stage_one[0]<=insertion[0];
        stage_one[1]<=insertion[1];
        stage_one[2]<=insertion[2];
        stage_one[3]<=insertion[3];

	     //stage_two[0]<=stage_one[0];
        //stage_two[1]<=stage_one[1];
        //stage_two[2]<=stage_one[2];
        //stage_two[3]<=stage_one[3];

        out[0]<=stage_one[0];
        out[1]<=stage_one[1];
        out[2]<=stage_one[2];
        out[3]<=stage_one[3];
        end

end

endmodule
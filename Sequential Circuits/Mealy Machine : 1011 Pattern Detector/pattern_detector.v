// 1011 Pattern detector with overlapping

module pattern_detector(
  input clk,reset,in,
  output reg q
);
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;

  reg [1:0] state,next_state;
  
  always @(posedge clk) 
  begin
    if(reset)
      state <= S0;
    else
      state <= next_state;
  end

  always @(*) 
  begin
    next_state = state;
    q=0;
    case(state)
      S0: 
		begin
        if(in)
          next_state = S1;
        else
          next_state = S0;
      end
      S1: 
		begin
        if(in)
          next_state = S1;
        else
          next_state = S2;
      end
      S2: 
		begin
        if(in)
          next_state = S3;
        else
          next_state = S0;
      end
      S3: 
		begin
        if(in) 
		  begin
          next_state = S1; 
          q=1;
        end
        else
          next_state = S2;
      end 
    endcase
  end
endmodule
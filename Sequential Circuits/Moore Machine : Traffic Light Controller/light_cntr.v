module light_cntr(
  input clk,reset,
  output reg red,green,yellow
);
  parameter RED = 2'b00;
  parameter GREEN = 2'b01;
  parameter YELLOW = 2'b10;

  reg [1:0] state,next_state;
  always @(posedge clk) 
  begin
    if(reset)
      state <= RED;
    else
      state <= next_state;
  end

  reg [2:0] count;
  reg counter_reset;
  always @(posedge clk) 
  begin
    if(reset || counter_reset)
      count<=0;
    else
      count<=count+1;
  end
  
  always @(*) 
  begin
    next_state = state;
    counter_reset = 0;
    case(state)
      RED: 
		begin
        if(count == 4)
		  begin
          next_state = GREEN;
          counter_reset = 1;
        end
      end
      GREEN: 
		begin
        if(count == 4)
		  begin
          next_state = YELLOW;
          counter_reset = 1;
        end
      end
      YELLOW: 
		begin
        if(count == 1) 
		  begin
          next_state = RED;
          counter_reset = 1;
        end
      end
      default: next_state = RED;
    endcase
  end
 
  always @(*) 
  begin
    red = (state == RED);
    green = (state == GREEN);
    yellow = (state == YELLOW);
  end
endmodule
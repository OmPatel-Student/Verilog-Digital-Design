module universal_reg(
  input clk, reset, load,
  input [1:0] sel,
  input enable, left_in, right_in,
  input [3:0] d,
  output [3:0] q
);
  reg [3:0] shift_reg;
  
always @(posedge clk) 
begin
    if(reset)
      shift_reg <= 0;
    else if(enable) 
	 begin
      case(sel)
        2'b00: shift_reg <= shift_reg;
        2'b01: shift_reg <= {right_in,shift_reg[3:1]};
        2'b10: shift_reg <= {shift_reg[2:0],left_in};
        2'b11: shift_reg <= d;
        default: shift_reg <= shift_reg;
      endcase
    end
end
assign q = shift_reg;
endmodule
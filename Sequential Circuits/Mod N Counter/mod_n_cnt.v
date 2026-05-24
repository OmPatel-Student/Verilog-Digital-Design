module mod_n_cnt #(
  parameter N=4,
  parameter M=10)(
  input clk, reset, en,
  output reg [(N-1):0] out
); 
  always @(posedge clk) 
  begin
    if(reset)
      out<=0;
    else if(en) 
	 begin
      if(out==(M-1))
        out<=0;
      else
        out<=out+1;
    end
    else
      out<=out;
  end
endmodule
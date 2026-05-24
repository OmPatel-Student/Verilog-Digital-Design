module sipo(in, out, clk, reset);

input in, clk, reset;
output reg [3:0] out;

initial 
begin
	out<= 4'b0000;

end
always @(posedge clk)
begin
    if (reset)
        out <= 4'b0000;
    else
        out <= {out[2:0], in};
end
endmodule
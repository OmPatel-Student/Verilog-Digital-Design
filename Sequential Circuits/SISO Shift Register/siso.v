module siso(in, out, clk, reset);

input in, clk, reset;
output reg out;

initial 
begin
	out<= 1'b0;
end

always @(posedge clk)
begin
    if (reset)
        out <= 1'b0;
    else
        out <= in;
end
endmodule
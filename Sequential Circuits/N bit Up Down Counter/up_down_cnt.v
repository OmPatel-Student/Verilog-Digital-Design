module up_down_cnt(clk, reset, m, out);

parameter N = 4;

input clk, reset, m;
output reg [N-1:0] out;

initial
    out = 0;

always @(posedge clk)
begin
    if(reset)
        out <= 0;

    else if(m)
        out <= out + 1'b1;

    else
        out <= out - 1'b1;
end

endmodule
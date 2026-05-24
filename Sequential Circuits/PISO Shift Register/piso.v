module piso(in, out, clk, reset);

input [3:0] in;
input clk, reset;
output reg out;

reg [3:0] temp;

always @(posedge clk)
begin
    if (reset)
    begin
        temp <= in;
        out  <= 1'b0;
    end
    else
    begin
        out  <= temp[3];
        temp <= {temp[2:0], 1'b0};
    end
end

endmodule
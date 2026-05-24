module SR_ff(s,r,clk,q);

input s,r,clk;
output reg q;

initial
	q=0;
	
always @(posedge clk)
begin
    casez({s,r})
        2'b00 : q <= q;
        2'b01 : q <= 0;
        2'b10 : q <= 1;   
        2'b11 : q <= 1'bz;
    endcase
end
endmodule
module D_ff(d,clk,q);

input d,clk;
output reg q;

always@(posedge clk)
	q<=d;

endmodule
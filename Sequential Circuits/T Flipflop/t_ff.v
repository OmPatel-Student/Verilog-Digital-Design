module t_ff(t,clk,q);

input t,clk;
output reg q;

initial 
	q=0;
	
always@(posedge clk)
begin
	if(t)
		q<=~q;
	else
		q<=q;
end
endmodule
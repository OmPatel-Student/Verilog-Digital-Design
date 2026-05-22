module cmp_4bit(a,b,grt,less,eq);

input [3:0]a;
input [3:0]b;
output reg grt,less,eq;

always@(*)
begin
	grt=0;
	less=0;
	eq=0;
	
	if(a>b)
		grt=1;

	else if(a<b)
		less=1;
	
	else
		eq=1;
end
endmodule
		
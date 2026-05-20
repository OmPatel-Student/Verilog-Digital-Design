module mux4x1(a,b,c,d,s0,s1,out);

output reg out;
input a,b,c,d,s0,s1;

always@(*)
begin
	case({s1,s0})
	
	2'b00 : out=a;
	2'b01 : out=b;
	2'b10 : out=c;
	2'b11 : out=d;
	
	endcase
end
endmodule
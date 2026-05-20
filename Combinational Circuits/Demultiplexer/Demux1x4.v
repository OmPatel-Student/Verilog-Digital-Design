module Demux1x4(in,s0,s1,o1,o2,o3,o4);

input in;
input s0,s1;
output reg o1,o2,o3,o4;

always@(*)
begin 
    o1=0;
	 o2=0;
	 o3=0;
	 o4=0;
	 
    case({s1,s0})
	 
	 2'b00:o1=in;
	 2'b01:o2=in;
	 2'b10:o3=in;
	 2'b11:o4=in;
	 
	 endcase
end
endmodule
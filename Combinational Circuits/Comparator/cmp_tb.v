`timescale 1ns/1ps

module cmp_tb;

reg [3:0]a;
reg [3:0]b;
wire grt,less,eq;

cmp_4bit dut(a,b,grt,less,eq);

initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0, cmp_tb);
end

initial begin

   $monitor("a=%b b=%b grt=%b less=%b eq=%b",
             a,b,grt,less,eq);

   a=4'b0110;
   b=4'b0101;
   #10;

   a=4'b1010;
   b=4'b1010;
   #10;

   a=4'b0100;
   b=4'b1001;
   #10;

   $finish;

end

endmodule
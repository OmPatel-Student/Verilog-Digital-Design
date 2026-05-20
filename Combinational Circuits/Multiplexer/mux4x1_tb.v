`timescale 1ns/1ps

module mux4x1_tb;

reg a,b,c,d,s0,s1;
wire out;

mux4x1 dut(a,b,c,d,s0,s1,out);

initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0, mux4x1_tb);
end

initial begin

   $monitor("a=%b b=%b c=%b d=%b s1=%b s0=%b out=%b",
             a,b,c,d,s1,s0,out);

   a=0;
   b=1;
   c=0;
   d=1;

   s0=0; s1=0;
   #10;

   s0=1; s1=0;
   #10;

   s0=0; s1=1;
   #10;

   s0=1; s1=1;
   #10;

   $finish;

end

endmodule
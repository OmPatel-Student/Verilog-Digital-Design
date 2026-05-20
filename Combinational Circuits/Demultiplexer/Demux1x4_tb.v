`timescale 1ns/1ps

module demux1x4_tb;

reg in,s0,s1;
wire o1,o2,o3,o4;

mux4x1 dut(in,s0,s1,o1,o2,o3,o4);

initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0, demux1x4_tb);
end

initial begin

   $monitor("in=%b s0=%b s1=%b o1=%b o2=%b o3=%b o4=%b",
             in,s0,s1,o1,o2,o3,o4);

   in=1
   
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
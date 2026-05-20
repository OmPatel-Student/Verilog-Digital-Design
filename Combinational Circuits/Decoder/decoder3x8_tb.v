`timescale 1ns/1ps

module decoder3x8_tb;

reg en,a,b,c;
wire [7:0]out;

decoder3x8 dut(a,b,c,en,out);

initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0, decoder3x8_tb);
end

initial begin

   $monitor("a=%b b=%b c=%b en=%b out=%b",
             a,b,c,en,out);

   en=0;
   
   a=0;
   b=1;
   c=0;
   #5;
   
   en=0;
   
   a=1; 
   b=1;
   c=0;
   #5;
   
   en=1;
   a=0; 
   b=0;
   c=0;
   #10;

   a=0; 
   b=1;
   c=1;
   #10;
   
   a=1; 
   b=0;
   c=1;
   #10;

   a=1; 
   b=1;
   c=1;
   #10;

   $finish;
end
endmodule
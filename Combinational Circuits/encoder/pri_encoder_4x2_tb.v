`timescale 1ns/1ps

module pri_encoder_4x2_tb;

reg i0,i1,i2,i3;
wire y0,y1,valid;

Pri_encoder_4x2 dut(i0,i1,i2,i3,y0,y1,valid);

initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0, pri_encoder_4x2_tb);
end

initial begin

   $monitor("i0=%b i1=%b i2=%b i3=%b y0=%b y1=%b valid=%b",
             i0,i1,i2,i3,y0,y1,valid);

   i0=0;
   i1=1;
   i2=0;
   i3=0;
   #10;

   i0=1;
   i1=0;
   i2=1;
   i3=0;
   #10;

   i0=1;
   i1=1;
   i2=1;
   i3=0;
   #10;

   i0=0;
   i1=1;
   i2=0;
   i3=1;
   #10;

   i0=0;
   i1=0;
   i2=0;
   i3=0;
   #10

   $finish;

end

endmodule
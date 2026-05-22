`timescale 1ns/1ps

module adder_subtractor_tb;

reg [3:0]a;
reg [3:0]b;
reg m;
wire [3:0]s;
wire cout;

adder_substractor_4bit dut(a,b,m,s,cout);

initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0, adder_subtractor_tb);
end

initial begin

   $monitor("a=%b b=%b m=%b s=%b cout=%b",
             a,b,m,s,cout);

   m=1'b0;
   
   a=4'b0110; b=4'b0100;
   #10;

   m=1'b1;
   #10;
   
   m=1'b0;
   a=4'b1100; b=4'b1111;
   #10;

   m=1'b1;
   a=4'b0110; b=4'b0100;
   #10;

   $finish;

end

endmodule
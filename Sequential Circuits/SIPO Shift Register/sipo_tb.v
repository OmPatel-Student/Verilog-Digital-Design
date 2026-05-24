`timescale 1ns/1ps

module sipo_tb;

reg in;
reg clk,reset;
wire [3:0]out;
sipo dut(in,out,clk,reset);

initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0, sipo_tb);
end

always #5 clk = ~clk;

initial
begin
    clk = 0;
    
    in = 4'b0;  #10;
    in = 4'b1;  #10;
    in = 4'b0;  #10;
    in = 4'b1;  #10;
    reset=1'b1; in = 4'b1;  #10;

    $finish;
end

initial
begin
  $monitor("time=%0t clk=%b reset=%b in=%b out=%b",
              $time, clk, reset, in, out);
end
endmodule
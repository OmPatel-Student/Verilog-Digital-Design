`timescale 1ns/1ps

module piso_tb;

reg [3:0] in;
reg clk, reset;
wire out;

piso dut(in, out, clk, reset);

initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0, piso_tb);
end

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;

    in = 4'b1010; #10;

    reset = 0; #50;    

    $finish;
end

initial
begin
  $monitor("time=%0t clk=%b reset=%b in=%b out=%b",
            $time, clk, reset, in, out);
end

endmodule
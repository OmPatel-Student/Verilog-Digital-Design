`timescale 1ns/1ps

module jk_ff_tb;

reg j,k,clk;
wire q;

jk_ff dut(j,k,clk,q);

initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0, jk_ff_tb);
end

always #5 clk = ~clk;

initial
begin
    clk = 0;

    j = 0; k = 0; #10;
    j = 1; k = 0; #10;
    j = 0; k = 1; #10;
    j = 1; k = 1; #10;

    $finish;
end

initial
begin
    $monitor("time=%0t clk=%b j=%b k=%b q=%b",
              $time, clk, j, k, q);
end

endmodule
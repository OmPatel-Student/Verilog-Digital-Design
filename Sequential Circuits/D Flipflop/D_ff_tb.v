`timescale 1ns/1ps

module D_ff_tb;

reg d, clk;
wire q;

D_ff dut(
    .d(d),
    .clk(clk),
    .q(q)
);

initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0, D_ff_tb);
end

always #5 clk = ~clk;

initial
begin
    clk = 0;

    d = 0; #10;
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;

    #20 $finish;
end

initial
begin
    $monitor("time=%0t clk=%b d=%b q=%b", $time, clk, d, q);
end
endmodule
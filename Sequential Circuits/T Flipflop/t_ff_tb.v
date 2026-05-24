`timescale 1ns/1ps

module t_ff_tb;

reg t,clk;
wire q;
t_ff dut(t,clk,q);

initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0, t_ff_tb);
end

always #5 clk = ~clk;

initial
begin
    clk = 0;
    
    t = 0;  #10;
    t = 1;  #10;
    t = 0;  #10;
    t = 1;  #10;

    $finish;
end

initial
begin
    $monitor("time=%0t clk=%b t=%b q=%b",
              $time, clk, t, q);
end
endmodule
`timescale 1ns/1ps

module up_down_cnt_tb;

parameter N = 4;

reg clk, reset, m;
wire [N-1:0] out;

up_down_cnt #(N) dut (.clk(clk),.reset(reset),.m(m),.out(out));

initial
begin
    $dumpfile("dump.vcd");
    $dumpvars(0, up_down_cnt_tb);
end

always 
#5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    m = 1;

    #10 reset = 0;

    m = 1;
    #80;

    m = 0;
    #80;

    $finish;
end

initial
begin
    $monitor("Time=%0t  reset=%b  m=%b  out=%b",
              $time, reset, m, out);
end

endmodule
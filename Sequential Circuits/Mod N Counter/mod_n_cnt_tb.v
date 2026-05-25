`timescale 1ns/1ps

module mod_n_cnt_tb;

parameter N = 4;
parameter M = 10;

reg clk, reset, en;
wire [N-1:0] out;

mod_n_cnt #(N, M) dut (.clk(clk),.reset(reset),.en(en),.out(out));

initial
begin
    $dumpfile("mod_n_cnt_tb.vcd");
    $dumpvars(0, mod_n_cnt_tb);
end

always 
#5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    en = 0;
    #10;
    reset = 0;

    en = 1;
    #120;

    en = 0;
    #20;

    en = 1;
    #50;

    $finish;
end

initial
begin
    $monitor("Time=%0t  reset=%b  en=%b  out=%d",$time, reset, en, out);
end
endmodule
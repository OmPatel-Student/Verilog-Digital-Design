`timescale 1ns/1ps

module asnc_cnt_tb;

reg clk, reset;
wire [3:0] q;

asnc_cnt dut(clk, reset, q);

initial begin
    $dumpfile("asnc_cnt_tb.vcd");
    $dumpvars(0, asnc_cnt_tb);
end

initial begin
    $monitor("Time = %0t  reset = %b  q = %b", 
              $time, reset, q);

always 
#5 clk = ~clk;

initial 
begin
    clk = 0;
    reset = 1;

    #10 reset = 0;

  #100 $finish;
end

endmodule
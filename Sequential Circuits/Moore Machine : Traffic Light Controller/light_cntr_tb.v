`timescale 1ns/1ns

module light_cntr_tb();

  reg clk, reset;
  wire red, green, yellow;

  // DUT Instantiation
  light_cntr dut (
    .clk(clk),
    .reset(reset),
    .red(red),
    .green(green),
    .yellow(yellow)
  );

  // Clock Generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Stimulus
  initial begin

    $dumpfile("light_cntr_tb.vcd");
    $dumpvars(0, light_cntr_tb);

    $display("TIME | RESET | RED GREEN YELLOW");
    $display("--------------------------------");

    reset = 1; #10;
    reset = 0;

    repeat(5)
      @(posedge clk);

    reset = 1; #10;
    reset = 0;

    repeat(15)
      @(posedge clk);

    $finish;
  end

  // Monitor Output
  always @(posedge clk) begin
    $display("%4t |   %b   |   %b     %b      %b",
              $time, reset, red, green, yellow);
  end

endmodule
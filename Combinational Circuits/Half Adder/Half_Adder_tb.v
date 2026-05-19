`timescale 1ns/1ps

module Half_Adder_tb;

reg a, b;
wire s, cout;

Half_Adder dut(.a(a),.b(b),.s(s),.cout(cout));

initial 
begin
    $monitor("Time=%0t a=%b b=%b sum=%b cout=%b", $time, a, b, s, cout);

    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $finish;
end

endmodule

`timescale 1ns/1ps;

module RCA_tb;

reg [3:0]a;
reg [3:0]b;
reg cin;
wire [3:0]s;
wire cout;

RCA dut(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, RCA_tb);
end

initial 
begin 
    $monitor("a=%b  b=%b cin=%b s=%b cout=%b", a, b, cin, s, cout);
        
    a = 4'b0110;
    b = 4'b1001;
    cin = 1'b1;
    #10;

    a = 4'b1010;
    b = 4'b0100;
    cin = 1'b0;
    #10;

    a = 4'b1111;
    b = 4'b1111;
    cin = 1'b1;
    #10;
	
    $finish;
end
endmodule

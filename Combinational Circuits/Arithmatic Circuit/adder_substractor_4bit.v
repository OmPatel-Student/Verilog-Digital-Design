module adder_substractor_4bit(a,b,m,s,cout);

input  [3:0] a;
input  [3:0] b;
input  m;
output [3:0] s;
output cout;

wire [3:0] bx;
wire c1,c2,c3;

assign bx = b ^ {4{m}};

Full_Adder FA0(a[0], bx[0], m , s[0], c1);
Full_Adder FA1(a[1], bx[1], c1, s[1], c2);
Full_Adder FA2(a[2], bx[2], c2, s[2], c3);
Full_Adder FA3(a[3], bx[3], c3, s[3], cout);

endmodule

module Full_Adder(a,b,cin,s,cout);

input a;
input b;
input cin;
output s;
output cout;

assign s = a ^ b ^ cin;
assign cout = (a & b) | (cin & (a ^ b));

endmodule
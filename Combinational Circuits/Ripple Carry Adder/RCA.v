module RCA(a,b,cin,s,cout);

parameter n=4;

input [(n-1):0] a;
input [(n-1):0] b;
input cin;
output [(n-1):0] s;
output cout;

wire cn1,cn2,cn3;

Full_Adder FA1(a[0],b[0],cin,s[0],cn1);
Full_Adder FA2(a[1],b[1],cn1,s[1],cn2);
Full_Adder FA3(a[2],b[2],cn2,s[2],cn3);
Full_Adder FA4(a[3],b[3],cn3,s[3],cout);

endmodule

module Full_Adder(a,b,cin,s,cout);

output s,cout;
input a,b,cin;

assign s=a^b^cin;
assign cout=(a&b)|(cin&(a^b));

endmodule
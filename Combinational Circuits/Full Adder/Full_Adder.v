module Full_Adder(a,b,cin,s,cout);

output s,cout;
input a,b,cin;

assign s=a^b^cin;
assign cout=(a&b)|(cin&(a^b));

endmodule
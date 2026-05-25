module decoder3x8(a,b,c,en,out);

input a,b,c,en;
output reg [7:0] out;

always @(*)
begin
    out = 8'b00000000;

    casex ({en,a,b,c})

        4'b0xxx : out = 8'b00000000;

        4'b1000 : out[0] = 1'b1;
        4'b1001 : out[1] = 1'b1;
        4'b1010 : out[2] = 1'b1;
        4'b1011 : out[3] = 1'b1;
        4'b1100 : out[4] = 1'b1;
        4'b1101 : out[5] = 1'b1;
        4'b1110 : out[6] = 1'b1;
        4'b1111 : out[7] = 1'b1;

        default : out = 8'b00000000;

    endcase
end
endmodule
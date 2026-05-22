module Pri_encoder_4x2(i0,i1,i2,i3,y0,y1,valid);

input i0,i1,i2,i3;
output reg y0,y1;
output reg valid;

// i3 has highest priority

always @(*) begin

    valid = 1;

    if(i3) begin
        y1 = 1;
        y0 = 1;
    end

    else if(i2) begin
        y1 = 1;
        y0 = 0;
    end

    else if(i1) begin
        y1 = 0;
        y0 = 1;
    end

    else if(i0) begin
        y1 = 0;
        y0 = 0;
    end

    else begin
        y1 = 1'bx;
        y0 = 1'bx;
        valid = 0;
    end

end

endmodule
module dec2x4(output[3:0] Y, input EN, input[1:0] A);
    assign Y[0] = ~A[1] & ~A[0] & EN;
    assign Y[1] = ~A[1] &  A[0] & EN;
    assign Y[2] =  A[1] & ~A[0] & EN;
    assign Y[3] =  A[1] &  A[0] & EN;
endmodule

module dec3x8(output[7:0] Y, input[2:0] A);
    dec2x4 dec0(Y[3:0], ~A[2], A[1:0]);
    dec2x4 dec1(Y[7:4],  A[2], A[1:0]);
endmodule

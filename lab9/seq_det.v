module seq_det( output F, input ck, input rst, input I, output[1:0] Q );

wire [1:0] D;

assign D[0] = ~I & ~Q[1] | I & Q[1];
assign D[1] = I;

Dff D0(ck, rst, D[0], Q[0]);
Dff D1(ck, rst, D[1], Q[1]);

assign F = (~I & ~Q[1] | I & Q[1]);

endmodule

module Dff(input ck, input rst, input D, output reg Q);
    always @(posedge ck, posedge rst)
        if(rst) Q <= 1'b0; 
            else
                Q <= D;
endmodule

module JKff(input ck, inout rst, input J, input K, output reg Q, output wire Qb);
    assign Qb = ~Q;
    always @(posedge ck, posedge rst)
        if(rst) Q <= 1'b0;
        else
            case({J, K})
                2'b00: Q <= Q;      // no change
                2'b01: Q <= 1'b0;   // reset
                2'b10: Q <= 1'b1;   // set
                2'b11: Q <= ~Q;     // toggle
            endcase
endmodule

module RippleCounter(input ck, input rst, output[3:0] Q, output[3:0] Qb);
    JKff a(ck, rst, 1'b1, 1'b1, Q[0], Qb[0]);
    JKff b(Qb[0], rst, 1'b1, 1'b1, Q[1], Qb[1]);
    JKff c(Qb[1], rst, 1'b1, 1'b1, Q[2], Qb[2]);
    JKff d(Qb[2], rst, 1'b1, 1'b1, Q[3], Qb[3]);
endmodule

module BcdCounter(input ck, input rst, output[3:0] Q, output[3:0] W);
    wire[3:0] D;
    assign D[0] = ~Q[0];
    assign D[1] = ~Q[3] & (Q[1] ^ Q[0]);
    assign D[2] = Q[2] ^ (Q[1] & Q[0]);
    assign D[3] = Q[3] & ~Q[0] | Q[2] & Q[1] & Q[0];

    assign W = 4'd9-Q;
    Dff FF0 (ck, rst, D[0], Q[0]),
        FF1 (ck, rst, D[1], Q[1]),
        FF2 (ck, rst, D[2], Q[2]),
        FF3 (ck, rst, D[3], Q[3]);
endmodule

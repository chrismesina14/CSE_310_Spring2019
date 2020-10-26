// Half adder

module HA(
    output C,       // carry
    output S,       // sum
    input a,
    input b
);

    xor(S, a, b);
    and(C, a, b);

endmodule

// Full Adder

module FA(output C, output S, input a, input b, input c);
    wire C1, S1, C2, S2;

    // instantiate half adders
    HA ha1(C1, S1, a, b);
    HA ha2(C2, S, S1, c);

    or(C, C1, C2);

endmodule

// 4-bit Ripple Carry Adder

module RCA4(output C4, output[3:0] S, input[3:0] A, B, C, input C0);
    wire C1, C2, C3;    // intermediate carries

    FA  fa0(C1, S[0], A[0], B[0], C0),
        fa1(C2, S[1], A[1], B[1], C1),
        fa2(C3, S[2], A[2], B[2], C2),
        fa3(C4, S[3], A[3], B[3], C3);

endmodule


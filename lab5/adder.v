// Half Adder
module HA(output C, output S, input a, input b);

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

/********************************************
* Boolean Equations
* E = A + B * C + B' * D
* F = B' * C + B * C' * D'
*********************************************/

module boolean1(E, F, A, B, C, D);
    output E, F;
    input A, B, C, D;

    assign E = A || (B && C) || (!B && D);
    assign F = (!B && C) || (B && !C) && !D;

endmodule

// newer notation
// default is 1-bit wide wire

module boolean2(output E, output F, input A, input B, input C, input D);

    assign E = A || (B && C) || (!B && D);
    assign F = (!B && C) || (B && !C) && !D;

endmodule

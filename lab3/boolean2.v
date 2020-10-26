/********************************************
* Boolean Equations
* E = A + B
* F = (A * !B) + (A * !D) + C
*********************************************/

module boolean1(E, F, A, B, C, D);
    output E, F;
    input A, B, C, D;

    assign E = A || B;
    assign F = (A && !B) || (A && !D) || C;

endmodule

// newer notation
// default is 1-bit wide wire

module boolean2(output E, output F, input A, input B, input C, input D);

    assign E = A || B;
    assign F = (A && !B) || (A && !D) || C;

endmodule

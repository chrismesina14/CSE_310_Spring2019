// Adder-subtractor
// [Cout, S] = A + B if M = 0  (add)
// [Cout, S] = A - B if M = 1  (subtract)

module four_bit_adder_subtracter(output Cout, output [3:0] S, input [3:0] A, B, input M );
   wire C0,C1,C2;  //Intermediate carries
   wire [3:0] T;   //XOR outputs

   xor        X0(T[0], M, B[0]),
              X1(T[1], M, B[1]),
              X2(T[2], M, B[2]),
              X3(T[3], M, B[3]);

   FA         FA0 (C0,  S[0], A[0], T[0], M),
              FA1 (C1,  S[1], A[1], T[1], C0),
              FA2 (C2,  S[2], A[2], T[2], C1),
              FA3 (Cout,S[3], A[3], T[3], C2);

endmodule

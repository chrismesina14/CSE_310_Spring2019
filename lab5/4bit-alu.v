//       four_bit_alu
//       S = A+B if M=0 and Cen=1     (add)
//       S = A-B if M=1 and Cen=1     (subtract)
//       S = A^B if M=0 and Cen=0     (xor)
//       S = (A^B)' if M=1 and Cen=0  (xnor)

module four_bit_alu(output Cout, output [3:0] S, input [3:0] A, B, input M, Cen);
   wire C0, C1, C2;  // Intermediate Carries
   wire[3:0] T;     // XOR ouputs
   wire[3:0] N;     // AND ouputs

   xor        X0(T[0], M, B[0]),
              X1(T[1], M, B[1]),
              X2(T[2], M, B[2]),
              X3(T[3], M, B[3]);
   
   and        N0(N[0], Cen, M),
              N1(N[1], Cen, C0),
              N2(N[2], Cen, C1),
              N3(N[3], Cen, C2);

   FA         FA0 (C0,  S[0], A[0], T[0], N[0]),
              FA1 (C1,  S[1], A[1], T[1], N[1]),
              FA2 (C2,  S[2], A[2], T[2], N[1]),
              FA3 (Cout,S[3], A[3], T[3], N[3]);
endmodule

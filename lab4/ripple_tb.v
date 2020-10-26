`timescale 1ns / 1ps

module ripple_tb;

    // Inputs
    reg[3:0] A, B, C;
    reg C0;

    // Outputs
    wire C4;
    wire[3:0] S;

    // Instantiate the Unit Under Test (UUT)
    RCA4 uut(.C4(C4), .S(S), .A(A), .B(B), .C(C));

    initial begin
        $display("time\t B3 B2 B1 B0     A3 A2 A1 A0       C4 S3 S2 S1 S0");
        $monitor("%g  \t %2b %2b %2b %2b    %2b %2b %2b %2b       %2b %2b %2b %2b %2b %2b"
        , $time, C[2], C[1], C[0], B[3], B[2], B[1], B[0], A[3], A[2], A[1], A[0], C4, S[3], S[2], S[1], S[0]);
end
         initial begin
        // Initialize inputs 
         C = 0;
         B = 0;
         A = 0;

        // Wait 80 ns for before finish
        #80 $finish;
end
        always begin
            #10 C = ~C;
         end
         always begin
             #20 B = ~B;
         end
         always begin
             #40 A = ~A;
         end


endmodule

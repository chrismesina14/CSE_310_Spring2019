module testBoolean();

//Declare inputs as regs and outputs as wires
reg A, B, C, D;
wire E, F, E2, F2;

//Initialize all variables
initial begin
    $display("time\t    A   B   C   D   E   F   E2  F2");
    $monitor("%g\t    %b   %b   %b   %b   %b   %b    %b   %b",
            $time, A, B, C, D, E, F, E2, F2);

    A = 0;  //initial values
    B = 0;
    C = 0;
    D = 0;
    #75 $finish;    //Terminate simulation

end
    always begin
        #5 D = ~D;
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

//Connect DUT (Device Under Test) to test bench, old notation
boolean1 test1(E, F, A, B, C, D);

//New notation
boolean2 test2(.A(A), .B(B), .C(C), .D(D), .E(E2), .F(F2));

endmodule

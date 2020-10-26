`timescale 1ns / 1ps

module four_bit_alu_tb;

// Inputs
reg M, Cen;
reg [3:0] A, B;

// Outputs
wire Cout;
wire [3:0] S;

// Instantiate the Unit Under Test (UUT)
four_bit_alu uut( .M(M), .Cen(Cen), .A(A), .B(B), .Cout(Cout), .S(S));

// set up the monitoring
initial begin
    $display("Time   A     B    M Cen Cout  S");
    $monitor("%3g   %b  %b  %b  %b   %b  %b", $time, A, B, M, Cen, Cout, S);
end

// run through a series of numbers
initial begin
    A=0000; B=0001; M=0; Cen=1;

    #10 A=0100; B=1011; M=0; Cen=1;
    #10 A=1000; B=0010; M=0; Cen=1;
    #10 A=0100; B=0011; M=1; Cen=1;
    #10 A=1100; B=0011; M=1; Cen=1;
    #10 A=1100; B=0100; M=1; Cen=1;
    #10 A=0100; B=0000; M=0; Cen=0;
    #10 A=0100; B=0001; M=0; Cen=0;
    #10 A=0100; B=0010; M=0; Cen=0;
    #10 A=0100; B=0000; M=1; Cen=0;
    #10 A=0100; B=0001; M=1; Cen=0;
    #10 A=0100; B=0010; M=1; Cen=0;
    #10 $finish;
end
endmodule


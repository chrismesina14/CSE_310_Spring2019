`timescale 1ns / 1ps

module adder_tb;

    // Inputs
    reg a;
    reg b;
    reg c;

    // Outputs
    wire CH;        // Carry of HA
    wire SH;        // Sum of HA
    wire CF;        // Carry of FA
    wire SF;        // Sum of FA

    // Instantiate the Unit Under Test (UUT)
    HA uut(.C(CH), .S(SH), .a(a), .b(b));

    FA uut1( .C(CF), .S(SF), .a(a), .b(b), .c(c));

    always
        #10 c = ~c;
    always
        #20 b = ~b;
    always
        #40 a = ~a;
    initial begin

    // Initialize Inputs
    a = 0;
    b = 0;
    c = 0;
    $display("time \t a \t b \t c \t CH \t SH \t CF \t SF");
    $monitor("%g \t %b \t %b \t %b \t %b \t %b \t %b \t %b", $time, a, b, c, CH , SH, CF, SF);

    // Wait 80 ns for before finish
    #80 $finish;

end

endmodule

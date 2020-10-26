// One time unit is 1 ns. Precision is 1ps (0.001ns).
`timescale 1ns / 1ps

module dec2x4_tb;

    // Inputs
    reg[1:0] a;
    reg en;

    // Outputs
    wire[3:0] y;

    // Instantiate the Unit Under Test (UUT)
    dec2x4 uut(.Y(y), .EN(en), .A(a));

    always begin 
        en = 0;
            a = 2'b00;
        #10 a = 2'b01;
        #10 a = 2'b10;
        #10 a = 2'b11;

        #10 en = 1; a = 2'b00;
        #10 a = 2'b01;
        #10 a = 2'b10;
        #10 a = 2'b11;

        #20 $finish;
end

initial begin
    // Initialize Inputs
    $display("time \t end \t a[1] \t a[0] \t y[3] \t y[2] \t y[1] \t y[0]");
    $monitor("%g \t %b \t %b \t %b \t %b \t %b \t %b \t %b ", $time, en, a[1], a[0], y[3], y[2], y[1], y[0]);

    // Wait 90 ns before finish
    #90 $finish;

end
endmodule

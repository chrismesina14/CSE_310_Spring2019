`timescale 1ns / 1ps

module dec2x4_tb;

    // Inputs
    reg[2:0] a;

    // Outputs
    wire[7:0] y;

    // Instantiate the Unit Under Test (UUT)
    dec3x8 uut(.Y(y), .A(a));

    always begin
    
            a = 3'b000;
        #10 a = 3'b001;
        #10 a = 3'b010;
        #10 a = 3'b011;

        #10 a = 3'b100;
        #10 a = 3'b101;
        #10 a = 3'b110;
        #10 a = 3'b111;

        #20 $finish;
end

initial begin
    // Initialize Inputs
    $display("time \t a[2] a[1] a[0] \ty7   y6  y5  y4  y3  y2  y1  y0");
    $monitor("%g \t  %b     %b    %b \t   \t%b    %b   %b   %b   %b   %b   %b   %b ", $time, a[2], a[1], a[0], y[7], y[6], y[5], y[4], y[3], y[2], y[1], y[0]);

    // Wait 90 ns before finish
    #90 $finish;

end
endmodule


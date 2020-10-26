`timescale 1ns / 1ps

module seq_det_tb;

// Inputs
reg ck;
reg rst;
reg I;

// Outputs
wire FO; //Moore and Mealy
wire[1:0] q;

// Instantiate the Unit Under Test (UUT)
seq_det uut (.F(FO), .ck(ck), .rst(rst), .I(I), .Q(q));

initial begin
    $display ("time\t Clk   I   Q0  Q1  F");
    $monitor ("%g\t  %b    %b   %b   %b   %b", $time, ck, I, q[0], q[1], FO);
end

// Initialize Inputs
initial begin
    ck = 1'b0;
    rst = 1'b1;
    I = 0;
    #1 rst = 1'b0;
end

initial #150 $finish;
always #5 ck = ~ck;
always #25 I = ~I;

endmodule

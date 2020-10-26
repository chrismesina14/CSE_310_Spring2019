module bcdCounter_tb;

// Inputs
reg ck;
reg rst;

// Outputs
wire [3:0] Q;
wire [3:0] W;

BcdCounter uut(.ck(ck), .rst(rst), .Q(Q), .W(W));

initial begin
    
    $display ("time\t Clk   Q[3]    Q[2]    Q[1]    Q[0]    W");
    $monitor ("%g\t %b     %4b      %4b", $time, ck, Q, W );
end

// Initialize inputs
initial begin
    
    ck = 1'b1;
    rst = 1'b1;
    #2 rst = 1'b0;
end

initial #260 $finish;
always #10 ck = ~ck;

endmodule

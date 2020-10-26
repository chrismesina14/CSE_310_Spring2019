module rcounter_tb;

// Inputs
reg ck;
reg rst;

// Outputs
wire[3:0] Q;
wire[3:0] Qb;

RippleCounter uut(.ck(ck), .rst(rst), .Q(Q), .Qb(Qb));

initial begin

    $display("time\t Clk    Q[3]    Q[2]    Q[1]    Q[0]");
    $monitor("%g\t  %b     %4b", $time, ck, Q);

end

// Initialize Inputs
initial begin
    ck = 1'b1;
    rst = 1'b1;
    #2 rst = 1'b0;
end

initial #260 $finish;
always #10 ck = ~ck;

endmodule

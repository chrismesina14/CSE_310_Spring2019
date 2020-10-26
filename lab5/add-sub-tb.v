module add_sub_tb;
  // inputs
  reg [3:0] a, b;
  reg m;

  // outputs
  wire [3:0] s;
  wire Cout;

  // create instance of adder
  four_bit_adder_subtracter add_sub(Cout, s, a, b, m);

  // set up the monitoring
  initial
  begin
    $display("Time   A      B     M Cout  S");
    $monitor("%2g    %b   %b   %b   %b  %b", $time, a, b, m, Cout, s );
    end

  // run through a series of numbers
  initial
  begin
        a=4'b0000; b=4'b0000; m=1'b1;
    #10 a=4'b0100; b=4'b0000; m=1'b1;
    #10 a=4'b0100; b=4'b0011; m=1'b1;
    #10 a=4'b0100; b=4'b0011; m=1'b1;
    #10 a=4'b1100; b=4'b0011; m=1'b1;
    #10 a=4'b1100; b=4'b0011; m=1'b1;
    #10 a=4'b0100; b=4'b0000; m=1'b0;
    #10 a=4'b0100; b=4'b0011; m=1'b0;
    #10 a=4'b0100; b=4'b0011; m=1'b0;
    #10 a=4'b1100; b=4'b0011; m=1'b0;
    #10 a=4'b1100; b=4'b0011; m=1'b0;
    #10 $finish;
  end
endmodule

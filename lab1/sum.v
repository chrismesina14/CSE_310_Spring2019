module Sum(input [15:0] a, input [15:0] b, output[15:0] s);
  assign s = a + b;
initial begin
  #20 $finish;
end
endmodule

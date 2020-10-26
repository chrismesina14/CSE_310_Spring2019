module seg7 (input [3:0] bcd, output reg [6:0] leds);

always @(bcd)

begin
    
case (bcd)
    0: leds = 7'b1111110;
    1: leds = 7'b0110000;
    2: leds = 7'b1101101;
    3: leds = 7'b1111001;
    4: leds = 7'b0110011;
    5: leds = 7'b1011011;
    6: leds = 7'b1011111;
    7: leds = 7'b1110000;
    8: leds = 7'b1111111;
    9: leds = 7'b1111011;
    10: leds = 7'b1110111;
    11: leds = 7'b0011111;12: leds = 7'b1001110;
    13: leds = 7'b0111101;
    14: leds = 7'b1001111;
    15: leds = 7'b1000111;
    default : leds = 7'bx;
endcase

end
endmodule

module test();

reg [3:0] bcd;
wire [6:0] leds;
seg7 a1(bcd,leds);

initial begin
$monitor ("Value of BCD= %d, SEG = %b", bcd, leds);

    bcd = 4'd0;
    #5 bcd = 4'd1;
    #5 bcd = 4'd2;
    #5 bcd = 4'd3;
    #5 bcd = 4'd4;
    #5 bcd = 4'd5;
    #5 bcd = 4'd6;
    #5 bcd = 4'd7;
    #5 bcd = 4'd8;
    #5 bcd = 4'd9;
    #5 bcd = 4'd10;
    #5 bcd = 4'd11;
    #5 bcd = 4'd12;
    #5 bcd = 4'd13;
    #5 bcd = 4'd14;
    #5 bcd = 4'd15;

end
endmodule

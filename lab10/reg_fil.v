module Register_File( output [3:0] dataOut,input [3:0] data_in,
input [1:0] read_add, input read_en, input [1:0] write_add,
input write_en, output a, b, c, dd, e, f, g, output [3:0] EN);

    wire [3:0] read_sel, write_sel;

    dec2x4 Dec_Read(read_sel, read_en, read_add);
    dec2x4 Dec_Write( write_sel, write_en, write_add);

    Nibble_Reg Reg_0(dataOut, data_in, write_sel[0],read_sel[0]);
    Nibble_Reg Reg_1(dataOut, data_in, write_sel[1],read_sel[1]);
    Nibble_Reg Reg_2(dataOut, data_in, write_sel[2],read_sel[2]);
    Nibble_Reg Reg_3(dataOut, data_in, write_sel[3],read_sel[3]);

    seg7 display (a, b, c, dd, e, f, g, EN, dataOut[3], dataOut[2], dataOut[1], dataOut[0]);
endmodule

module Nibble_Reg(data_out, data_in, load, out_en);
    input [3:0] data_in;
    input load, out_en;
    output [3:0] data_out;
    
    wire [3:0] dff_out;
    wire [3:0] Qn;
    wire rst;
    assign rst = 0;

    bufif1 tri3 (data_out[3], dff_out[3], out_en);
    bufif1 tri2 (data_out[2], dff_out[2], out_en);
    bufif1 tri11 (data_out[1], dff_out[1], out_en);
    bufif1 tri00 (data_out[0], dff_out[0], out_en);


    Dff Reg_Bit_3(dff_out[3], Qn[3], load, rst, data_in[3]);
    Dff Reg_Bit_2(dff_out[2], Qn[2], load, rst, data_in[2]);
    Dff Reg_Bit_1(dff_out[1], Qn[1], load, rst, data_in[1]);
    Dff Reg_Bit_0(dff_out[0], Qn[0], load, rst, data_in[0]);
endmodule


module Dff( output reg Q, Qn, input ck, rst, D );
always @(posedge ck, posedge rst)
if ( rst != 0)
begin
    Q<= 1'b0;
    Qn <= 1'b1;
end
else
begin
    Q <= D;
    Qn <= ~D;
end
endmodule


module dec2x4 (output [3:0] Y, input EN, input [1:0] A );
    assign Y[0] = ~A[1] & ~A[0] & EN;
    assign Y[1] = ~A[1] & A[0] & EN;
    assign Y[2] = A[1] & ~A[0] & EN;
    assign Y[3] = A[1] & A[0] & EN;
endmodule

module dec3x8 (output [7:0] Y, input [2:0] A);
    dec2x4 dec0 ( Y[3:0], ~A[2], A[1:0] );
    dec2x4 dec1 ( Y[7:4], A[2], A[1:0] );
endmodule

module seg7( output a, b, c, d, e, f, g,
             	output [3:0] EN,
             	input W, X, Y, Z );
	 
    wire a0, b0, c0, d0, e0, f0, g0;
    assign a0 = Y && X || !W && Y || !X && !Z || !W && X && Z || W && !X && !Y || W && !Z;
   assign b0 = !W && Y && Z || !X && !Y || !X && !Z || !W && !Y && !Z || W && !Y && Z;
   assign c0 = W && !X || !W && X || !Y && Z || !X && !Y || !X && Z;
   assign d0 = W && !Y || !X && Y && Z || !W && !X && !Z || X && !Y && Z || X && Y && !Z;
   assign e0 = W && X || Y && !Z || !X && !Z || W && !X && Y;
   assign f0 = W && !X || !W && X || !Y && !Z || W && Y;
   assign g0 = W && !X || Y && !Z || W && Z || !W && X && !Y || !X && Y;
    
   assign a = ~a0;
   assign b = ~b0;
   assign c = ~c0;
   assign d = ~d0;
   assign e = ~e0;
   assign f = ~f0;
   assign g = ~g0;
   assign EN = 4'b1110;
endmodule

module regfil_test;

reg[3:0] data_in;
reg[1:0] read_add;
reg read_en;
reg[1:0] write_add;
reg write_en;

wire[3:0] dataOut;

Register_File regf(.dataOut(dataOut), .data_in(data_in), .read_add(read_add), .read_en(read_en), .write_add(write_add), .write_en(write_en));

initial begin
        $display("time \t Data in \t read en \t read add \t write en \t write add \t data out");
        $monitor("%g    \t %4b  \t\t    %b   \t    %2b  \t    %b   \t    %2b  \t   %4b", $time, data_in, read_en, read_add, write_en, write_add, dataOut);
end

initial begin
// Initialize inputs
data_in = 4'b0000;
read_add = 2'b00;
read_en = 0;
write_add = 2'b00;
write_en = 0;
#100;

// write 0001 into register 00
#10 write_en = 1'b1;
    write_add = 2'b00;
    data_in = 4'b0001;

// write 0010 into register 01
#10 write_add = 2'b01;
    data_in = 4'b0010;

// write 0011 into register 10
#10 write_add = 2'b10;
    data_in = 4'b0011;

// write 0100 into register 11
#10 write_add = 2'b11;
    data_in = 4'b0100;

// read data from register 00
#10 write_en = 0;
    read_en = 1;
    read_add = 2'b00;

// read data stored in register 01, 10 and 11 sequentially
#10 read_add = 2'b01;
#10 read_add = 2'b10;
#10 read_add = 2'b11;

// write 1110 into register 01 and read data stored in register 01 simultaneously
#10 write_en = 1;
    write_add = 2'b01;
    data_in = 4'b1110;
    read_add = 2'b01;
#10 $finish;

end

endmodule

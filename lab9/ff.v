module Dff(input ck, input rst, input D, output reg Q);
    always @(posedge ck, posedge rst)
        if(rst) Q <= 1'b0;
            else
                Q <= D;
endmodule

`timescale 1ns / 1ps
module Sobel(mat00,mat01,mat02,mat10,mat11,mat12,mat20,mat21,mat22,out);
input [7:0] mat00,mat01,mat02,mat10,mat11,mat12,mat20,mat21,mat22;
output out;

parameter threshold = 120;
wire [31:0] resX , resY;
Multiplier multiplier(mat00,mat01,mat02,mat10,mat11,mat12,mat20,mat21,mat22,resX,resY);

assign out = compareWithThreshold(resX+resY);

function compareWithThreshold;
input reg [31:0] in;
begin
    if(in[31])
        compareWithThreshold = 1'b0;
    else
        compareWithThreshold = in > Sobel.threshold;
end
endfunction


endmodule
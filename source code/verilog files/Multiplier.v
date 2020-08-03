`timescale 1ns / 1ps
module Multiplier(mat00,mat01,mat02,mat10,mat11,mat12,mat20,mat21,mat22,resultX , resultY);
parameter len = 8;
input [len-1:0] mat00,mat01,mat02,mat10,mat11,mat12,mat20,mat21,mat22;
output [31:0] resultX ,  resultY;

assign resultX = mat00 - mat02 + 2*mat10
			 - 2 * mat12 + mat20-mat22;

assign resultY = mat00 + 2*mat01+mat02
				 -mat20 - 2*mat21 - mat22;
				 
endmodule
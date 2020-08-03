`timescale 1ns / 1ps
module Processor(clk , subClk ,start ,out , finished);
parameter w = 224;
parameter length = 50176;

input clk , subClk , start;
output out; 
output reg finished;

reg [15:0] p;

always@(posedge start)
begin
	p = w-1;
	finished = 0;
end

reg [7:0] mat00,mat01,mat02,mat10,mat11,mat12,mat20,mat21,mat22;
wire [7:0] top , middle , bottom;

Sobel s(mat00,mat01,mat02,mat10,mat11,mat12,mat20,mat21,mat22 , out);

MemoryInterface memInterface(subClk , p, top , middle, bottom);

always @(posedge clk)
begin
	{mat00,mat01,mat02} <= {mat10,mat11,mat12};
	{mat10,mat11,mat12} <= {mat20,mat21,mat22};
	{mat20,mat21,mat22} <= {top , middle , bottom};
	
	finished = (p >= length-w-2);
	
	if(!finished)
	begin
		p = p + 1;
	end
	
end

endmodule

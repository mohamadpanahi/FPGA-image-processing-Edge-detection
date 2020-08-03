`timescale 1ns / 1ps
module ClockGeneratorModule(clkSlow , clkFast);
	output reg clkSlow ;
	output clkFast;
	reg clk;
	reg RESET;
	reg [1:0] counter;

	clock3x clk3x (
		.CLK_IN1(clk), 
		.CLK_OUT1(clkFast), 
		.RESET(RESET)
	);
	
	always @(posedge clkFast or negedge clkFast)
	begin
		counter = counter + 1;
		if(counter == 2'b11)
		begin
			counter = 0;
			clkSlow = ~clkSlow;
		end
	end
	
	initial
	begin
		counter = 2'b01;
		clkSlow = 0;
		while(1)
			#41 clk = ~clk;
	end

	initial begin
		clk = 0;
		RESET = 0;
		#500;
		RESET = 1;
		#500;
		RESET = 0;

	end
      
endmodule
`timescale 1ns / 1ps
module MemoryInterfaceTest;

	// Inputs
	wire subClk;
	wire clk;
	reg [15:0] p;

	// Outputs
	wire [7:0] top;
	wire [7:0] middle;
	wire [7:0] bottom;
	
	ClockGeneratorModule clockGenerator (
		.clkFast(subClk),
		.clkSlow(clk)
	);

	// Instantiate the Unit Under Test (UUT)
	MemoryInterface testingUnitMemory (
		.subClk(subClk), 
		.p(p), 
		.top(top), 
		.middle(middle), 
		.bottom(bottom)
	);

	initial begin
		// Initialize Inputs
		p = 16'd222;
		#2100;
	end
	
	always @ (posedge clk)
	begin 
	if(p<50176 - 224)
		begin
			p = p+1;
		end
	end
      
endmodule


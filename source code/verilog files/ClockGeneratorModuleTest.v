`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:07:13 08/01/2020
// Design Name:   ClockGeneratorModule
// Module Name:   C:/Users/MKasaei/Desktop/ISE workspace/image_processing/ClockGeneratorModuleTest.v
// Project Name:  image_processing
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ClockGeneratorModule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ClockGeneratorModuleTest;

	// Outputs
	wire clkSlow;
	wire clkFast;

	// Instantiate the Unit Under Test (UUT)
	ClockGeneratorModule uut (
		.clkSlow(clkSlow), 
		.clkFast(clkFast)
	);

	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


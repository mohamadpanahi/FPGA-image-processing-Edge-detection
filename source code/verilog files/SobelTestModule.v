`timescale 1ns / 1ps
module SobelTestModule;

	// Inputs
	reg [7:0] mat00;
	reg [7:0] mat01;
	reg [7:0] mat02;
	reg [7:0] mat10;
	reg [7:0] mat11;
	reg [7:0] mat12;
	reg [7:0] mat20;
	reg [7:0] mat21;
	reg [7:0] mat22;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	Sobel uut (
		.mat00(mat00), 
		.mat01(mat01), 
		.mat02(mat02), 
		.mat10(mat10), 
		.mat11(mat11), 
		.mat12(mat12), 
		.mat20(mat20), 
		.mat21(mat21), 
		.mat22(mat22), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		mat00 = 0;
		mat01 = 0;
		mat02 = 0;
		mat10 = 0;
		mat11 = 0;
		mat12 = 0;
		mat20 = 0;
		mat21 = 0;
		mat22 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		mat00 = 1;
		mat01 = 1;
		mat02 = 2;
		mat10 = 3;
		mat11 = 1;
		mat12 = 5;
		mat20 = 1;
		mat21 = 2;
		mat22 = 1;
		
		#100;
		
		mat00 = 1;
		mat01 = 0;
		mat02 = 0;
		mat10 = 3;
		mat11 = 1;
		mat12 = 0;
		mat20 = 1;
		mat21 = 0;
		mat22 = 1;
		
		#100;
	end
      
endmodule


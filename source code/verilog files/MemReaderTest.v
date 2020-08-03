`timescale 1ns / 1ps
module MemReaderTest;

	// Inputs
	reg [3:0] a;

	// Outputs
	wire [7:0] spo;

	// Instantiate the Unit Under Test (UUT)
	memory uut (
		.a(a), 
		.spo(spo)
	);

	initial begin
		// Initialize Inputs
		a = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		while(1)
		begin
			#50 a = a + 1;
		end
	end
	
	always @(a)
	begin
		#1;
		$display("Mem value is : %b" , spo);
	end
      
endmodule


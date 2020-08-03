`timescale 1ns / 1ps
module Top();
wire clk;
wire subClk;
reg clkStarted;
reg processorStarted;
wire out;
wire finished;
integer outputFile;
reg[7:0] i;

parameter w = 16'd224;

	ClockGeneratorModule clkGenerator (
		.clkSlow(clk), 
		.clkFast(subClk)
	);
Processor proc(clk , subClk ,processorStarted,out , finished);

initial
begin
clkStarted = 0;
processorStarted = 0;
end

initial
begin
	outputFile = $fopen("SobelOutputFile.coe");
	$fwrite(outputFile , "memory_initialization_radix = 2;\nmemory_initialization_vector = \n");
	for(i = 0; i<w ;i = i+1)
		$fwrite(outputFile , "11100000,\n");
		
end



always@(posedge clk)
begin
	if(clkStarted)
	begin
		processorStarted = 1;
	end
	else
	begin
		clkStarted = 1;
	end
	
	if(processorStarted && ~finished)
	begin
		for(i = 0; i<8;i = i+1)
			$fwrite(outputFile , "%b" , out===1);
		$fwrite(outputFile , ",\n");
	end
end


always @(posedge finished)
begin
	for(i = 0; i<w ;i = i+1)
		$fwrite(outputFile , "11100000,\n");
	$fwrite(outputFile , ";");
	$fclose(outputFile);
end

endmodule
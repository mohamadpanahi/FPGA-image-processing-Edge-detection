`timescale 1ns / 1ps
module FileTest();
reg [15:0] i;
integer outputFile;
reg clk;


initial
begin
	i = 0;
	clk = 0;
	outputFile = $fopen("testOutputFile.txt");
	$fwrite(outputFile , "this is simple text in the file\n");
	
	for(i = 0; i<55000;i = i+1)
		begin
			#50
			$fwrite(outputFile , "%04d ==> %b\n" , i,clk);		
			clk = ~clk;
		end
	
	$display("File was written.");
	$fclose(outputFile);
end


endmodule

`timescale 1ns / 1ps
module MemoryInterface(subClk,p , top, middle, bottom);

parameter w = 16'd224;

input subClk;
input [15:0] p;
output reg [7:0] top, middle, bottom;

reg [2:0] state;

reg [15:0] address;
wire [7:0] data;


memoryImage4 mem (.a(address), .spo(data));

initial 
begin
state = 3'b001;
end

always@(posedge subClk)
begin
		case(state)
			1:
				begin
					address = p-w+2;
					#0 top = data;
				end
			2:
				begin
					address = p+1;
					#0 middle = data;
				end
			4:
				begin
					address = p+w+1;
					#0 bottom = data;
				end
			default: $display("state is not handled ......... ");
		endcase
		
		state = {state[1:0] , state[2]};
end


	
endmodule

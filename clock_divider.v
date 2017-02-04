`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:20:30 01/09/2017 
// Design Name: 
// Module Name:    clock_divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clock_divider(clk_out,clk_in);
	input clk_in;
	output reg clk_out;
	reg [3:0] i=0;
	
	always@(posedge clk_in)
	begin
		i = i+1;
		if(i<6)
		clk_out <= 0;
		else 
		clk_out <= 1;
		if(i==10)
		i = 0;
	end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:30:12 01/16/2017 
// Design Name: 
// Module Name:    parallel_to_serial_converter 
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
module parallel_to_serial(sr_out,pr_in,clk,rst,flag);
	input [9:0] pr_in;
	input clk,rst;
	output reg sr_out;
	reg [31:0] pckt_count;
	reg [3:0] i;
	output reg flag;
	
	always@(posedge clk,posedge rst)
	begin
		if(rst)
		begin
			i <= 0;
			sr_out <= 0;
			pckt_count <= 0;
			flag <= 0;
		end
		else
		begin
			sr_out <= pr_in[i];
			i <= i + 1'b1;
			if(i==10) 	
			begin
				i <= 0;
				pckt_count <= pckt_count + 1;
				sr_out <=0;
				flag <= 1;				
			end
			else flag <= 0;
		end
	end
endmodule


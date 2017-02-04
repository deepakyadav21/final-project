`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:38:13 01/16/2017 
// Design Name: 
// Module Name:    top_module 
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
module topmodule_transmitterr(d_in,k_in,clk,rst,d_out);
	input [7:0] d_in;
	input clk,rst,k_in;
	output d_out;
	wire clk_e;
	wire [7:0] s_out;
	wire [9:0] e_out;
	
	scrambler s1(s_out,k_out,d_in,k_in,clk,rst);
	clock_divider c1(clk_e,clk);
	encoder e1(e_out,s_out,clk_e,rst,k_in);
	parallel_to_serial p1(d_out,e_out,clk,rst,flag);
	
endmodule
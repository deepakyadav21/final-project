`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:22:51 01/07/2017 
// Design Name: 
// Module Name:    AASD 
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
module AASD(AASD_output, clk, rst);
reg R1;
output reg AASD_output;
input clk, rst;

always @(posedge clk or negedge rst)
if(!rst) 
begin
R1 <= 1'b0;
AASD_output <= 0; 
end 
else
begin
R1 <= 1'b1;
AASD_output <= R1;
end
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:11:53 01/09/2017 
// Design Name: 
// Module Name:    Clock_Generator 
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
module Clock_Generator( output reg clk 
    );
parameter period =400, duty = 50;
initial 
clk = 1'b0;
always 
#((period*duty)/100) clk = ~clk;

endmodule

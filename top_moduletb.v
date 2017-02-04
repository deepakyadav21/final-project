`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:41:07 01/16/2017
// Design Name:   AASD
// Module Name:   C:/Users/jyoti yadav/Desktop/deepak/project_final/AASD/top_moduletb.v
// Project Name:  Transmitter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AASD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_moduletb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire AASD_output;

	// Instantiate the Unit Under Test (UUT)
	AASD uut (
		.AASD_output(AASD_output), 
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


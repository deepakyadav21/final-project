`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:27:28 01/15/2017 
// Design Name: 
// Module Name:    scrambler 
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
module scrambler(s_out,k_out,s_in,k_in,clk,rst);
	input clk,rst,k_in;
	input [7:0] s_in;
	output reg [7:0] s_out;
	output reg k_out;
	reg [15:0] q;
	reg [3:0]i;
	wire x1,x2,x3;

//LFSR for (x^16+x^5+x^4+x^3+1)
 	
	xor(x1,q[2],q[15]);
	xor(x2,q[3],q[15]);
	xor(x3,q[4],q[15]);
	
	always@(posedge clk, posedge rst)
	begin
		if(rst)
		begin
			q <= 16'h FFFF;
			i <= 0;
			s_out <= 0;
			k_out <= 0;
		end
		else
		begin
			q <= {q[14:5],x3,x2,x1,q[1:0],q[15]};
			
//scrambler

			s_out[i] <= s_in[i] ^ q[15];
			i <= i + 1'b1;
			k_out <= k_in;
			if(i==8)
			i <= 0;
		end
	end
	
				

endmodule

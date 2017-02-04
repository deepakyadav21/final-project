`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:55:18 01/07/2017 
// Design Name: 
// Module Name:    parallel_in_serial_out 
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

 module serial (clk, reset, loaden_o, serdes_factor,serial_data_out,parallel_data_in);
input clk;
input reset;
input loaden_o;
input serdes_factor;
input [7:0] parallel_data_in;
output reg serial_data_out;
reg [7:0] sft_reg;
reg [3:0] count_ps;
always @ ( posedge clk or negedge reset)
begin
  if (!reset)
  begin
  sft_reg  =10'b0;
  count_ps = 'b0;
  end
else
begin  if(loaden_o == 1'b1)
      sft_reg = parallel_data_in;
     else
     begin
      serial_data_out = sft_reg[0];
      if (serdes_factor == count_ps)
      count_ps =1'b0 ;
      else 
      begin 
      sft_reg = {sft_reg,sft_reg[7:1]};
      count_ps = count_ps + 1;
      end
     end
end
end
endmodule	
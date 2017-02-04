module reset_sync(
output reg rst_sync,
input clk, rst_n);
reg R1;
always @(posedge clk or negedge rst_n)
if(!rst_n) 
begin
R1 <= 1'b0;
rst_sync <= 1'b0; 
end 
else
begin
R1 <= 1'b1;
rst_sync <= R1;
end
endmodule
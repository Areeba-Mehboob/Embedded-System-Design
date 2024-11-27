`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2023 10:33:53 AM
// Design Name: 
// Module Name: clk_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_divider #(parameter clk_count =5 )(clk_in, clk_out ); 
input clk_in;     // Input clock with frequency 100MHz
output reg clk_out=0; // output clock with frequency 100MHz
// reg clk_out; 
  reg [2:0] counter=0;    // 8-bit counter for dividing the clock
  
  always @(posedge clk_in) begin
    // Increment the counter on every rising edge of the input clock
    counter <= counter + 1;
    if (counter == clk_count-1)
      begin
        clk_out <= ~clk_out; // Toggle the output clock
        counter<=0;
      end
end
endmodule

   

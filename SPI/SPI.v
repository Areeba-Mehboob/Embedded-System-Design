`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2023 11:03:53 AM
// Design Name: 
// Module Name: SPI
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


module SPI#(parameter spi_count=32,parameter clk_count=5,parameter pi_count=256) (clk_in, reset,s_d_tx,cs_tx,clk_tx,s_d_rx,cs_rx,clk_rx,debug_rx_state,debug_error,debug_rx_done,debug_rx_counter,debug_tx_done,debug_tx_state,debug_tx_counter,debug_divided_clk);
input  reset,clk_in;
wire [spi_count-1:0] pi;
output  s_d_tx,cs_tx,clk_tx;
input s_d_rx,cs_rx,clk_rx;
wire [spi_count-1:0]po;
wire shift_done;
wire shift_done_r;
wire [2:0]next_state_r;
wire [2:0]state_r;
wire [2:0]state;
wire error;
wire clkout;
reg [spi_count-1:0] n = 0; //counter
wire[spi_count-1:0] i;
wire [spi_count-1:0] j;
//Debug signals
output wire [2:0]debug_rx_state;
output wire [2:0]debug_tx_state;
output wire debug_error;
output wire debug_rx_done;
output wire debug_tx_done;
output wire [spi_count-1:0]debug_rx_counter;
output wire [spi_count-1:0]debug_tx_counter;
output wire debug_divided_clk;
assign debug_rx_state=state_r;
assign debug_tx_state=state;
assign debug_error=error;
assign debug_rx_done=shift_done_r;
assign debug_tx_done=shift_done;
assign debug_rx_counter=j;
assign debug_tx_counter=i;
assign debug_divided_clk=clkout;
                                                            //Instantiate the SPI TRANSMITTER module
SPI_trans_piso #(.spi_count(spi_count),.clk_count(clk_count)) SPI_trans_piso (.clk_in(clk_in),.receive(shift_done_r),.i(i),.pi(pi),.clkout(clkout),.reset(reset),.so(s_d_tx),.cs(cs_tx),.shift_done(shift_done),.clk(clk_tx),.error(error),.state(state));
                                                            //Instantiate the SPI RECEIVER module
SIPO #(.spi_count(spi_count))SIPO(.clk_in(clk_in),.clk(clk_rx),.reset(reset),.latch_r(cs_rx),.si(s_d_rx),.po(po),.shift_done_r(shift_done_r),.next_state_r(next_state_r),.state_r(state_r),.error_r(error),.trans_done(shift_done),.j(j));
always @(negedge clkout)
begin
if(~error)
begin
if (shift_done && ~reset) 
begin
    if (n < pi_count && ~error) 
    begin
    n <= n + 1;
    end
    else if(n==pi_count) 
    begin
    n<=0;
    end
    else
    begin
    n<=n;
    end
end
else if(reset) 
begin
n<=0;
end
else 
begin
n<=n;
end
end
else
begin
n<=0;
end
end
assign pi=n; // counters value is assigned to my parallel input
endmodule

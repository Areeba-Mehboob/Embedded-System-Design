`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2023 03:23:19 PM
// Design Name: 
// Module Name: SIPO
// Project Name: 
//////////////////////////////////////////////////////////////////////////////////
//module SIPO#(parameter sipo_count=16)(clk,mode, si, po,shift_done_r);
//input clk, si,mode;
//output reg shift_done_r=0;
//output reg [sipo_count-1:0] po=0 ;
//reg [sipo_count-1:0] j=0; // counter
//// Define states for the FSM
//localparam IDLE_r = 2'b00;
//localparam SHIFT_DATA_r = 2'b01;
//localparam SHIFT_DONE_r = 2'b10;
//reg [1:0] next_state_r=0; // 2-bit state register
//reg [1:0] state_r=0; // 2-bit state register
//// Control path
//always @(posedge clk) 
//begin
//if (mode)
//begin
//    state_r <= IDLE_r;
//end
//else if(~mode)
//begin
//    state_r <= next_state_r;
////    po[sipo_count-1]=si;
//end
//end
//// Data path
//always @(posedge clk) 
//begin
//case (state_r)
//    IDLE_r:
//    begin
//    if(mode)
//    begin
//        po<= 0;
//    end
//    end
//    SHIFT_DATA_r:
//    begin
//    if(~mode)
//    begin
//        if (j<= sipo_count)
//        begin
//        po[sipo_count-1]=si;
//        po <= {po[sipo_count-2:0], po[sipo_count-1]}; // Left Shift
//        j <= j + 1;
//        end 
//        else 
//        begin
//        shift_done_r <= 1;
//        end
//    end
//    end
//    SHIFT_DONE_r:
//    begin
//    if(j>sipo_count)
//    begin
//        j <= 0; // Reset the counter
//        shift_done_r <= 1;
//    end
//    end
//endcase
//end
//// Control path updates next_state based on state transitions
//always @(*) 
//begin
//case (state_r)
//    IDLE_r:
//    begin
//        if (~mode)
//        begin
//        next_state_r=SHIFT_DATA_r;
//        end
//        else if(mode)
//        begin
//        next_state_r=IDLE_r;
//        end
//    end
//    SHIFT_DATA_r:
//    begin
//        if( j>sipo_count)
//        begin
//        next_state_r=SHIFT_DONE_r;
//        end
//        else if(j<sipo_count)
//        begin
//        next_state_r=SHIFT_DATA_r;
//        end
//    end
//    SHIFT_DONE_r:
//    begin
//        if (shift_done_r==1)
//        begin
//        next_state_r=IDLE_r;
//        end
//        else if (shift_done_r==0)
//        begin
//        next_state_r=SHIFT_DATA_r;
//        end
//        else
//        begin
//        next_state_r=SHIFT_DONE_r;
//        end
//    end
//endcase
//end
//endmodule
//always @(posedge clk)
//begin
//if (mode)
//po <= 0;
//else
//begin
//    if (j < sipo_count)
//    begin
//    po[sipo_count-1]=si;
//    po <= {po[sipo_count-2:0], po[sipo_count-1]}; // Left Shift
//    j <= j + 1;
//    end 
//    else if(j==sipo_count) 
//    begin
//    j <= 0; // Reset the counter
//    shift_done_r <= 1;
//    end
//end
//end
//module SIPO#(parameter sipo_count=16)(clk,mode,latch_r,si, po,shift_done_r,next_state_r,state_r);
//input clk, si,mode,latch_r;
//output reg shift_done_r=0;
//output [sipo_count-1:0] po;
//reg [sipo_count-1:0] p_o=0 ;
//reg [sipo_count-1:0] x=0 ;
//reg [sipo_count-1:0] j=0; // counter
//reg done=0;
//// Define states for the FSM
//localparam IDLE_r = 2'b00;
//localparam SHIFT_DATA_r = 2'b01;
//localparam SHIFT_DONE_r = 2'b10;
//output reg [1:0] next_state_r=0; // 2-bit state register
//output reg [1:0] state_r=0; // 2-bit state register
//                                                           // SPI RECEIVER 
//always @(posedge clk) 
//begin
//if (mode)
//begin
//    state_r <= IDLE_r;
//end
//else if(~mode)
//begin
//    state_r <= next_state_r;
//end
//end
//// Data path for receiver
//always @(posedge clk) 
//begin
//case (state_r)
//    IDLE_r:
//    begin
////    shift_done_r<=0;
//    if(mode)
//    begin
//        p_o<= 0;
//        j<=0;
//    end
//    end
//    SHIFT_DATA_r:
//    begin
//    if(~mode)
//    begin
//    p_o<=0;
////         shift_done_r <= 0;
//        if (j < sipo_count-1 && latch_r==0)
//        begin
////        po[sipo_count-1]=si;
//        p_o <= {p_o[sipo_count-2:0], si}; // Left Shift
//        j <= j + 1;
//        if(j==sipo_count-2)
//        begin
//        done<=1;
////        po<=p_o;
//        end
//        else
//        begin
//        done<=0;
//        end
//        end 
//        else 
//        begin
//        j<=0;
////        shift_done_r <= 1;
////        po<=0;
//        end
//    end
//    end
//    SHIFT_DONE_r:
//    begin
//    if(j==sipo_count-1)
//    begin
//        j <= 0; // Reset the counter
////        shift_done_r <= 1;
//    end
//    end
//endcase
//end
//// Control path for RECEIVER
////updates next_state based on state transitions
//always @(*) 
//begin
//case (state_r)
//    IDLE_r:
//    begin
//        if (~mode)
//        begin
//        next_state_r=SHIFT_DATA_r;
//        end
//        else
//        begin
//        next_state_r=IDLE_r;
//        end
//    end
//    SHIFT_DATA_r:
//    begin
//        if( j==sipo_count-1 && latch_r==1)
//        begin
//        next_state_r=SHIFT_DONE_r;
//        end
//        else if(mode)
//        begin
//        next_state_r=IDLE_r;
//        end
//        else
//        begin
//        next_state_r=SHIFT_DATA_r;
//        end
//    end
//    SHIFT_DONE_r:
//    begin
//        if (j==0)
//        begin
//        next_state_r=IDLE_r;
//        end
//        else if(mode)
//        begin
//        next_state_r=IDLE_r;
//        end
//        else
//        begin 
//        next_state_r=SHIFT_DATA_r;
//        end
//    end
//endcase
//end
//always@(posedge clk)
//begin
//if(done)
//begin
//x<=p_o;
//end
////else
////begin
////x<=x;
////end
//end
//assign po=x;
//endmodule

module SIPO#(parameter spi_count=8)(clk_in,clk,reset,latch_r,si, po,shift_done_r,next_state_r,state_r,error_r,trans_done,j);
input clk_in,clk, si,reset,latch_r,trans_done;
output reg shift_done_r=0;
output [spi_count-1:0] po;
reg [8:0] p_o=0 ;
reg [spi_count-1:0] x=0 ;
output reg [spi_count-1:0] j=0; // counter
// Define states for the FSM
localparam IDLE_r = 3'b000;             //state 0
localparam WAIT_CS_r = 3'b001;          //state 1
localparam SHIFT_DATA_r = 3'b010;       //state 2
localparam SHIFT_DONE_r = 3'b011;       //state 3
localparam ERROR_r=3'b100;              //state 4
output reg [2:0] next_state_r=0; // 2-bit state register
output reg [2:0] state_r=0; // 2-bit state register
output reg error_r=0;                                                           // SPI RECEIVER 
reg [1:0]ped_sr=0; // positive edge detection shift register
always @(posedge clk_in) //positive edge detection of slow clock
begin
    ped_sr[0] <= clk;       
    ped_sr[1]<= ped_sr[0];
end
//control path
always @(posedge clk_in) 
begin
if (reset)
begin
    state_r <= IDLE_r;
end
else
begin
    state_r <= next_state_r;
end
end
// Data path for receiver
always @(posedge clk_in) 
begin
case (state_r)
    IDLE_r:      //Resetting the values of registers, flags and counters
    begin
        j<=0;
        error_r<=0;
        shift_done_r<=0;
        p_o<=0;
    end
    WAIT_CS_r:
    begin
    end
    SHIFT_DATA_r:
    begin
        if (j < spi_count && latch_r==0)
        begin
            if (ped_sr[1] && !ped_sr[0])           // if positive edge of slow clock is detected then start shifting
            begin
                p_o <= {p_o[7:0], si}; // Left Shift
                j <= j + 1;
            end
            else
            begin
                p_o<=p_o;
                j<=j;
            end
        end 
        else 
        begin
            p_o<=p_o;
            j<=j;
        end
    end
    SHIFT_DONE_r: //raising shift done flag
    begin
        shift_done_r<=1;
    end
    ERROR_r:   //raising error flag
    begin
        error_r<=1;
        p_o<=p_o;
    end
    default:
    begin
    end
endcase
end
// Control path for RECEIVER
//updates next_state based on state transitions
always @(*) 
begin
case (state_r)
    IDLE_r:          // if reset is 0 and latch is low then move to state shift data
    begin
//        if (latch_r)
//        begin
        next_state_r<=WAIT_CS_r;
//        end
//        else
//        begin
//        next_state_r<=IDLE_r;
//        end
        
//        else if(~latch_r)
//        begin
//        next_state_r<=ERROR_r;
//        end
    end
        WAIT_CS_r:          // Waiting for latch if it is low then move to state shift data
    begin
        if (~latch_r)
        begin
        next_state_r<=SHIFT_DATA_r;
        end
//        else if (reset==1)
//        begin
//        next_state_r<=IDLE_r;
//        end
        else
        begin
        next_state_r<=WAIT_CS_r;
        end
//        else if(j!=0 &&latch_r)
//        begin
//        next_state_r<=ERROR_r;
//        end
//        else if(si&&latch_r)
//        begin
//        next_state_r<=ERROR_r;
//        end
    end
    SHIFT_DATA_r:     //if reset is 0 and data is shifted move to state shift done 
    begin
        if(trans_done&&latch_r)
        begin
        next_state_r<=SHIFT_DONE_r;
        end
        else if (j!=0 && j < spi_count-1 && latch_r)    // If data is not shifted and chip select is high move to state error
        begin
        next_state_r<=ERROR_r;
        end
        else if (trans_done&&~latch_r) //Overflow
        begin
        next_state_r<=ERROR_r;
        end
//        else if (reset==1)
//        begin
//        next_state_r<=IDLE_r;
//        end
        else
        begin
        next_state_r<=SHIFT_DATA_r;
        end
    end
    SHIFT_DONE_r:
    begin
        if (shift_done_r && latch_r)   //if shift done flag is high or reset is high in any case with high latch move to idle 
        begin
        next_state_r<=IDLE_r;
        end
        else if (j!=0 && j < spi_count-1 && latch_r)    // If data is not shifted and chip select is high move to state error
        begin
        next_state_r<=ERROR_r;
        end
        else
        begin 
        next_state_r<=SHIFT_DONE_r;
        end
    end
    ERROR_r:
    if(~latch_r)
    begin
        next_state_r<=ERROR_r;
    end
    else 
    begin
        next_state_r<=IDLE_r;
    end
//        if(j!=0 &&j < spi_count-1&&~latch_r)    //if error is high or reset is high move to idle
//        next_state_r<=IDLE_r;
        
//        else if (j==spi_count-1&&latch_r)
//        begin
//        next_state_r<=SHIFT_DATA_r;
//        end
//        else 
//        next_state_r<=ERROR_r;
     default:
     begin
     next_state_r<=IDLE_r;
     end
endcase
end
always@(posedge clk_in)
begin
    if(shift_done_r) // if done flag is high value of p_o to x
        begin
        x<=p_o;
        end
    else if(state_r==ERROR_r)
        begin
        x<=x;
        end
    else
        begin
        x<=x;
        end
end
assign po=x;//assigning value of register x to parallel output
endmodule
//module SIPO#(parameter sipo_count=16)(clk,mode,latch_r,si, po,shift_done_r,next_state_r,state_r);
//input clk, si,mode,latch_r;
//output reg shift_done_r=0; // Done Flag
//output [sipo_count-1:0] po; // Parallel Output
//reg [sipo_count-1:0] p_o=0 ;// Shift Register
//reg [sipo_count-1:0] x=0 ;
//reg [sipo_count-1:0] j=0; // counter
//reg done=0;
//// Define states for the FSM
//localparam IDLE_r = 2'b00;
//localparam SHIFT_DATA_r = 2'b01;
//localparam SHIFT_DONE_r = 2'b10;
//output reg [1:0] next_state_r=0; // 2-bit state register
//output reg [1:0] state_r=0; // 2-bit state register
//                                                           // SPI RECEIVER 
//// Control path for receiver                                                           
//always @(posedge clk) 
//begin
//if (mode)
//begin
//    state_r <= IDLE_r;
//end
//else if(~mode)
//begin
//    state_r <= next_state_r;
//end
//end
//// Data path for receiver
//always @(posedge clk) 
//begin
//case (state_r)
//    IDLE_r:
//    begin
//    shift_done_r<=0; // Set Done Flag to 0
//    if(mode) // Resetting the receiver
//    begin
//        p_o<= 0; // set shift register to 0
//        shift_done_r<=0; // set done flag to 0
//        j<=0; // set counter to 0
//    end
//    else
//    begin
//    p_o<=p_o ; 
//    shift_done_r<=shift_done_r; 
//    j<=j; 
//    end
//    end
//    SHIFT_DATA_r:
//    begin
//    shift_done_r<=0;
//    if(~mode)
//    begin
//        if (j <= sipo_count&& latch_r==0)  // loop will run until j reaches sipo_count value
//        begin
//        p_o <= {p_o[sipo_count-2:0], si}; // Left Shift
//        j <= j + 1;  // incrementing j
//        end 
//        else 
//        begin
//        p_o<=p_o;  
//        j<=j;
//        done<=1;// Done to assign shift register's value to parallel output
//        end
//    end
//    else // Resetting the receiver
//    begin
//        p_o<= 0; // set shift register to 0
//        shift_done_r<=0; // set done flag to 0
//        j<=0; // set counter to 0
//    end
//    end
//    SHIFT_DONE_r:
//    begin
//    if(j>sipo_count)
//    begin
//    shift_done_r=1; // Done flag to confirm that the data is shifted from serial to parallel
//    j<=0;
//    done<=0;
//    end
//    else 
//    begin
//    shift_done_r=0; // Done flag to confirm that the data is shifted from serial to parallel
//    j<=j;
//    done<=done;
//    end
//    end
//endcase
//end
//// Control path for RECEIVER
////updates next_state based on state transitions
//always @(*) 
//begin
//case (state_r)
//    IDLE_r: // State 0
//    begin
//        if (~mode)// if mode is high go to state 1
//        begin
//        next_state_r=SHIFT_DATA_r;
//        end
//        else
//        begin
//        next_state_r=IDLE_r;
//        end
//    end
//    SHIFT_DATA_r: // state 1
//    begin
//        if( j>sipo_count&& latch_r==1) // if counter value is greater than sipo_count go to state 2
//        begin
//        next_state_r=SHIFT_DONE_r;
//        end
//        else if (mode==1) //if mode is high go to state 0
//        begin
//        next_state_r=IDLE_r;
//        end
//        else // if counter value is <= sipo_count go to state 1
//        begin
//        next_state_r=SHIFT_DATA_r;
//        end
//    end
//    SHIFT_DONE_r: // state 2
//    begin
//        if (shift_done_r==1 || mode==1) //if done flag is high or mode is high go to state 0
//        begin
//        next_state_r=IDLE_r;
//        end
//        else if (shift_done_r==0 || mode==0)
//        begin 
//        next_state_r=SHIFT_DATA_r;
//        end
//        else 
//        begin
//        next_state_r=SHIFT_DONE_r;
//        end
//    end
//endcase
//end
//always@(posedge clk)
//begin
//if(done) // If done flag is high store shift registers value in another register
//begin
//x<=p_o;
//end
//else
//begin
//x<=x;
//end
//end
//assign po=x; // assign register value to parallel output
//endmodule

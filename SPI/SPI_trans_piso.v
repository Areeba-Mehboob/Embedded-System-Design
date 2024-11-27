`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2023 01:09:25 PM
// Design Name: 
// Module Name: SPI_trans_piso
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
//module SPI_trans_piso#(parameter piso_count=8,parameter clk_count=5) (clk_in,i,pi,clkout, mode,so,latch_t, shift_done,clk);
// input  mode,clkout,clk_in;
// input [piso_count-1:0] pi=0;
// output reg so=0,latch_t=1;
// output reg shift_done=0;
//output reg clk=0;
// reg [4:0] counter=0;
////    reg [piso_count-1:0] q = 0;
////    reg [piso_count-1:0] n = 0;
//    reg [piso_count-1:0] m = 0;
// output reg [piso_count-1:0] i=0;
    
//    // Define states for the FSM
//    localparam IDLE = 2'b00;
//    localparam SHIFT_DATA = 2'b01;
//    localparam SHIFT_DONE = 2'b10;
    
//    reg [1:0] next_state=0; // 2-bit state register
//    reg [1:0] state=0; // 2-bit state register
//     // Instantiate the clk_divider module
// clk_divider #(.clk_count(clk_count)) clk_divider_inst (.clk_in(clk_in),.clk_out(clkout));  
// // Transmitter clock generation
//always @(negedge clk_in)
//begin
//    if (latch_t==1)
//    begin
//    clk=0;
//    end
//    else if (~mode && latch_t==0)
//    begin
//    clk=clkout;
//    end
//    else
//    begin
//    clk=clk;
//    end
//end
//    // Control path
//    always @(negedge clkout) begin
//        if (mode)
//        begin
//            state <= IDLE;
//              m <= pi;
            
//        end
//        else
//        begin
//            state <= next_state;
//        end
//    end
//    // Data path
//    always @(negedge clkout) begin
//        case (state)
//            IDLE:if(mode)begin
//                shift_done<=0;
////                pi=8'b10011011;
//                m<= pi;
////                latch_out<=1; //Default latch signal
//                end
//            SHIFT_DATA:if(~mode)
//                begin
//                m <= pi;
//                  //      q<=pi<<1;
//            latch_t<=0; //Latch signal provided by master
//            shift_done <= 0;  
//            if (i < piso_count)
//            begin
//                m <= {m[piso_count-2:0], m[piso_count-1]}; // Shift left
//                so <= m[piso_count - 1];
//                i <= i + 1;
//            end 
//            else 
//            begin
//                shift_done <= 1;
//                i <= 0; // Reset the counter
//                latch_t<=1; //Default latch signal
//            end
                        
//                end
//            SHIFT_DONE:if(i==piso_count)
//                begin
//                shift_done <= 1;
//                end
//        endcase
//    end
//    // Control path updates next_state based on state transitions
//    always @(*) begin
//    case (state)
//            IDLE:
//                if (~mode)
//                    next_state=SHIFT_DATA;
//                else
//                    next_state=IDLE;
//            SHIFT_DATA:
//                if( i==piso_count)
//                    next_state=SHIFT_DONE;
//                else
//                    next_state=SHIFT_DATA;
//            SHIFT_DONE:
//                if (shift_done==1)
//                    next_state=IDLE;
//                else if(shift_done==0 )
//                    next_state=SHIFT_DATA;
//                else
//                next_state=SHIFT_DONE;
//    endcase
//    end 
////always @(negedge clkout)
////begin
////if (i==piso_count && ~mode) 
////begin
////if (n < piso_count) 
////begin
////q<=n;
//////q <= pi;
////n <= n + 1;
////end 
////else
////begin
////q<=q;
////n<=n;
//////q <= q;
////end
////end
////else
////begin
////n<=n;
////end
////end
////assign pi=q;
//endmodule
//module SPI_trans_piso#(parameter piso_count=5,parameter clk_count=5) (clk_in,i,pi,clkout, reset,so,cs, shift_done,clk);
// input  reset,clkout,clk_in;
// input [piso_count-1:0] pi;
// output reg cs=1;
// output so;
// reg so_temp=0;
// output reg shift_done=0;
//output reg clk=0;
// reg [4:0] counter=0;
//    reg [piso_count-1:0] m = 0;
// output reg [piso_count-1:0] i=0; 
//// Define states for the FSM
//    localparam IDLE = 2'b00;
////    localparam WAIT=3'b001;
//    localparam SHIFT_DATA = 2'b10;
//    localparam SHIFT_DONE = 2'b11;
//    localparam WAIT=2'b01;
//    reg [2:0] next_state=0; // 2-bit state register
//    reg [2:0] state=0; // 2-bit state register
//    reg start=0;
//// Instantiate the clk_divider module
// clk_divider #(.clk_count(clk_count)) clk_divider_inst (.clk_in(clk_in),.clk_out(clkout));  
//// Transmitter clock generation
//always @(negedge clk_in)
//begin
//    if (cs==1)
//    begin
//    clk=0;
//    end
//    else
//    begin
//    clk=clkout;
//    end
//end
//    // Control path
//    always @(negedge clkout) begin
//        if (reset)
//        begin
//            state <= IDLE;
            
//        end
//        else
//        begin
//            state <= next_state;
//        end
//    end
//    // Data path
//    always @(negedge clkout) begin
//        case (state)
//            IDLE:begin
//                shift_done<=0;
//                m <= pi;
//                i<=0;
//                cs<=1;
//                start<=0;
//                end
//            WAIT:
//            begin
//            start<=1; 
//            end
//            SHIFT_DATA:
//                begin
//                 m <= pi;
//            shift_done <= 0;
//            cs<=0; //Latch signal provided by master  
//            start<=0;
//            if (i < piso_count)
//            begin
            
//                m <= {m[piso_count-2:0], m[piso_count-1]}; // Shift left
//                so_temp <= m[piso_count - 1];
//                i <= i + 1;
//            end
//            else 
//            begin
//                shift_done <= 1;
//                i <= 0; // Reset the counter
//                cs<=1; //Default latch signal
//            end
//               end
//            SHIFT_DONE:if(i==piso_count)
//                begin
//                shift_done <= 1;
//                end
//                else
//                begin
//                shift_done <= 0;
//                end
////             ERROR:
////                if(i>piso_count && cs==0)
////                begin
////                error<=1;
////                end
////                else if(i!=0 && i<=piso_count && cs==1)
////                begin
////                error<=1;
////                end
//        endcase
//    end
//    // Control path for transmitter 
//    //updates next_state based on state transitions
//    always @(*) begin
//    case (state)
//            IDLE:
//                if (~reset)
//                     next_state=WAIT;
//                else
//                    next_state=IDLE;
//            WAIT:
//                if(start&&~reset)
//                next_state=SHIFT_DATA;
//                else if(reset)
//                next_state=SHIFT_DATA;
//                else
//                next_state=WAIT;
//            SHIFT_DATA:
//                if( i==piso_count && cs==0)
//                    next_state=SHIFT_DONE;
//                else if(reset)
//                    next_state=IDLE;
////                else if(i!=0 && i<=piso_count && cs==1)
////                    next_state=ERROR;
//                else
//                    next_state=SHIFT_DATA;
//            SHIFT_DONE:
//                if (shift_done || reset)
//                    next_state=IDLE;
//                else if(shift_done==0 && reset==0 )
//                    next_state=SHIFT_DATA;
////                else if(i>piso_count && cs==0)
////                    next_state=ERROR;
////                else if(i!=0 && i<=piso_count && cs==1)
////                    next_state=ERROR;
//                else
//                next_state=SHIFT_DONE;
////            ERROR:
////                if(error||reset)
////                next_state<=IDLE;
////                else 
////                next_state<=ERROR;
//    endcase
//    end 
//    assign so=so_temp;
//endmodule
module SPI_trans_piso#(parameter spi_count=5,parameter clk_count=5) (clk_in,receive,i,pi,clkout, reset,so,cs, shift_done,clk,error,state);
 input  reset,clkout,clk_in,receive,error;
 input [spi_count-1:0] pi;
 output reg cs=1;
 output so;
 reg so_temp=0;
 output reg shift_done=0;
output reg clk=0;
 reg [4:0] counter=0;
 reg [spi_count-1:0] m = 0;
 output reg [spi_count-1:0] i=0; 
// Define states for the FSM
    localparam IDLE = 2'b00;            // state 0
    localparam WAIT=2'b01;              // state 1
    localparam SHIFT_DATA = 2'b10;      // state 2
    localparam SHIFT_DONE = 2'b11;      // state 3
    reg [2:0] next_state=0; // 2-bit state register
    output reg [2:0] state=0; // 2-bit state register
    reg start=0;
// Instantiate the clk_divider module
 clk_divider #(.clk_count(clk_count)) clk_divider_inst (.clk_in(clk_in),.clk_out(clkout));  
// Transmitter clock generation
always @(negedge clk_in)
begin
    if (cs==1)
    begin
    clk=0;
    end
    else
    begin
    clk=clkout;
    end
end
    // Control path
    always @(negedge clkout) begin
        if (reset)
        begin
            state <= IDLE;
            
        end
        else
        begin
            state <= next_state;
        end
    end
    // Data path
    always @(negedge clkout) begin
        case (state)
            IDLE:
            begin       // resetting the values of shift registers, counters and flags
                shift_done<=0;
                m <= pi;
                i<=0;
                cs<=1;
                start<=0;
                so_temp<=0;
            end
            WAIT: // waiting for start flag to get high
            begin
                start<=1;
                m <= pi; 
            end
            SHIFT_DATA:
            begin
                m <= pi;
                shift_done <= 0;
                cs<=0; //Latch signal provided by master  
                start<=0;
            if (i < spi_count) //parallel to serial shifting
            begin
            
                m <= {m[spi_count-2:0], m[spi_count-1]}; // Shift left
                so_temp <= m[spi_count - 1];
                cs<=0;
                i <= i + 1;
            end
            else 
            begin
                m <=pi;
                i <= 0; // Reset the counter
                cs<=1; //Default latch signal
                so_temp<=0;
            end
            end
            SHIFT_DONE: // Raising done flag
            begin
                shift_done <= 1;
                so_temp<=0;
            end
            default:
            begin
            end
            
        endcase
    end
    // Control path for transmitter 
    //updates next_state based on state transitions
    always @(*) begin
    case (state)
            IDLE:                        //if reset is 0 go to wait
                if (~reset)
                    next_state=WAIT;
                else
                    next_state=IDLE;
            WAIT:                      //if start flag is raised and reset is 0 go to shift data
                if(start&&~reset)
                    next_state=SHIFT_DATA;
                else if(reset)
                    next_state=SHIFT_DATA;
                else
                    next_state=WAIT;
            SHIFT_DATA:                 //if count has completed and cs is low go to shift done
                if( i==spi_count)
                    next_state=SHIFT_DONE;
                else if(reset)
                    next_state=IDLE;
                else
                    next_state=SHIFT_DATA;
            SHIFT_DONE:                //if shift done flag is raised or reset is high go to idle 
                if (shift_done||cs)
                    next_state=IDLE;
                else if(reset)
                    next_state=IDLE;
                else if(shift_done==0 && reset==0 )
                    next_state=SHIFT_DATA;
                else
                    next_state=SHIFT_DONE;
             default:
                begin
                    next_state=IDLE;
                end
    endcase
    end 
    assign so=so_temp;
endmodule
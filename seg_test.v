`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/22 12:20:24
// Design Name: 
// Module Name: seg_test
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


module seg_test(
input clk, rst,
input key0,
input [3:0] enc,
input [7:0] dip,
output reg[7:0] seg_d,seg_com

    );
    
wire kdot;
wire [3:0] din;
wire [6:0] segd;

//assign input to internal module seg_test
assign kdot = ~key0;
assign din  = ~enc;

//hex to segment module seg_test
assign segd = (din == 4'h0) ? (7'h3f):
              (din == 4'h1) ? (7'h06):
              (din == 4'h2) ? (7'h5b):              
              (din == 4'h3) ? (7'h4f):
              (din == 4'h4) ? (7'h66):                            
              (din == 4'h5) ? (7'h6d):              
              (din == 4'h6) ? (7'h7d):              
              (din == 4'h7) ? (7'h27):              
              (din == 4'h8) ? (7'h7f):              
              (din == 4'h9) ? (7'h6f):              
              (din == 4'ha) ? (7'h5f):              
              (din == 4'hb) ? (7'h7c):              
              (din == 4'hc) ? (7'h58):              
              (din == 4'hd) ? (7'h5e):    
              (din == 4'he) ? (7'h7b):    
                              (7'h71);
                              
// output selection
always@(negedge rst, posedge clk)
if(rst == 0)
    begin
        seg_d <= 8'h00;
        seg_com <= 8'h00;
    end
else
    begin
        seg_d <= {kdot, segd};
        seg_com <= dip;
    end

    
endmodule

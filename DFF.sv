`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2023 11:26:40 PM
// Design Name: 
// Module Name: DFF
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


module DFF(
      input     logic      clk,
      input     logic      reset,
      input     logic      d,
      output    logic      q_nrst,
      output    logic      q_sync,
      output    logic      q_async);
    
      // No reset
      always_ff @(posedge clk)
        q_nrst <= d;
    
      // Syncronous reset
      always_ff @(posedge clk)
        if (reset)
          q_sync <= 1'b0;
        else
          q_sync <= d;
    
      // Asyncronous reset
      always_ff @(posedge clk or posedge reset)
        if (reset)
          q_async <= 1'b0;
        else
          q_async <= d;
    
endmodule
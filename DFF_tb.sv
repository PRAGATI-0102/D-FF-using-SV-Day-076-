`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2023 11:31:24 PM
// Design Name: 
// Module Name: DFF_tb
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


module DFF_tb();

          logic      clk;
          logic      reset;
          logic      d;
          logic      q_nrst;
          logic      q_sync;
          logic      q_async;
          
          DFF dut(.*);
          
          always 
          begin
            clk = 1'b1;
            #5;
            clk = 1'b0;
            #5;
         end

          initial 
          begin
            reset = 1'b1;
            d = 1'b0;
            
            @(posedge clk);
            reset = 1'b0;
            
            @(posedge clk);
            d = 1'b1;
            
            @(posedge clk);
            @(posedge clk);
            @(negedge clk);
            reset = 1'b1;
            @(posedge clk);
            @(posedge clk);
            reset = 1'b0;
            @(posedge clk);
            @(posedge clk);
            $finish();
          end
    
endmodule

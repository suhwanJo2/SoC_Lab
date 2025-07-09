`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 23:10:32
// Design Name: 
// Module Name: delay
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


module delay#(
    parameter  DELAY_CLK = 200000 
)(
    input           clk,
    input           delayEn,
    output  reg     delayDone
    );

reg [17:0] counter;

always @(posedge clk) begin
    if (delayEn & (counter != DELAY_CLK)) begin
        counter <= counter + 1;
    end
    else begin
        counter <= 0;
    end
end

always @(posedge clk) begin
    if (delayEn & (counter == DELAY_CLK)) begin
        delayDone <= 1'b1;
    end
    else begin
        delayDone <= 1'b0;
    end
end

endmodule

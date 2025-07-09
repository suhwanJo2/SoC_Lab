`timescale 1ns / 1ps
module timer(
    input               clk,
    input               rstn,
    input               en,
    output reg [31:0]   timeValue
    );//


always @(posedge clk) begin
    if (!rstn) begin
        timeValue <= 32'd0;
    end
    else begin
        if (en) begin
            //timeValue <= timeValue + 32'd1;
            timeValue <= timeValue;
        end
        else begin
            timeValue <= timeValue;
        end
    end
end
endmodule

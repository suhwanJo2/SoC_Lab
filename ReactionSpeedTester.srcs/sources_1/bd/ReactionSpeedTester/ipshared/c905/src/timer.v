`timescale 1ns / 1ps
module timer(
    input               clk,
    input               rstn,
    input               en,
    output [31:0]   timeValue
    );
reg [31:0] counter;

always @(posedge clk) begin
    if (rstn == 1'b0) begin
        counter[31:0] <= 32'd0;
    end
    else begin
        if (en) begin
          counter[31:0] <= counter[31:0] + 32'd1;
        end
    end
end

assign timeValue = counter;
endmodule

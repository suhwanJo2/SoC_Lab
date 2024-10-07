`timescale 1ns / 100ps

module DigOutPort
(
	input			iRST,
	input			iCLK,
	
	input	[31:0]	iADR,
	input	[31:0]	iDAT,
	output	[31:0]	oDAT,
	input			iWE,
	input			iSTB,
	output			oACK,
	
	output	[31:0]	oDOUTA,
	output	[31:0]	oDOUTB,
	output	[31:0]	oDOUTC
);

reg [31:0]   rRegA;
reg [31:0]   rRegB;
reg [31:0]   rRegC;
wire        wSel;

assign  oACK = iSTB;
/*Data Read*/
assign  oDAT[31:0] = (iSTB & ~iWE) ? ((iADR[7:0]==8'h00) ? rRegA[31:0] : 
									  (iADR[7:0]==8'h10) ? rRegB[31:0] : 
									  (iADR[7:0]==8'h20) ? rRegC[31:0] : 32'hZZZZ_ZZZZ)
																	   : 32'hZZZZ_ZZZZ;

always @(posedge iCLK)
begin
    if(iRST) begin
        rRegA[31:0] <= 32'h0000_0000;
		rRegB[31:0] <= 32'h0000_0000;
		rRegC[31:0] <= 32'h0000_0000;
    end
    else begin
        if(iSTB & iWE) begin
			case (iADR[7:0])
				8'h00: rRegA[31:0] <= iDAT[31:0];
				8'h10: rRegB[31:0] <= iDAT[31:0];
				8'h20: rRegC[31:0] <= iDAT[31:0];
			endcase   
        end
    end
end

assign  oDOUTA[31:0] = rRegA[31:0];
assign  oDOUTB[31:0] = rRegB[31:0];
assign  oDOUTC[31:0] = rRegC[31:0];

endmodule

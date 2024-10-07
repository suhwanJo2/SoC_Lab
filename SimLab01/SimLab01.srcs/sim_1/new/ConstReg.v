`timescale 1ns / 1ps

module ConstReg(
	input			iRST,
	input			iCLK,
	
	input	[31:0]	iADR,
	input	[31:0]	iDAT,
	output	[31:0]	oDAT,
	input			iWE,
	input			iSTB,
	output			oACK
    );

    reg     [31:0]  CReg;
    wire            wSel;

    assign oDAT[31:0] = (iSTB & ~iWE) ? CReg[31:0] : 32'hZZZZ_ZZZZ;
    assign oACK = iSTB;

    always @(*) begin
        case (iADR[3:0])
            4'h0:       CReg[31:0] = 32'h0123_4567;
            4'h4:       CReg[31:0] = 32'h1111_1111;
            4'h8:       CReg[31:0] = 32'h2222_2222;
            default:    CReg[31:0] = 32'hZZZZ_ZZZZ;
        endcase
    end

endmodule

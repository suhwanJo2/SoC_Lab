`timescale 1ns / 1ps

module AddrDec_DOT(
	input	[31:0]	iADR,
	input			iSTB,

    output          oSTBh
    );

    assign oSTBh = iSTB & (iADR[31:8] == 24'h0200_00);

endmodule

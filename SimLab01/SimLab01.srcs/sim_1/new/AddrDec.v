`timescale 1ns / 1ps

module AddrDec(
	input	[31:0]	iADR,
	input			iSTB,

    output          oSTBh
    );

    assign oSTBh = iSTB & (iADR[31:4] == 28'h0200_010);

endmodule

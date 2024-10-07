`timescale 1ns / 1ps
module AddrDec_Timer(
	input	[31:0]	iADR,
	input			iSTB,

    output          oSTB_Timer
    );

    assign oSTB_Timer = iSTB & (iADR[31:4] == 24'h0200_100);

endmodule

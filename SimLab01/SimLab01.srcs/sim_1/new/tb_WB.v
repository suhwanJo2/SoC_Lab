`timescale 1ns / 100ps

module tb_WB ;
reg				rRST;
reg				rCLK;

reg		[31:0]	rADR;
reg		[31:0]	rDAT;
wire	[31:0]	wDAT;
reg				rWE;
reg				rSTB;
wire			wACK;

/*wire	[31:0]	wDOUTA;
wire	[31:0]	wDOUTB;
wire	[31:0]	wDOUTC;*/

/*DigOutPort DigOutPort0 (
	.iRST(rRST),
	.iCLK(rCLK),
	
	.iADR(rADR[31:0]),
	.iDAT(rDAT[31:0]),
	.oDAT(wDAT[31:0]),
	.iWE(rWE),
	.iSTB(wSTB_DOT),
	
	.oACK(wACK),
	
	.oDOUTA(wDOUTA[31:0]),
	.oDOUTB(wDOUTB[31:0]),
	.oDOUTC(wDOUTC[31:0])
);*/

wire	wTOUT;
wire	wSTB_Timer;
Timer Timer0 (
	.iRST(rRST),
	.iCLK(rCLK),
	
	.iADR(rADR[31:0]),
	.iDAT(rDAT[31:0]),
	.oDAT(wDAT                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    [31:0]),
	.iWE(rWE),
	.iSTB(wSTB_Timer),
	
	.oACK(wACK),
	
	.oTOUT(wTOUT)
);
AddrDec_Timer AddrDec_Timer0(
	.iADR(rADR[31:0]),
	.iSTB(rSTB),

	.oSTB_Timer(wSTB_Timer)
);

/*wire wSTB_CReg;
ConstReg ConstReg1(
	.iRST(rRST),
	.iCLK(rCLK),
	
	.iADR(rADR[31:0]),
	.iDAT(rDAT[31:0]),
	.oDAT(wDAT[31:0]),
	.iWE(rWE),
	.iSTB(wSTB_CReg),
	.oACK(wACK)
);

AddrDec AddrDec1(
	.iADR(rADR[31:0]),
	.iSTB(rSTB),

	.oSTBh(wSTB_CReg)
);*/

initial begin
/*
	#0			rRST <= 1'b1;
				rCLK <= 1'b1;
				rADR[31:0] <= 32'h0000_0000;
				rDAT[31:0] <= 32'h0000_0000;
				rWE <= 1'b0;
				rSTB <= 1'b0;

	#20.1		rRST <= 1'b0;

	#20		rSTB <= 1'b1;
				rADR[31:0] <= 32'h0200_0000;
				rWE <= 1'b1;
				rDAT[31:0] <= 32'h0123_4567;

	#10			rSTB <= 1'b0;
				rADR[31:0] <= 32'h0000_0000;
				rWE <= 1'b0;
				rDAT[31:0] <= 32'h0000_0000;

	#20		    rSTB <= 1'b1;
				rADR[31:0] <= 32'h0200_0010;
				rWE <= 1'b1;
				rDAT[31:0] <= 32'h1111_1111;

	#10			rSTB <= 1'b0;
				rADR[31:0] <= 32'h0000_0000;
				rWE <= 1'b0;
				rDAT[31:0] <= 32'h0000_0000;
				
	#20		    rSTB <= 1'b1;
				rADR[31:0] <= 32'h0200_0020;
				rWE <= 1'b1;
				rDAT[31:0] <= 32'h2222_2222;

	#10			rSTB <= 1'b0;
				rADR[31:0] <= 32'h0000_0000;
				rWE <= 1'b0;
				rDAT[31:0] <= 32'h0000_0000;
*/
	#0			rRST <= 1'b1;
				rCLK <= 1'b1;
				rADR[31:0] <= 32'h0000_0000;
				rDAT[31:0] <= 32'h0000_0000;
				rWE <= 1'b0;
				rSTB <= 1'b0;

	#100.1		rRST <= 1'b0;

	#100    	rSTB <= 1'b1;
				rADR[31:0] <= 32'h0200_1004;
				rWE <= 1'b1;
				rDAT[31:0] <= 32'h0000_0011;

	#10			rSTB <= 1'b0;
				rADR[31:0] <= 32'h0000_0000;
				rWE <= 1'b0;
				rDAT[31:0] <= 32'h0000_0000;

	#10	    	rSTB <= 1'b1;
				rADR[31:0] <= 32'h0200_1000;
				rWE <= 1'b1;
				rDAT[31:0] <= 32'h0000_0012;

	#10			rSTB <= 1'b0;
				rADR[31:0] <= 32'h0000_0000;
				rWE <= 1'b0;
				rDAT[31:0] <= 32'h0000_0000;

end
	
always begin
	#5			rCLK <= ~rCLK;
end

endmodule

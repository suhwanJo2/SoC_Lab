`timescale 1ns / 1ps
module Timer(
	input			iRST,
	input			iCLK,
	
	input	[31:0]	iADR,
	input	[31:0]	iDAT,
	output	[31:0]	oDAT,
	input			iWE,
	input			iSTB,
	output			oACK,
	
	output	        oTOUT
    );
reg [31:0]   rReg0;  //counter parameter setting
reg [31:0]   rReg1; //mode setting
reg [31:0]   rRegCnt;   
wire         wSel;

//assign  wSel = iSTB & (iADR[3:0]==4'h0);
assign  oACK = iSTB;
//assign  oDAT[31:0] = (wSel & ~iWE) ? rReg0[31:0] : 32'hZZZZ_ZZZZ;

/////////////////*Data Read*/////////////////
reg [31:0]     rDAT;
assign oDAT[31:0] = rDAT[31:0];
always @(*) begin
    if(iSTB & ~iWE)begin
        case (iADR[3:0])
        4'h0:       rDAT[31:0] = rReg0[31:0];
        4'h4:       rDAT[31:0] = rReg1[31:0];
        default:    rDAT[31:0] = 32'hZZZZ_ZZZZ;
    endcase
    end
end

/////////////////*Data Write*/////////////////
always @(posedge iCLK)/*register parameter setting*/
begin
    if(iRST) begin
        rReg0[31:0] <= 32'hFFFF_FFFF;
        rReg1[31:0] <= 32'h0000_0000;
    end
    else begin
        if(iSTB & iWE) begin
            case (iADR[3:0])
                4'h0:       rReg0[31:0] <= iDAT[31:0]; 
                4'h4:       rReg1[31:0] <= iDAT[31:0]; 
                default:    ;
            endcase
        end
    end
end

reg rTOUT;
always @(posedge iCLK)/*counter setting*/
begin
    if(iRST) begin
        rRegCnt[31:0] <= 32'h0000_0000;
        rTOUT <= 1'b0;
    end
    else begin
        if(rReg1[0])begin
            if(rRegCnt[31:0] >= (rReg0[31:0] - 32'h1)) begin
                rRegCnt[31:0] <= 32'h0000_0000; 
                if(rReg1[1])begin   //pulse mode
                    rTOUT <= 1'b1;
                end
                else begin          //toggle mode
                    rTOUT <= ~rTOUT;
                end
            end
            else begin
                rRegCnt[31:0] <= rRegCnt[31:0] + 3'h0000_0001;
                if(rReg1[1])begin   //pulse mode
                    rTOUT <= 1'b0;
                end
            end
        end
    end
end

assign  oTOUT = rTOUT;
endmodule

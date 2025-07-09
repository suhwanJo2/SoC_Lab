module KEYPAD(
    input           iclk,
    input           inrest,
    input  [3:0]    iROW,
    output          oIRQ,
    output [3:0]    oCOL,
    output [15:0]   oKEYST,
    output [7:0]    oKEYNUM
);

reg             intr;
reg     [1:0]   rcnt;  
reg     [9:0]   rcnt2;
reg     [3:0]   rowz;
reg     [3:0]   rowzz;
reg     [3:0]   rowzzz;
reg     [3:0]   comb_oCOL;
reg     [7:0]   comb_KEYNUM;

assign oIRQ = intr;
assign oCOL = comb_oCOL;
assign oKEYNUM = comb_KEYNUM;



always @(*) begin
    case (rcnt)
    2'b00: comb_oCOL = 4'b1110; 
    2'b01: comb_oCOL = 4'b1101;
    2'b10: comb_oCOL = 4'b1011;
    2'b11: comb_oCOL = 4'b0111;
    default: comb_oCOL = 4'b1111;
    endcase
end

always @(*) begin
    case (iROW)
    4'b1110:begin
        if(rcnt == 2'b00) comb_KEYNUM = 8'h01;
        else if(rcnt == 2'b01) comb_KEYNUM = 8'h02;
        else if(rcnt == 2'b10) comb_KEYNUM = 8'h03;
        else comb_KEYNUM = 8'h0A;
    end 
    4'b1101:begin
        if(rcnt == 2'b00) comb_KEYNUM = 8'h04;
        else if(rcnt == 2'b01) comb_KEYNUM = 8'h05;
        else if(rcnt == 2'b10) comb_KEYNUM = 8'h06;
        else comb_KEYNUM = 8'h0B;        
    end
    4'b1011:begin
        if(rcnt == 2'b00) comb_KEYNUM = 8'h07;
        else if(rcnt == 2'b01) comb_KEYNUM = 8'h08;
        else if(rcnt == 2'b10) comb_KEYNUM = 8'h09;
        else comb_KEYNUM = 8'h0C;        
    end
    4'b0111:begin
        if(rcnt == 2'b00) comb_KEYNUM = 8'h00;
        else if(rcnt == 2'b01) comb_KEYNUM = 8'h0F;
        else if(rcnt == 2'b10) comb_KEYNUM = 8'h0E;
        else comb_KEYNUM = 8'h0D;        
    end
        default:comb_KEYNUM = 8'hFF;
    endcase
end

always @(posedge iclk) begin
    if (~inrest) begin
        rowz <= 4'b1111;
        rowzz <= 4'b1111;
        rowzzz <= 4'b1111;
    end
    else begin
        rowz[3:0] <= iROW[3:0];
        rowzz[3:0] <= rowz[3:0];
        rowzzz[3:0] <= rowzz[3:0];        
    end

end



always @(posedge iclk) begin
    if (~inrest) begin
        rcnt2 <= 10'd0;
        rcnt <= 2'd0;
        intr <= 1'b0;
    end
    else begin
        if ((rowzzz[0] & rowzzz[1] & rowzzz[2] & rowzzz[3]) == 1'b0) begin
            rcnt2 <= rcnt2;
            intr <= 1'b1;
        end
        else begin
            intr <= 1'b0;
            if (rcnt2 > 10'd500) begin
                rcnt <= rcnt + 2'd1;
                rcnt2 <= 10'd0;
            end
            else begin
                rcnt <= rcnt;
                rcnt2 <= rcnt2 + 2'd1;
            end
        end
    end
end

endmodule
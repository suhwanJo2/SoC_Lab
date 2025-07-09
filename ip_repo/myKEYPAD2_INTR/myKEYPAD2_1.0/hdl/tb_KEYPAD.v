module KEYPAD_tb;

    // ?��?��?���?? ?��?�� ?��?�� �?? 출력 ?��?�� ?��?��
    reg           iclk;
    reg           inrest;
    reg   [3:0]   iROW;
    reg   [4:0]   cnt;
    wire  [3:0]   oCOL;
    wire  [15:0]  oKEYST;
    wire  [7:0]   oKEYNUM;

    // DUT (Device Under Test) ?��?��?��?��?��
    KEYPAD uut (
        .iclk(iclk),
        .inrest(inrest),
        .iROW(iROW),
        .oCOL(oCOL),
        .oKEYST(oKEYST),
        .oKEYNUM(oKEYNUM)
    );

    // ?��?�� ?��?�� (50MHz �???��, 주기 20ns)
    initial begin
        iclk = 0;
        forever #10 iclk = ~iclk;
    end

    // ?��?��?�� ?��?��리오
    initial begin
        // 초기?��
        cnt <= 5'd0;
        inrest = 0;
        iROW = 4'b1111;
        
        // 리셋 ?��?��
        #50;
        inrest = 1;
        #1000000
        iROW = 4'b1011;

    end
    
/*always @(oCOL) begin
    if (oCOL == 4'b1101) begin
        if (cnt < 10) begin
            iROW <= 4'b1110;  // oCOL�� Ư�� ���� �� iROW�� ����
            cnt <= cnt + 1;
        end
        else begin
            iROW <= 4'b1111;
        end
    end 
    else begin
        iROW <= 4'b1111;  // �⺻ ���·� ����
    end
end
*/

endmodule

module myclk_testbench();
    logic clk, reset, myclk13khz;
    my9600clk  DUT(
        .clk(clk),
        .reset(reset),
        .my9600clk(myclk13khz)
    );

    always begin
        clk = 0; #5;
        clk = 1; #5;
    end
    
    initial begin
        reset = 1;
        @(posedge clk) reset = 0;
        @(posedge clk);
        $stop;
    end
endmodule
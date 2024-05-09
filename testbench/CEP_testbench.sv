module CEP_testbench ();
    logic clk, reset, valid_in, one_by_one_bit;
    logic [7:0]data_storing;
    logic myclk;

    CEP DUT(
        .clk(clk),
        .reset(reset),
        .valid_in(valid_in),
        .data_storing(data_storing),
        .one_by_one_bit(one_by_one_bit),
        .my9600clk(myclk)
    );
    
    always begin
        clk = 0; #5;
        clk = 1; #5;
    end

    initial begin
        reset = 1;
        valid_in <= 1;
        @(posedge clk) reset <= 0;
        @(posedge clk) data_storing <= 8'b01001001;
        @(posedge clk); 
        @(posedge clk); 
        @(posedge clk); 
        @(posedge clk); 
        @(posedge clk); 
        @(posedge clk); 
        @(posedge clk); 
        @(posedge clk); 
        @(posedge clk); 
        @(posedge clk); 
        @(posedge clk); 
        @(posedge myclk) valid_in  <= 0;
        @(posedge myclk); 
        $stop;
    end
endmodule
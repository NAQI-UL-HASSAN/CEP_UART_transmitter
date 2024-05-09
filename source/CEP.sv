module CEP( input logic valid_in,  clk, reset, [7:0]data_storing,
            output logic one_by_one_bit
          );
    logic my9600clk;
    logic [9:0] temp;
    my9600clk DUT(
        .clk(clk),
        .reset(reset),
        .my9600clk(my9600clk)
    );

    // shifting the input
    always_ff @(posedge my9600clk or posedge reset) begin
        if (reset) begin
            temp <= 10'b1111111111;
        end
        else if (valid_in) begin
            temp[9:2] <= data_storing;
            temp[1] <= 1'b0;
            temp[0] <= 1'b1;
        end
        else if (valid_in == 0) begin
            temp[0] <= temp[1];
            temp[1] <= temp[2];
            temp[2] <= temp[3];
            temp[3] <= temp[4];
            temp[4] <= temp[5];
            temp[5] <= temp[6];
            temp[6] <= temp[7];
            temp[7] <= temp[8];
            temp[8] <= temp[9];
            temp[9] <= 1'b1;         
        end
    end
    always_comb begin
        one_by_one_bit = temp[0];
    end
endmodule
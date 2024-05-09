module my9600clk( input logic clk, reset,
                output logic my9600clk = 1'b0
);
logic [15:0]q = 16'b0, d = 16'b0;
always_comb d = q + 1;
always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 16'd0;
        my9600clk <= 0;
    end
    else begin
        if (q == 16'd5208) begin
            q <= 16'd0;
            my9600clk <= ~ my9600clk;
        end
    else begin
        q <= d;
    end    
    end

end
    
endmodule
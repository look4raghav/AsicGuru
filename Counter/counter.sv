module counter(
    input wire clk,
    input wire rst,
    output reg [3:0] count
);

always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 4'b0;
    else
        count <= count + 1;
end

endmodule

module counter_tb();
    reg clk;
    reg rst;
    wire [3:0] count;

    counter uut(
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    initial begin
        clk = 1'b0;
        rst = 1'b1;
        #10 rst = 1'b0;
        #100 $finish;
    end

    always #5 clk = ~clk; 

initial begin
    $dumpfile("hello.vcd");
    $dumpvars(0, counter_tb);
end

endmodule

module mult(a, b, c);
input [7:0] a, b;
output [7:0] c;
wire [7:0] c;

wire [16:0] c_tmp;

assign c_tmp = a[7:0] * b[7:0];
assign c = c_tmp[16:9];

endmodule

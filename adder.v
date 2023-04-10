module b1_adder (
    input a,
    input b,
    input carry_in,

    output out,
    output carry_out
);

assign out = (a ^ b) ^ carry_in;

assign carry_out = (a & b) | ((a ^ b) & carry_in);

endmodule

`define add(i) b1_adder add_``i (.a(a[i]), .b(b[i]), .carry_in(c[i]), .out(sum[i]), .carry_out(c[i + 1]))

module b8_adder (
    input [7:0]a,
    input [7:0]b,

    output [7:0]sum
);

wire [8:0]c;
assign c[0] = 0;

//b1_adder add_0 (.a(a[0]), .b(b[0]), .carry_in(c_[0]), .out(sum[0]), .carry_out(c_[0 + 1]));

`add(0);
`add(1);
`add(2);
`add(3);
`add(4);
`add(5);
`add(6);
`add(7);

endmodule

`timescale 1ps/1ps

module testbench ();

reg [7:0]a;
reg [7:0]b;
wire [7:0]s;

b8_adder b8_adder_inst(.a(a), .b(b), .sum(s));

initial begin
    a = 100; b = 45; #1 $display("a = %d, b = %d, sum = %d", a, b, s);
end

endmodule
module conc(a, b, s);
	input [9:0] a, b;
	output [14:0] s;

	wire [14:0] s = {a[6:0],b[7:0]};
endmodule

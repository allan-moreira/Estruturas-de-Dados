module troca (a, b, c, out);
	input a, b, c;
	output out;
	
	assign out = (a==1) ? b : c;
endmodule

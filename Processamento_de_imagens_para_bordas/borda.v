module borda(a, b, c, out);
	input [2:0] a, b, c;
	output reg out;
	reg r1, r2;
	
	always@(*)
		begin
			if(a[0] & a[1] & a[2] & b[0] & b[1] & b[2] & c[0] & c[1] & c[2])
				r1 = 1;
			else
				r1 = 0;
			
			if(!a[0] & !a[1] & !a[2] & !b[0] & !b[1] & !b[2] & !c[0] & !c[1] & !c[2])
				r2 = 0;
			else
				r2 = 1;
		end
		
	always@(*)
		begin
			out = r1^r2;
		end
endmodule

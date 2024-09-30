module janela(h, v, s);
	input [9:0] v, h;
	output reg s;
	
	always @(h or v)
		begin	
			if(h > 'd255 || v > 'd127)
				s = 1'b0;
			else
				s = 1'b1;
		end
		
endmodule

module dec_7seg(hex_digit, out_7seg);
	input [3:0] hex_digit;
	output [6:0] out_7seg;
	
	reg [6:0] segment_data;
	
	always @(hex_digit)
		case (hex_digit)
			0: segment_data = 7'b 1111110;
			1: segment_data = 7'b 0110000;
			2: segment_data = 7'b 1101101;
			3: segment_data = 7'b 1111001;
			4: segment_data = 7'b 0110011;
			5: segment_data = 7'b 1011011;
			6: segment_data = 7'b 1011111;
			7: segment_data = 7'b 1110000;
			8: segment_data = 7'b 1111111;
			9: segment_data = 7'b 1111011;
			10: segment_data = 7'b 1110111;
			11: segment_data = 7'b 0011111;
			12: segment_data = 7'b 1001110;
			13: segment_data = 7'b 0111101;
			14: segment_data = 7'b 1001111;
			15: segment_data = 7'b 1000111;
			default: segment_data = 7'b 0111110;
		endcase

	assign out_7seg = segment_data;
endmodule

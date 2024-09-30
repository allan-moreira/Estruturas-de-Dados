module maquina_de_estado(clk, sw1, sw2, s1, s2, s3, s4, da0, db0, rst);
	input clk, s1, s2, s3, s4, rst;
	output reg sw1, sw2, da0, db0; 
	reg [2:0]state;
	
	parameter ABout = 3'b000, Bin = 3'b001, Astop = 3'b010, Bstop = 3'b011, Ain = 3'b100;
	
	always @ (posedge clk or posedge rst)
		begin
			if (rst)
				state = ABout;
			else
				case(state)
					ABout:
						if (!s1 && !s2)
							state = ABout;
						else if(s1 == 0 && s2 == 1)
							state = Bin;
						else if(s1)
							state = Ain;
					Ain:
						if (s2 == 0 && s4 == 0)
							state = Ain;
						else if(s4 == 0 && s2 == 1)
							state = Bstop;
						else if(s4)
							state = ABout;
					Bstop:
						if (s4 == 0)
							state = Bstop;
						else if(s4)
							state = Bin;
					Astop:
						if (s3)
							state = Ain;
						else if(s3 == 0)
							state = Astop;
					Bin:
						if (s1 == 0 && s3 == 0)
							state = Bin;
						else if(s3)
							state = ABout;
						else if(s1 && s3 == 0)
							state = Astop;
				endcase
		end
		
		always @ (state)
			begin
				case(state)
					ABout:
						begin
							sw1 = 0;
							sw2 = 0;
							da0 = 1;
							db0 = 1;
						end
					Bin:
						begin
							sw1 = 1;
							sw2 = 1;
							da0 = 1;
							db0 = 1;
						end
					Astop:
						begin
							sw1 = 1;
							sw2 = 1;
							db0 = 1;
							da0 = 0;
						end
					Bstop:
						begin
							sw1 = 0;
							sw2 = 0;
							da0 = 1;
							db0 = 0;
						end
					Ain:
						begin
							sw1 = 0;
							sw2 = 0;
							db0 = 1;
							da0 = 1;
						end
				endcase
			end
endmodule
						
			
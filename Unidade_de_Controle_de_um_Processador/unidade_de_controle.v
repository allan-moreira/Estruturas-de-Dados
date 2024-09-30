module unidade_de_controle(clk, rst, MW, MAR, AC);
	input clk, rst;
	output reg MW;
	output reg [7:0] MAR;
	output reg [15:0] AC;
	
	reg [7:0] PC;
	reg [15:0] IR, MDR;
	
	reg [3:0] state;
	parameter reset_pc = 0,
			  fetch = 1,
			  decode = 2, 
			  execute_add = 3, 
			  execute_store = 4, 
			  execute_store2 = 5, 
			  execute_load = 6,
			  execute_jump = 7,
			  execute_jneg = 8;
	
	altsyncram altsyncram_component(
		.wren_a(MW),
		.clock0(clk),
		.address_a(MAR),
		.data_a(AC),
		.q_a(MDR)
	);
	
	defparam
		altsyncram_component.operation_mode = "SINGLE_PORT",
		altsyncram_component.width_a = 16,
		altsyncram_component.widthad_a = 8,
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.ipm_pype = "altsyncram",
		altsyncram_component.init_file = "memory.mif",
		altsyncram_component.intended_devide_family = "Cyclone";
	
	always @(posedge clk or posedge rst)
		begin
			if(rst)
				state = reset_pc;
			else
				case(state)
					reset_pc:
						begin
							PC = 8'h00;
							AC = 16'h0000;
							state = fetch;
						end
					fetch:
						begin
							IR = MDR;
							PC = PC + 1;
							state = decode;
						end
					decode:
						begin
							case(IR[15:8])
								8'h00:
									state = execute_add;
								8'h01:
									state = execute_store;
								8'h02:
									state = execute_load;
								8'h03:
									state = execute_jump;
								8'h04:
									state = execute_jneg;
								default
									state = fetch;
							endcase
						end
					execute_add:
						begin
							AC = AC + MDR;
							state = fetch;
						end
					execute_store:
						begin
							state = execute_store2;
						end
					execute_store2:
						begin
							state = fetch;
						end
					execute_load:
						begin
							AC = MDR;
							state = fetch;
						end
					execute_jump:
						begin
							PC = IR[7:0];
							state = fetch;
						end
					execute_jneg:
						begin
							if(AC[15])
								PC = IR[7:0];
							state = fetch;
						end
					default:
						state = fetch;
				endcase
		
		end
		
	always @(state or PC or IR)
		begin
			case(state)
				reset_pc:		MAR = 8'b00000000;
				fetch:			MAR = PC;
				decode:			MAR = IR[7:0];
				execute_add:	MAR = PC;
				execute_store:	MAR = IR[7:0];
				execute_store2: MAR = PC;
				execute_load:	MAR = PC;
				execute_jump:	MAR = IR[7:0];
				execute_jneg:	MAR = IR[7:0];
				default:		MAR = PC;
			endcase
			case(state)
				execute_store:	MW = 1;
				default:		MW = 0;
			endcase
		end
endmodule

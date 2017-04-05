module batalha(
	input ja_1,
	input ja_2,
	input ja_3,
	input jb_1,
	input jb_2,
	input jb_3,
	output s1,
	output s2
	);

reg reg_s1, reg_s2;
reg [2:0] codificado;
wire [2:0] ja_fios;
wire [2:0] jb_fios;
assign s2 = reg_s2;
assign s1 = reg_s1 & reg_s2;

assign ja_fios = {ja_1, ja_2, ja_3 };
assign jb_fios = {jb_1, jb_2, jb_3 };

always @(ja_fios) begin
	case(ja_1)
		2'b1: codificado[2] <= 0;
		2'b0: codificado[2] <= 1;
	endcase

	case(ja_2)
		2'b0: codificado[1] <= 1;
		2'b1: codificado[1] <= 0;
	endcase

	case(ja_3)
		2'b0: codificado[0] <= 1;
		2'b1: codificado[0] <= 0;
		endcase
end
always @(*) begin
	if(codificado == jb_fios)begin
			reg_s1 <= 2'b1;
	end
	else begin
		reg_s1 <= 2'b0;
	end
end
always @(*) begin
	if((ja_1 == ja_2 && ja_2 == ja_3) || (jb_1 == jb_2 && jb_2 == jb_3)) begin
		reg_s2 <= 2'b0;
	end
	else begin
		reg_s2 <= 2'b1;
	end
end

endmodule

module teste;
reg ja_1, ja_2, ja_3, jb_1, jb_2, jb_3;
wire s1, s2;

batalha bat(ja_1, ja_2, ja_3, jb_1, jb_2, jb_3, s1, s2);

initial begin
	$dumpvars(0, bat);
	#2;
	ja_1 <= 2'b0; ja_2 <= 2'b0; ja_3 <= 2'b1; jb_1 <= 2'b1; jb_2 <= 2'b1; jb_3 <= 2'b0;
	#2;
	ja_1 <= 2'b1; ja_2 <= 2'b1; ja_3 <= 2'b1; jb_1 <= 2'b0; jb_2 <= 2'b0; jb_3 <= 2'b0;
	#2;
	ja_1 <= 2'b0; ja_2 <= 2'b0; ja_3 <= 2'b1; jb_1 <= 2'b1; jb_2 <= 2'b1; jb_3 <= 2'b0;
	#2;
	ja_1 <= 2'b0; ja_2 <= 2'b1; ja_3 <= 2'b0; jb_1 <= 2'b1; jb_2 <= 2'b1; jb_3 <= 2'b0;
	#2;
end

endmodule
module pisca(
	input clo,
	input res,
	output s1
	);
reg sinal;
assign s1 = sinal;

always @(clo) begin
	sinal <= ~sinal;
end

always @(res) begin
	sinal <= 0;
end

endmodule

module teste_pisca;

wire s1;
reg clk, res;

pisca p(clk, res, s1);

always #2 begin
	clk <= ~clk;
end

initial begin
	$dumpvars(0, p);
	#2;
	clk <= 1;
	#2;
	res <= 0;
	#5;
	clk <= 1;
	#300;
	$finish;
end

endmodule
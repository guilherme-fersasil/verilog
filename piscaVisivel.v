module piscaVisivel(
	input CLOCK_50,
	output [1:0]LEDG
);

	reg [32:0] counter;
	reg saida;
	assign LEDG = saida;

	always@(posedge CLOCK_50)begin
		counter <= counter + 1;
		saida <= LEDG[24];
	end

endmodule
module sinal(
	input [10:0] p1x,
	input [10:0] p1y,
	input [10:0] p2x,
	input [10:0] p2y,
	input [10:0] p3x,
	input [10:0] p3y,
	output s1
	);

wire [20:0] aux1;
wire [20:0] aux2;
wire [20:0] aux3;
wire [20:0] aux4;

assign aux1 = p1x - p3x;
assign aux2 = p2y - p3y;
assign aux3 = p2x - p3x;
assign aux4 = p1y - p3y;
assign s1 = (aux1 * aux2) - (aux3 * aux4);

endmodule

module pontoNoTriangulo(
	input [10:0] p1x,
	input [10:0] p1y,
	input [10:0] p2x,
	input [10:0] p2y,
	input [10:0] p3x,
	input [10:0] p3y,
	input [10:0] ptx,
	input [10:0] pty,
	output s1
	);

wire b1;
wire b2;
wire b3;

reg s1_reg;

assign s1 = s1_reg;

sinal a(ptx, pty, p1x, p1y, p2x, p2y, b1);
sinal b(ptx, pty, p2x, p2y, p3x, p3y, b2);
sinal c(ptx, pty, p3x, p3y, p1x, p1y, b3);

always @(*) begin
	if(b1 == b2 && b2 == b3)begin
		s1_reg <= 1;
	end		
	else begin
		s1_reg <= 0;
	end
end

endmodule

module teste;

reg [10:0] p1x;
reg [10:0] p1y;
reg [10:0] p2x;
reg [10:0] p2y;
reg [10:0] p3x;
reg [10:0] p3y;
reg [10:0] ptx;
reg [10:0] pty;
wire s1;

pontoNoTriangulo a(p1x, p1y, p2x, p2y, p3x, p3y, ptx, pty, s1);

initial begin
	$dumpvars(0, a);
	#6;
	p1x <= 4; p1y <= 9; 
	p2x <= 9; p2y <= 5;
	p3x <= 12; p3y <= 11;
	ptx <= 9; pty <= 9;
	#6;
	p1x <= 6; p1y <= 1; 
	p2x <= 9; p2y <= 3;
	p3x <= -4; p3y <= 15;
	ptx <= -5; pty <= -4;
	#6;
	p1x <= 1; p1y <= 2; 
	p2x <= 1; p2y <= 2;
	p3x <= 2; p3y <= 21;
	ptx <= 3; pty <= 1;
	#6;
	p1x <= 6; p1y <= 7; 
	p2x <= 7; p2y <= 8;
	p3x <= 8; p3y <= 18;
	ptx <= 9; pty <= 0;
	#6;
	p1x <= 4; p1y <= 9; 
	p2x <= 9; p2y <= 5;
	p3x <= 12; p3y <= 11;
	ptx <= 9; pty <= 9;
	#12


	$finish;

end

endmodule

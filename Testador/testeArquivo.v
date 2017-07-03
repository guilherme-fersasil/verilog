module sinal(
    input [10:0] p1x,
    input [10:0] p1y,
    input [10:0] p2x,
    input [10:0] p2y,
    input [10:0] p3x,
    input [10:0] p3y,
    output sign
    );

assign sign = (p1x - p3x) * (p2y - p3y) - (p2x - p3x) * (p1y - p3y);

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
    
    wire res;

    pontoNoTriangulo teste(p1x, p1y, p2x, p2y, p3x, p3y, ptx, pty, res);
    integer entrada, saida, aux;
    reg clk;
    always # 2 clk = !clk;
    initial begin
        clk = 0;
        entrada = $fopen("entrada.txt", "r");
        saida = $fopen("saidaVerilog.txt", "w");
        while(!$feof(entrada)) begin
            @(posedge clk);
            aux = $fscanf(entrada, "%d %d %d %d %d %d %d %d\n", p1x, p1y, p2x, p2y, p3x, p3y, ptx, pty);
            @(posedge clk);
            if(res == 1) begin
                $fwrite(saida, "Ok\n");
            end 
            else begin
            $fwrite(saida, "Nop\n");
            end
        end
        $fclose(entrada);
        $fclose(saida);
        #100 $finish;
    end
endmodule

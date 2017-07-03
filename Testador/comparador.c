#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){
	FILE* saida, *entradaVerilog, *entradaC;
	saida = fopen("resultado.txt", "w+");
	entradaC = fopen("t3Saida.txt", "r");
	entradaVerilog = fopen("saidaVerilog.txt", "r");
	char sv[100], sc[100];

	if(entradaC == NULL || entradaVerilog == NULL ){
		printf("Falha\n");
		exit(1);
	}

	while((fscanf(entradaVerilog ,"%s", sv)) != EOF);
	while((fscanf(entradaC ,"%s", sc)) != EOF);
	if (strcmp(sv, sc) == 1){
		fprintf(saida, "%s\n", "OK");
		printf("OK\n");
	}
	else{
		printf("NOP\n");
		fprintf(saida, "%s\n", "NOP");
		}

	fclose(saida);
	fclose(entradaC);
	fclose(entradaVerilog);


	return 0;
}
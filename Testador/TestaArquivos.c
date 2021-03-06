//Uma parte da lógica deste código foi retirada de: http://blackpawn.com/texts/pointinpoly/

#include <stdio.h>
#include <stdlib.h>

typedef struct{
	float x;
	float y;

} fP;

float sinal (fP p1, fP p2, fP p3){
    return (p1.x - p3.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p3.y);
}

int pontoNoTriangulo(fP pt, fP v1, fP v2, fP v3){
    int b1, b2, b3;

    b1 = sinal(pt, v1, v2) < 0.0f;
    b2 = sinal(pt, v2, v3) < 0.0f;
    b3 = sinal(pt, v3, v1) < 0.0f;

    if(((b1 == b2) && (b2 == b3)))
    	return 1;

    else
    	return 0;
}

int main(){
	FILE* saida, *entrada;
	saida = fopen("t3Saida.txt", "w+");
	entrada = fopen("entrada.txt", "r");
	fP A, B, C, P1;

	if(entrada == NULL){
		printf("Falha\n");
		exit(1);
	}

	while((fscanf(entrada,"%f %f %f %f %f %f %f %f\n", &A.x, &A.y, &B.x, &B.y, &C.x, &C.y, &P1.x, &P1.y)) != EOF){
		if(pontoNoTriangulo(P1, A, B, C)){
			fprintf(saida, "%s\n", "OK");
			printf("OK %f\n", A.x);
		}
		else{
			printf("NOP\n");
			fprintf(saida, "%s\n", "NOP");
		}
	}

	fclose(saida);
	fclose(entrada);

	return 0;
}
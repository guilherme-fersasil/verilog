
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
	fP A, B, C, P1;
	puts("Digite o x de a");
	scanf("%f", &A.x);
	puts("Digite o y de a");
	scanf("%f", &A.y);
	puts("Digite o x de b");
	scanf("%f", &B.x);
	puts("Digite o y de b");
	scanf("%f", &B.y);
	puts("Digite o x de c");
	scanf("%f", &C.x);
	puts("Digite o y de c");
	scanf("%f", &C.y);
	puts("Digite o x do ponto");
	scanf("%f", &P1.x);
	puts("Digite o y do ponto");
	scanf("%f", &P1.y);
	
	if(pontoNoTriangulo(P1, A, B, C)){
		printf("OK\n");
	}
	else{
		printf("FALSO\n");
	}

	return 0;
}

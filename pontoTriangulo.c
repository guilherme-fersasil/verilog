//Uma parte da lógica deste código foi retirada de: http://blackpawn.com/texts/pointinpoly/

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

double ponto(double v1, double v2){
	return v1 * v2;
}

/*
//Se v ou u < 0 significa que o ponto esta fora do triangulo 
//Também se u or v > 1 significa que o ponto esta fora do triângulo
// Por último se u + v > 1 a borda BC do triângulo foi crusada, então o ponto não está no triângulo
*/

bool verificaPonto(double u, double v){
	return (u >= 0) && (v >= 0) && (u + v < 1);

}

int main(){
	double A, B, C, P, bari, u, v, v0, v1, v2, ponto00, ponto01, ponto02, ponto11, ponto12;
	bool verifica;
	puts("Digite o primeiro lado triângulo(A)");
	scanf("%lf", &A);
	puts("Digite o segundo lado do triângulo(B)");
	scanf("%lf", &B);
	puts("Digite o terceiro lado do triângulo(C)");
	scanf("%lf", &C);
	puts("Digite o ponto");
	scanf("%lf", &P);
	/*Pode se descrever todo ponto em um plano com essa formula; P = A + u * (C - A) + v * (B - A)
	  Reorganizando a formula temos: v2 = u * v0 + v * v1;
	  Também temos u e v que necessitamos descobrir, logo reorganizamos a formula mais uma vez a fim de achar modos de descobrir ambas icógnitas
	   u = ((v1.v1)(v2.v0)-(v1.v0)(v2.v1)) / ((v0.v0)(v1.v1) - (v0.v1)(v1.v0))
       v = ((v0.v0)(v2.v1)-(v0.v1)(v2.v0)) / ((v0.v0)(v1.v1) - (v0.v1)(v1.v0))
	*/

	//Criar variáveis v0, v1, v2 para facilitar a leitura do código

	v0 = C - A;
	v1 = B - A;
	v2 = P - A;

	//Criar as variáveis abaixo para facilitar a leitura do código 

	ponto00 = ponto(v0, v0);
	ponto01 = ponto(v0, v1);
	ponto02 = ponto(v0, v2);
	ponto11 = ponto(v1, v1);
	ponto12 = ponto(v1, v2);

	//Calcular coordenados do baricentro
	bari = 1/(ponto00 * ponto11 - ponto01 * ponto01);
	
	//Econtrar os valores de v1 e v2
	u = (ponto11 * ponto02 - ponto01 * ponto12) * bari;
	v = (ponto00 * ponto12 - ponto01 * ponto02) * bari;
	
	//Função que retorna os verdadeiro ou falso de acordo com a lógica
	verifica = verificaPonto(u, v);
	
	if(verifica)
		printf("Ok\n");

	else
		printf("falso\n");

	return 0;
}
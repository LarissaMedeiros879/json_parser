%{

#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);

%}

%token CA CF DP V NUMI NUMF NOME PA PF A

%%

PROGRAMA:
        EXPRESSAO { printf("VALIDO\n"); 
		return 0;
		}
        |
        ;


EXPRESSAO:
    CA ELEMENTOS CF
    ;
    
ELEMENTOS:
	ELEMENTO
	|ELEMENTO V ELEMENTOS
	;
    
ELEMENTO:
	A NOME A DP OBJETO
	;
	
OBJETO:
	NUMF 
	|NUMI
	|A NOME A
	|LISTA
	|CA ELEMENTOS CF
	;
	
LISTA:
	PA VAZIO PF
	|PA ITENS PF
	|PA LISTA PF
	;
	
ITENS:
	ITEM
	|ITEM V ITENS

ITEM:
	NUMI
	|NUMF
	|A NOME A
	;
	
VAZIO:
	
	;

%%

void yyerror(char *s) {
	printf("INVALIDO\n");
}

int main() {
  yyparse();
  return 0;

}



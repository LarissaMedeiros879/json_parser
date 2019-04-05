
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"
%}


%%

[0-9]+[.][0-9]+  {
		/* printf("float! %f\n", atof(yytext)); */
		/* printf("Achou float"); */
          return NUMF;
        }
        
[0-9]+ {
          /* printf("Achou inteiro"); */ 
		  return NUMI;
        }

[{]     {
          return CA;
        }
        
[}]     {
          return CF;
        }
        
[,]		{
		return V;
}
        
[:]     {
          return DP;
        }
        
		
[a-zA-Z0-9]* {
			/* printf("Achou nome"); */
			return NOME;
		}
		
[[] {
	return PA;
}

[]] {
 	return PF;
 }
 
["] {
	return A;
}


[ \t\n;]+ 


%%

int yywrap() {
  return 1;
}

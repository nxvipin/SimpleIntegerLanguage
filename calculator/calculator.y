%{
	#include<stdio.h>
%}

%token INTEGER
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
program	:	program expr '\n' { printf("%d\n", $2);}
		| 
		; 
expr	:	INTEGER	{ $$ = $1; }
		| expr '+' expr { 
							$$ = $1 + $3; 
						}
		| expr '-' expr { 
							$$ = $1 - $3;
						}
		| expr '*' expr {
							$$ = $1 * $3;
						}
		| expr '/' expr {
							$$ = $1 / $3;
						}
		| '(' expr ')'	{ 
							$$ = $2; 
						}
		;
%%

int yyerror(char *s) {
	printf("%s\n", s);
	return 0;
}
int main(void) {
	yyparse();
	return 0;
}


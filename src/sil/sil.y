%{
	#include "sil.h"
%}

%union {
	ASTnode *T;
}

%start			program
%token	<T>		INTEGER
%type	<T>		expr
%left	<T>		'+' '-'
%left	<T>		'*' '/'
%left	<T>		'(' ')'

%%
program	:	program expr '\n'	{ 
									printf("Done");
								}
		| 
		; 
expr	:	INTEGER	{
						$$ = $1;
					}
		| expr '+' expr	{
							$$ = $2;
							$$->l = $1;
							$$->r = $3;
						}
		| expr '-' expr	{
							$$ = $2;
							$$->l = $1;
							$$->r = $3;
						}
		| expr '*' expr	{
							$$ = $2;
							$$->l = $1;
							$$->r = $3;
						}
		| expr '/' expr	{
							$$ = $2;
							$$->l = $1;
							$$->r = $3;
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


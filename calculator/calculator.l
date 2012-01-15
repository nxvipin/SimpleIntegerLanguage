%{
#include<stdio.h>
#include<string.h>
#include "y.tab.h"
%}
%%
[0-9]+ {
	yylval = atoi(yytext);
	return INTEGER;
}
[-+*/()\n] {
	return *yytext;
}
[\t] {
	;
}
%%
int yywrap(void) {
	return 1;
}



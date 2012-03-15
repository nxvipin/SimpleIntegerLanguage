%{
#include "sil.h"
#include "y.tab.h"
%}

%%
[0-9]+ {
	yylval.T = allocateNode(atoi(yytext),0,'\0');
	return INTEGER;
}
[-+*/()\n] {
	switch(yytext[0]){
		case '+':	yylval.T = allocateNode(0,ADD,'+');
			break;
		case '-':	yylval.T = allocateNode(0,SUB,'-');
			break;
		case '*':	yylval.T = allocateNode(0,MUL,'*');
			break;
		case '/':	yylval.T = allocateNode(0,DIV,'/');
			break;
		default :	;
	}
	return yytext[0];
}
[\t] {
	;
}
%%

ASTnode* allocateNode(int value,int flg,char optr)
{
	ASTnode *N;
	N = malloc(sizeof(ASTnode));
	N->val = value;
	N->flag = flg;
	N->op = optr;
	N->l = N->r = NULL;
	return N;
}

int yywrap(void) {
	return 1;
}





#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define ADD 1
#define SUB 2
#define MUL 3
#define DIV 4

typedef struct ASTnode{
		int val;
		char op;
		int flag;
		struct ASTnode *l, *r;
} ASTnode;

ASTnode* allocateNode(int, int, char);

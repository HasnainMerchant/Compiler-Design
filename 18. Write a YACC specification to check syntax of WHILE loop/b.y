%{
#include <stdio.h>
void yyerror(char *);
int yylex();
%}

%token WHILE NUM ID OP ROP LOP
%%

line: WHILE '(' C ')' '{' L '}' {printf("Valid While Statement\n");}
;

C:   ID 
   | NUM 
   | ID ROP ID 
   | C LOP C
   ;

L:   A 
   | A L
   ;

A:   ID '=' ID OP ID ';' 
   | ID '=' ID OP NUM ';'
   ;

%%
int yywrap() {return 1;}
void yyerror(char *s)
{
  printf("\nParsing Error\n");
}
int main()
{
  yyparse();
}
%{
#include<stdio.h>
void yyerror(char *);
int yylex();
%}

%token SWITCH CASE DEFAULT ID NUM OP

%%

line : accept {printf("\nValid Syntax\n");};

accept : SWITCH '(' ID ')' '{' body '}'
;

body : CASE NUM ':' L
     | DEFAULT ':' L
;

L : A
  | A L
;

A: ID '=' ID OP ID ';'
;

%%

void yyerror(char *s)
{
  printf("\nParsing Error\n");
}


int main()
{
  while(1)
  {
    printf("\nEnter Expression - ");
    yyparse();
  }
  return 0;
}
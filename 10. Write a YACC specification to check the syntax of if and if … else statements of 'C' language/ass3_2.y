%{
#include<stdio.h>
void yyerror(char *);
int yylex();
%}

%token IF ELSE ID NUM OP AND OR NTEQ EQ LTEQ GTEQ LT GT

%%

line : accept {printf("\nValid Syntax\n");};

accept : IF '(' cond ')' '{' L '}' ELSE '{' L '}'
       | IF '(' cond ')' '{' L '}'
;

cond : scond
     | scond logop cond
;

scond : nid
      | nid relop nid
;

nid : ID
    | NUM
;

logop : AND
      | OR
;

relop : NTEQ
      | EQ
      | LTEQ
      | GTEQ
      | LT
      | GT
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
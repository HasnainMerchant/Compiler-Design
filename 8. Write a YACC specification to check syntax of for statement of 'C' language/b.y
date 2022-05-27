%{
#include<stdio.h>
void yyerror(char *);
int yylex();
%}

%token FOR ID NUM OP NTEQ EQ LTEQ GTEQ LT GT

%%

line : accept {printf("\nValid Syntax\n");}
;

accept : FOR '(' E ';' E2 ';' E3 ')' '{' L '}'
;

E : ID '=' nid
;

E2 : ID relop nid
;

nid : ID
    | NUM
;

relop : NTEQ
      | EQ
      | LTEQ
      | GTEQ
      | LT
      | GT
;

E3 : ID '++'
        | ID '--'
        | ID '+=' NUM
        | ID '-=' NUM
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
  printf("\nEnter Expression - \n");
  yyparse();
  return 0;
}
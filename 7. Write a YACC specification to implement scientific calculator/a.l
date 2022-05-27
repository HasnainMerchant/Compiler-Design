%{
#include "y.tab.h"
void yyerror(char *);
%}

%%

[0-9]+ { yylval = atoi(yytext); return NUMBER; }
"sin" {return SIN;}
"cos" {return COS;}
"tan" {return TAN;}
"log" {return LOG;}
"sqrt" {return SQRT;}
[\t] ;
[\n] return 0;
. return yytext[0];

%%

int yywrap()
{
return 1;
}
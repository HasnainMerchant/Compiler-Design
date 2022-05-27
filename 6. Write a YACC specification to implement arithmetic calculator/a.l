%{
#include "y.tab.h"
void yyerror(char *);
%}

%%

[0-9]+ { yylval = atoi(yytext); return NUMBER; }
[\t] ;
[\n] return 0;
. return yytext[0];

%%

int yywrap()
{
return 1;
}
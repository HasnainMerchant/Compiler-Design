%{
#include "y.tab.h"
void yyerror(char *);
%}

%%

"switch" {return SWITCH;}
"case" {return CASE;}
"default" {return DEFAULT;}
[a-zA-Z_][a-zA-Z0-9_]* {return ID;} //Identifier
[0-9]+ {return NUM;} //Number
"+" {return OP;}
"-" {return OP;}
"/" {return OP;}
"*" {return OP;}

[=,{}();] {return *yytext;}
[ \t\n]+ ; //Ignore whitespaces

. {printf("\n[-]LEX ERROR\n");}
%%

int yywrap()
{
return 1;
}
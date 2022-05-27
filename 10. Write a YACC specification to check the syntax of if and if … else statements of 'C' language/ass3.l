%{
#include "y.tab.h"
void yyerror(char *);
%}

%%

"if" {return IF;}
"else" {return ELSE;}
[a-zA-Z_][a-zA-Z0-9_]* {return ID;} //Identifier
[0-9]+ {return NUM;} //Number
"+" {return OP;}
"-" {return OP;}
"/" {return OP;}
"*" {return OP;}
"&&" {return AND;}
"||" {return OR;}
"!=" {return NTEQ;}
"==" {return EQ;}
"<=" {return LTEQ;}
">=" {return GTEQ;}
"<" {return LT;}
">" {return GT;}

[=,{}();] {return *yytext;}
[ \t\n]+ ; //Ignore whitespaces

. {printf("\n[-]LEX ERROR\n");}
%%

int yywrap()
{
return 1;
}
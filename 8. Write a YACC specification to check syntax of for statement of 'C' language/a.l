%{
#include "y.tab.h"
void yyerror(char *);
%}

%%

"for" {return FOR;}
[a-zA-Z] {return ID;} //Identifier
[0-9]+ {return NUM;} //Number
"+" {return OP;}
"-" {return OP;}
"/" {return OP;}
"*" {return OP;}
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
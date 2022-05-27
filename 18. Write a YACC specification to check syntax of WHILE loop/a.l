%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[ \t\n]+ ;
while {return WHILE;}
[a-zA-Z_][a-zA-Z0-9_]* {return ID;}
[0-9]+ {return NUM;}
'+' | '-' | '*' | '/' {return OP;}
'<' | '>' | '<=' | '>=' | '==' | '!=' {return ROP;}
'&&' | '||' {return LOP;}
[= , {} () ;] {return *yytext;}
%%
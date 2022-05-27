/*Decalration Section*/
%{
#include<stdio.h>
%}

%%
[\t]+ ;

is |
am |
are |
were |
was |
be |
being |
been |
do |
does |
did |
should |
can |
could |
has |
have |
had |
go {printf("%s: is a verb\n", yytext);}

very |
simply |
gently |
quietly |
calmly |
angrily {printf("%s: is a adverb\n", yytext);}

if |
the |
and | 
but |
or {printf("%s: is a conjunction\n", yytext);}

to |
from |
behind |
above |
below |
between |
below {printf("%s: is a preposition\n", yytext);}

their |
my |
your |
his |
her |
its {printf("%s: is a adjective\n", yytext);}

i |
you |
he |
she |
we |
they {printf("%s: is a pronoun\n", yytext);}

[a-zA-Z]+ {printf("%s: Cant Identify\n", yytext);}

%%
/*Subroutine Section*/

int yywrap() {return 1;}
main()
{
yylex();
}
/*Decalration Section*/
%{
#include<stdio.h>
int word_count = 0;
%}

%%
[\t\n]+ ;

[a-zA-Z]+ {word_count++;}

%%
/*Subroutine Section*/

int yywrap() {return 1;}
main(int argc, char *argv[])
{
yyin = fopen(argv[1], "r");
yylex();
printf("Total Words In File = %d", word_count);
}
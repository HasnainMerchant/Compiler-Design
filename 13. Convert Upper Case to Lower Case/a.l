%{
#include<stdio.h>
#include<string.h>
%}

%%
[a-z]+ {printf("%s",strupr(yytext));}
[A-Z]+ {printf("%s",strlwr(yytext));}

[0-9]+ ;
%%

int yywrap(){return 1;}
int main()
{
printf("\nEnter String - ");
yylex();
printf("New String Is - \n");
return 0;
}
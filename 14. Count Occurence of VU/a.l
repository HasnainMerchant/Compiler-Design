%{
#include<stdio.h>
#include<string.h>
int count = 0;
%}

%%
"vu" {count++;} 
"vU" {count++;}
"Vu" {count++;}
"VU" {count++;}
"\n" {printf("%d\n", count);}
%%

int yywrap(){return 1;}

int main()
{
printf("Enter String - ");
yylex();
return 0;
}

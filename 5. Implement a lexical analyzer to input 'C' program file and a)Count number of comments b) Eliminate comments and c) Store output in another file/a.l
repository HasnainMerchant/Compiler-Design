%{
#include<stdio.h>
int count = 0;
%}

start \/\*
end  \*\/

%%
  
\/\/.* {count++;}
{start}.*{end} {count++;}
  
%%

int yywrap(){return 1;}
int main(int argc,char *argv[])
{
yyin = fopen(argv[1],"r");
yyout = fopen("out.txt","w");
yylex();
printf("Number Of Comments in Input File = %d", count);
return 0;
}
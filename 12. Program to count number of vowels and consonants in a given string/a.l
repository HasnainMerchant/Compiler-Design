%{
#include<stdio.h>
int vowels = 0;
int len;
%}

%%
  
a |
A | 
e |
E | 
i |
I | 
o |
O | 
u |
U  {vowels++;}

; {con++;}

\n {printf("Number Of Vowels in String = %d", vowels);
printf("Number Of Consonants in String = %d", len - vowels); }
%%

int yywrap(){return 1;}
int main()
{
printf("\nEnter String - ");
scanf("%s", yyin);
len = strlen(len);
yylex();
return 0;
}